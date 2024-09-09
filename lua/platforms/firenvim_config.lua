vim.g.firenvim_config = {
  localSettings = {
    ["."] = {
      takeover = "never",
      cmdline = "neovim",
      filename = '/tmp/{hostname}.{extension}'
    }
  }
}
vim.opt.guifont = "Geist Mono:h10"
