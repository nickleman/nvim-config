return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  keys = {
    -- Press Spacebar + o + o to open the AI interactive prompt window
    { "<leader>oo", ":Ollama<CR>", desc = "Open Ollama Menu", mode = { "n", "v" } },
  },
  opts = {
    model = "qwen3-coder:30b", -- Your high-speed MoE model
    url = "http://127.0.0.1:11434",
    serve = {
      on_start = false, -- CachyOS background service handles this
    }
  },
}
