if vim.g.vscode then
  require("settings")
elseif vim.g.started_by_firenvim == true then
  require("firenvim_config").setup()
else
  -- ordinary Neovim
end
