return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- Load the default settings
      local default_options = require("nvchad.configs.nvimtree")
      -- Custom settings to override defaults
      local custom_options = {
        view = {
          side = "right"
        }
      }
      -- Merge default and custom options
      local final_options = vim.tbl_deep_extend("force", default_options, custom_options)
      -- Apply the merged configuration
      require("nvim-tree").setup(final_options)
    end,
  },
}
