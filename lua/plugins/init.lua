return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

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
    "gbprod/substitute.nvim",
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
  },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  }

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  -- --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  --       "typescript-language-server",
  --       "tailwindcss-language-server",
  --       "eslint-lsp",
  --       "prettierd"
  -- 		},
  -- 	},
  -- },
  -- --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = function()
  --     opts = require("nvchad.configs.treesitter")
  --     opts.ensure_installed ={
  --       "lua",
  --       "typescript",
  --       "javascript",
  --       "tsx"
  --     }
  --     return opts

  --   end
  -- },
}
