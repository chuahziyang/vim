
local M = {}

local function load_plugins_from_directory(directory)
  local plugins = {}
  local function is_lua_file(filename)
    return filename:match("%.lua$")
  end
  local function require_plugin_file(filename)
    local plugin_name = filename:match("(.+)%..+$") -- Remove extension
    local ok, config = pcall(require, "plugins." .. plugin_name)
    if ok then
      vim.list_extend(plugins, config)
    else
      print("Failed to load plugin file: " .. filename)
    end
  end
  local function list_files(dir)
    local files = {}
    local pfile = io.popen('ls "' .. dir .. '"') -- Use 'ls' command to list files
    for filename in pfile:lines() do
      table.insert(files, filename)
    end
    pfile:close()
    return files
  end

  local files = list_files(directory)
  for _, filename in ipairs(files) do
    if is_lua_file(filename) then
      require_plugin_file(filename)
    end
  end

  return plugins
end

M.plugins = load_plugins_from_directory(vim.fn.stdpath('config') .. '/lua/plugins')

return M.plugins

