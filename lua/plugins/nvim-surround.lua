return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  -- v4 removed the `keymaps` field from setup(): loading the plugin installs
  -- the default mappings itself. To rebind, set the relevant
  -- vim.g.nvim_surround_no_*_mappings flag and map <Plug>(nvim-surround-*).
  -- See `:h nvim-surround.migrating.v3_to_v4` and `:h nvim-surround.keymaps`.
}
