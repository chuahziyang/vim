local M = {}

function M.setup()
  if vim.g.started_by_firenvim == true then
    vim.g.firenvim_config = {
      localSettings = {
        ["."] = {
          takeover = "never",
          cmdline = "neovim"
        }
      }
    }
    vim.opt.guifont = "Geist Mono:h10"
  end
end

return M
