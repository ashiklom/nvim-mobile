return {
  {
    "tpope/vim-sensible"
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      vim.lsp.enable({
        "ruff",
        "pyright"
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          }
        }
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {preset = "super-tab"}
    }
  },{
    "ibhagwan/fzf-lua",
    opts = {},
    keys = {
      { "<leader> ", function() require("fzf-lua").files() end },
      { "<leader>/", function() require("fzf-lua").live_grep() end },
      { "<leader>z", function() require("fzf-lua").builtin() end },
      { "<C-x><C-f>", function() require("fzf-lua").complete_path() end, mode = "i"}
    }
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
      { "<leader>fo", function() require("oil").open() end }
    },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_mappings()
    end,
    lazy = false
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>ql", function() require("persistence").load() end },
      { "<leader>qq", vim.cmd.wqall }
    },
    opts = {}
  }
}
