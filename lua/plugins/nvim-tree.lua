local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  -- custom mappings
end

-- pass to setup along with your other options
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
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        on_attach = my_on_attach
      }
      -- Merge default and custom options
      local final_options = vim.tbl_deep_extend("force", default_options, custom_options)
      -- Apply the merged configuration
      require("nvim-tree").setup(final_options)
    end,
  },
}
