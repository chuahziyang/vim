-- install(1) forces registration for every supported browser. The default
-- install(0) only registers browsers it can detect, and its Zen check looks
-- for ~/.zen -- a path that only exists on Linux/macOS, so Zen is skipped on
-- Windows even though it is installed under %APPDATA%\zen.
return {
  {
    "glacambre/firenvim",
    lazy = false,
    build = ":call firenvim#install(1)",
    config = function()
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
          [".*"] = {
            cmdline = "neovim",
            content = "text",
            priority = 0,
            selector = "textarea",
            -- press <C-e> to hand a text box to nvim; set to "always" to have
            -- firenvim grab every text box on its own
            takeover = "never",
          },
        },
      }
    end,
  },
}
