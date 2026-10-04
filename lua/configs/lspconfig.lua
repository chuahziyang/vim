-- NvChad's defaults() already applies capabilities + on_init through
-- vim.lsp.config("*") and installs its LSP keymaps on LspAttach, so this file
-- only carries per-server settings, the maps we want gone, and the enable list.

vim.diagnostic.config {
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },
}

-- drop the NvChad LSP maps we don't use (tolerant: not all of them exist)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local unwanted = { "<leader>wa", "<leader>wr", "<leader>wl", "<leader>sh", "<leader>ra" }

    for _, lhs in ipairs(unwanted) do
      pcall(vim.keymap.del, "n", lhs, { buffer = args.buf })
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
        -- pylint = {
        --   enabled = false
        -- }
      },
    },
  },
})

vim.lsp.enable {
  "lua_ls",
  "html",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "eslint",
  "pylsp",
  "sqlls",
  -- "pylyzer",
  "prismals",
  "clangd",
  "jdtls",
  "rust_analyzer",
}
