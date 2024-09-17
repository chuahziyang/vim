require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.clipboard = "unnamedplus"
o.relativenumber = true
o.swapfile = false

if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
  o.shell = "powershell"
  o.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  o.shellquote = ""
  o.shellxquote = ""
end
