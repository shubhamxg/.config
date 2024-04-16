local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "pyright",
        "mypy",
        "ruff",
        "black",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<C-o>", "<CMD>TroubleToggle workspace_diagnostics<CR>" , desc = "snipfix", mode={"n"}},
      { "gt"   , "<cmd>TodoTrouble  keywords=TODO,FIX,FIXME<CR>", desc = "todo" , mode={"n"}},
      -- 	["<C-o>o"] = { "<cmd>TroubleToggle snipfix <CR>", "Show Error by LSPs" },
      -- 	["<C-o>d"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "diagnostics" },
      -- 	["<C-o>r"] = { "<cmd>TroubleToggle loclist<CR>", "diagnostics" },
      -- 	["<C-o>a"] = { "<cmd>TroubleToggle snipfix<CR>", "diagnostics" },
      -- 	["<C-o>o"] = { "<cmd>TroubleToggle lsp_references<CR>", "diagnostics" },
    },
    config = function() -- {{{
      require("trouble").setup({
        action_keys = { -- key mappings for actions in the trouble list
          close = "<C-o>", -- close the list
          cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r", -- manually refresh
          jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
          open_split = { "u" }, -- open buffer in new split
          open_vsplit = { "y" }, -- open buffer in new vsplit
          --open_tab = { "<C-o>" }, -- open buffer in new tab
          jump_close = { "o" }, -- jump to the diagnostic and close the list
          toggle_mode = ",", -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = ".", -- toggle auto_preview
          hover = "B", -- opens a small popup with the full multiline message
          preview = "b", -- preview the diagnostic location
          close_folds = { "mM" }, -- close all folds
          open_folds = { "mm" }, -- open all folds
          toggle_fold = { "mi", "mh" }, -- toggle fold of current file
          previous = "e", -- previous item
          next = "n", -- next item
        },
        auto_open = false,
        auto_close = false,
        use_diagnostic_signs = true,
      })
    end, -- }}}
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
    }
  }
}

return plugins
