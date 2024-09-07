if vim.g.vscode then
  require("platforms.vscode")
elseif vim.g.started_by_firenvim == true then
  require("platforms.firenvim_config")
else
  -- ordinary Neovim
end
