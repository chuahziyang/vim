require "nvchad.configs.cmp"

return {
  'hrsh7th/nvim-cmp',
  opts = function()
    local options = require("nvchad.configs.cmp")
    table.insert(options.sources, 1, { name = 'supermaven' })
    return options
  end,
}
