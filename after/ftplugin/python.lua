-- Don't have vim wrap on words not characters
--  NOTE: opt_local throughout. `vim.o.textwidth` here would set the *global* value,
--  leaking textwidth=0 into every buffer opened after the first Python file.
vim.opt_local.wrap = false
vim.opt_local.linebreak = false
vim.opt_local.textwidth = 0
