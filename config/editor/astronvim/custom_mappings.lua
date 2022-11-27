return {
  n = {
    ["<leader>"] = {
      ["b"] = {
        "Buffer",
        ["t"] = { "<cmd>BufferLineSortByTabs<cr>", "Sort by tabs" },
        b = { "<cmd>tabnew<cr>", "New tab" },
        c = { "<cmd>BufferLinePickClose<cr>", "Pick to close" },
        j = { "<cmd>BufferLinePick<cr>", "Pick to jump" },
      },

      ["mr"] = { "<cmd>FSToggle<cr>", "Toggle reading mode" },

      h = {
        w = { "<cmd>HopWord<cr>", "Hop Word" },
      },
    },
  },
}
