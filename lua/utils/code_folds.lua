local M = {}

local fold_ranges = {}     -- { [bufnr] = { { start_line = <1 based>, end_line = <1 based> }, }, }
local fold_ranges_map = {} -- { [bufnr] = { [start_line] = { start_line = <1 based>, end_line = <1 based> }, }, }
local current_fold = nil   -- { start_line = <1 based>, end_line = <1 based> }

local pending = {} -- { [bufnr] = timer }, debounce for update_ranges

local function request_ranges(bufnr)
    if not vim.api.nvim_buf_is_valid(bufnr) then return end
    local client = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/foldingRange" })[1]
    if not client then return end

    local params = { textDocument = { uri = vim.uri_from_bufnr(bufnr) } }
    local tick = vim.b[bufnr].changedtick

    client:request("textDocument/foldingRange", params, function(err, ranges)
        if err
            or not ranges
            or not vim.api.nvim_buf_is_valid(bufnr)
            or tick ~= vim.b[bufnr].changedtick
        then
            return
        end

        -- Rebuild fold ranges as a map for O(1) in statuscol
        local ranges_map = {}
        for i, range in ipairs(ranges) do
            ranges[i] = {
                start_line = range.startLine + 1,
                end_line = range.endLine + 1
            }
            ranges_map[range.startLine + 1] = ranges[i]
        end

        -- Sort fold ranges for goto prev fold search
        table.sort(ranges, function(a, b)
            return a.start_line < b.start_line
        end)

        fold_ranges_map[bufnr] = ranges_map
        fold_ranges[bufnr] = ranges
    end)
end

--- Debounced entry point. This is wired to TextChanged, so calling straight through
--- would issue one textDocument/foldingRange request per keystroke. The changedtick
--- guard in request_ranges() discards stale *responses*, but the requests were still
--- being sent; this collapses a burst of edits into a single request.
function M.update_ranges(bufnr)
    if pending[bufnr] then
        pending[bufnr]:stop()
    end
    pending[bufnr] = vim.defer_fn(function()
        pending[bufnr] = nil
        request_ranges(bufnr)
    end, 200)
end

function M.update_current_fold(row, bufnr)
    local ranges = fold_ranges[bufnr]
    if not ranges then return nil end

    local best_range = nil

    for i = 1, #ranges do
        local range = ranges[i]
        if range.start_line > row then break end

        if row <= range.end_line then
            best_range = range
        end
    end

    current_fold = best_range
end

function M.clear(bufnr)
    if pending[bufnr] then
        pending[bufnr]:stop()
        pending[bufnr] = nil
    end
    fold_ranges[bufnr] = nil
    fold_ranges_map[bufnr] = nil
end

function M.goto_previous_fold()
    local bufnr = vim.api.nvim_get_current_buf()
    local ranges = fold_ranges[bufnr]
    if not ranges or #ranges == 0 then return end

    local row = vim.api.nvim_win_get_cursor(0)[1]

    for i = #ranges, 1, -1 do
        local start_line = ranges[i].start_line

        if start_line < row then
            return vim.api.nvim_win_set_cursor(0, { start_line, 0 })
        end
    end
end

function M.statuscol()
    local winid = vim.g.statusline_winid
    local bufnr = vim.api.nvim_win_get_buf(winid)
    local lnum = vim.v.lnum

    local fold_map = fold_ranges_map[bufnr]
    if not fold_map then return "%l   " end

    local this_range = fold_map[lnum]
    if not this_range then return "%l   " end

    local closed      = (vim.fn.foldclosed(lnum) == lnum)
    local icon        = closed and "" or ""

    local hl          = "FoldColumn"
    local cursor_fold = current_fold
    if cursor_fold and this_range.start_line == cursor_fold.start_line then
        hl = "CursorLineNr"
    end

    return "%l " .. "%#" .. hl .. "#" .. icon .. "%* "
end

return M
