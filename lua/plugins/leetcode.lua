-- open with `nvim leetcode.nvim` for a dedicated session, or `:Leet` anywhere
local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Leet",
  lazy = leet_arg ~= vim.fn.argv()[1],
  opts = {
    arg = leet_arg,
    lang = "python3",
    injector = {
      ["python3"] = {
        before = { "from typing import List, Optional" },
      },
    },
  },
}
