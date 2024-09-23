return {
  'hrsh7th/nvim-cmp',
  opts = function()
    local cmp = require("cmp")
    local options = require("nvchad.configs.cmp")

    -- Disable automatic completion
    -- Modify mapping to use Ctrl+Enter for completion
    options.mapping = cmp.mapping.preset.insert({
      ["<C-CR>"] = cmp.mapping.complete(),
      -- Keep other existing mappings
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
    })

    -- Add your custom source

    return options
  end,
}
