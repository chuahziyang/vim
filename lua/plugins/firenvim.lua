-- install(1) forces registration for every supported browser. The default
-- install(0) only registers browsers it can detect, and its Zen check looks
-- for ~/.zen -- a path that only exists on Linux/macOS, so Zen is skipped on
-- Windows even though it is installed under %APPDATA%\zen.
--
-- Settings live in lua/platforms/firenvim_config.lua, loaded from
-- lua/platforms/init.lua once g:started_by_firenvim is set.
return {
  {
    "glacambre/firenvim",
    lazy = false,
    build = ":call firenvim#install(1)",
  },
}
