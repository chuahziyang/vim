local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--[[ if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end ]]

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                insert = "<C-g>o",
                insert_line = "<C-g>O",
                normal = "yo",
                normal_cur = "yoo",
                normal_line = "yO",
                normal_cur_line = "yOO",
                visual = "O",
                visual_line = "gO",
                delete = "do",
                change = "co",
                change_line = "cO",
            },
        })
    end,
    },

    {
      "gwbprod/substitute.nvim",
      opts = {
        highlight_substituted_text = {
          enabled = false,
        },
      },
      config = function()
        require('substitute').setup({})
        vim.keymap.set("n", "gs", require('substitute').operator, { noremap = true })
        vim.keymap.set("n", "gss", require('substitute').line, { noremap = true })
        vim.keymap.set("n", "gS", require('substitute').eol, { noremap = true })
        vim.keymap.set("x", "gx", require('substitute').visual, { noremap = true })
      end,
    },

    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },

    {
      'echasnovski/mini.ai',
      version = false,
      opts = {},
      config = function()
        require('mini.ai').setup({})
      end,
    }


  --   {
  --   "ggandor/leap.nvim",
  --   enabled = true,
  --   config = function(_, opts)
  --   local leap = require("leap")
  --   for k, v in pairs(opts) do
  --     leap.opts[k] = v
  --   end
  --   leap.add_default_mappings(true)
  -- end,

  --   }
})

if vim.g.vscode then
  vim.g.mapleader = ","
  require("vs.settings")
else
  -- ordinary Neovim
end

