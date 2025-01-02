return {
  -- Global plugins
  { "tpope/vim-abolish" },
  { "tpope/vim-scriptease" },

  -- Git plugins
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "shumphrey/fugitive-gitlab.vim" },
  { "tpope/vim-git" },

  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvimtools/none-ls.nvim" },
  { "3rd/image.nvim" },
  { "nvimtools/none-ls-extras.nvim" },
  { "pmizio/typescript-tools.nvim" },
  { "folke/trouble.nvim", branch = "main" },

  {
    -- lsp outline on the right
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen", "OutlineFocus" },
    keys = {
      { "<leader>oo", "<cmd>Outline<CR>", desc = "Toggle outline" },
      { "<leader>of", "<cmd>OutlineFocus<CR>", desc = "Focus outline window" },
    },
    opts = {
      -- Your setup opts here
      outline_window = {
        width = 15,
        focus_on_open = false,
      }
    },
  },

  -- Fuuuuu no!!!
  -- { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

  -- Completion
  { "Exafunction/codeium.nvim", commit = "937667b2cadc7905e6b9ba18ecf84694cf227567" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-vsnip" },

  -- Debug Adapter Protocol
  { "mfussenegger/nvim-dap" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "theHamsta/nvim-dap-virtual-text" },

  -- Useful plugins
  { "RRethy/vim-illuminate" },
  { "tpope/vim-repeat" },
  { "tpope/vim-speeddating" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "norcalli/nvim-colorizer.lua" },

  -- Colors
  { "ishan9299/nvim-solarized-lua" },

  -- TreeSitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "windwp/nvim-ts-autotag" },

  -- General Syntax
  { "delphinus/vim-firestore" },
  { "MichaHoffmann/tree-sitter-hcl" },
  { "mattn/emmet-vim" },
  { "google/vim-maktaba" },
  -- { "bazelbuild/vim-bazel" },
  { "jxnblk/vim-mdx-js" },

  -- File exploration
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },

  -- Utils
  { "MunifTanjim/nui.nvim" },
  { "rcarriga/nvim-notify" },
  { "folke/noice.nvim" },
  { "kassio/neoterm" },
  { "akinsho/toggleterm.nvim" },
  { "kevinhwang91/nvim-bqf" },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },

  -- Comments
  { "svermeulen/vim-subversive" },
  { "tpope/vim-commentary" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- Fuzzy Finder
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-github.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "aaronhallaert/advanced-git-search.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },
}
