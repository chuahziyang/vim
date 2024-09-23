return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert = "<C-g>r",
        insert_line = "<C-g>R",
        normal = "yr",
        normal_cur = "yrr",
        normal_line = "yR",
        normal_cur_line = "yRR",
        visual = "R",
        visual_line = "gR",
        delete = "dr",
        change = "cr",
        change_line = "cS",
      }
    })
  end,
}
