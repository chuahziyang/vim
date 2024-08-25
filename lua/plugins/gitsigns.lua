return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- Load the default settings
      local default_options = require("nvchad.configs.gitsigns")
      -- Custom settings to override defaults
      local custom_options = {
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 400,
          ignore_whitespace = false,
        }
      }
      -- Merge default and custom options
      local final_options = vim.tbl_deep_extend("force", default_options, custom_options)
      -- Apply the merged configuration
      require("gitsigns").setup(final_options)
    end,
  },
}
