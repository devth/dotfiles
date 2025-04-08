return {
  -- Global plugins
  { "tpope/vim-abolish" },
  { "tpope/vim-scriptease" },

  -- Git plugins
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  -- { "shumphrey/fugitive-gitlab.vim" },
  { "tpope/vim-git" },

  -- LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  -- remove this in favor of snacks.nvim
  -- { "3rd/image.nvim" },

  { "nvimtools/none-ls.nvim", },
  { "nvimtools/none-ls-extras.nvim" },
  { "pmizio/typescript-tools.nvim" },

  -- this isn't that great. maybe there's a good CLI based solution?
  -- {
  --   "dmmulroy/ts-error-translator.nvim",
  --   opts = {}
  -- },

  { "folke/trouble.nvim", branch = "main" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- These notifications are too noisy and persistent. disable for now.
      "rcarriga/nvim-notify",
      }
  },
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

  -- clojure
  -- TODO switch to the successor thing
  { "liquidz/vim-iced",
    dependencies = {
      "guns/vim-sexp"
    },
    config = function()
      -- Disable vim-sexp default mappings
      vim.g.sexp_enable_insert_mappings = 0
      vim.g.sexp_mappings = {}
      -- Disable automatic filetype activation
      vim.g.sexp_filetypes = ''
    end,
  },

  -- Fuuuuu no!!!
  -- { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

  -- Completion
  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-calc" }, -- run calculators
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-vsnip" },

  -- Debug Adapter Protocol
  { "mfussenegger/nvim-dap" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "theHamsta/nvim-dap-virtual-text" },

  -- Useful plugins
  -- disabled 2025/02/21 to see if it helps perf and because it's throwing trash
  -- runtime errors
  -- { "RRethy/vim-illuminate" },
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

  -- disabled 2025/02/21 - do i use this?
  -- { "mattn/emmet-vim" },
  { "google/vim-maktaba" },
  -- { "bazelbuild/vim-bazel" },
  { "jxnblk/vim-mdx-js" },

  -- File exploration
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },

  -- Utils
  -- TODO - remove in favor of toggleterm
  { "kassio/neoterm" },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- size = 20,
      shade_terminals = false,
      open_mapping = [[<c-t>]],
      -- direction = "float",
      -- float_opts = { border = "curved" },
    },
    keys = {
      { "<c-t>", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", desc = "Toggle Terminal" },
      { "<leader>tg", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
      { "<leader>twh", ":ToggleTermSendCurrentLine<cr>", desc = "Send Current Line" },
      { "<leader>twh", ":'<,'>ToggleTermSendVisualLines<cr>", mode = "v", desc = "Send Selected Lines" },
    },
  },
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = true,
  },

  { "kevinhwang91/nvim-bqf" },
  {
    "gbprod/yanky.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { "<leader>y", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  -- Markdown preview
  -- Disabled since I don't use it much
  -- { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },

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

  -- Indent objects text motions
  { "michaeljsmith/vim-indent-object" },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- GitHub CI
  {
    'topaxi/pipeline.nvim',
    keys = {
      { '<leader>ci', '<cmd>Pipeline<cr>', desc = 'Open pipeline.nvim' },
    },
    -- optional, you can also install and use `yq` instead.
    build = 'make',
    ---@type pipeline.Config
    opts = {},
  },

  -- AI utils
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      show_defaults = false,
      adapters = {
        xai = function()
          return require("codecompanion.adapters").extend("xai", {
            env = {
              api_key = "cmd:op read op://personal/xAI/api_key_neovim --no-newline",
            },
          })
        end,
        -- grok = function()
        --   return require("codecompanion.adapters").extend("openai_compatible", {
        --     url = "https://api.x.ai/v1/chat/completions",
        --     api_key = "cmd:op read op://personal/xAI/api_key_neovim --no-newline",
        --     -- headers = {
        --     --   ["Content-Type"] = "application/json",
        --     --   ["Authorization"] = "Bearer ${api_key}",
        --     -- },
        --     build_params = function(self, prompt, params, model)
        --       return {
        --         model = model or "grok-beta",
        --         messages = { { role = "user", content = prompt } },
        --         temperature = params.temperature or 0.7,
        --         max_tokens = params.max_tokens or 2048,
        --       }
        --     end,
        --     model_list = {
        --       "grok-2-1212",
        --       "grok-beta",
        --     }
        --   })
        -- end,
        novita = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://api.novita.ai", -- optional: default value is ollama url http://127.0.0.1:11434
              -- api_key = "OpenAI_API_KEY", -- optional: if your endpoint is authenticated
              api_key = "cmd:op read op://personal/Novita/api_key_neovim --no-newline",
              chat_url = "/v3/openai/chat/completions", -- optional: default value, override if different
              models_endpoint = "/v3/openai/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
            },
            schema = {
              model = {
                default = "deepseek/deepseek-r1-turbo",  -- define llm model to be used
              },
              temperature = {
                order = 2,
                mapping = "parameters",
                type = "number",
                optional = true,
                default = 0.8,
                desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
                validate = function(n)
                  return n >= 0 and n <= 2, "Must be between 0 and 2"
                end,
              },
              max_completion_tokens = {
                order = 3,
                mapping = "parameters",
                type = "integer",
                optional = true,
                default = nil,
                desc = "An upper bound for the number of tokens that can be generated for a completion.",
                validate = function(n)
                  return n > 0, "Must be greater than 0"
                end,
              },
              stop = {
                order = 4,
                mapping = "parameters",
                type = "string",
                optional = true,
                default = nil,
                desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
                validate = function(s)
                  return s:len() > 0, "Cannot be an empty string"
                end,
              },
              logit_bias = {
                order = 5,
                mapping = "parameters",
                type = "map",
                optional = true,
                default = nil,
                desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
                subtype_key = {
                  type = "integer",
                },
                subtype = {
                  type = "integer",
                  validate = function(n)
                    return n >= -100 and n <= 100, "Must be between -100 and 100"
                  end,
                },
              },
            },
          })
        end,
      },
      strategies = {
        agent = { adapter = "xai" },
        cmd = { adapter = "xai" },
        chat = {
          adapter = "xai",
          slash_commands = {
            ["file"] = {
              -- Location to the slash command in CodeCompanion
              callback = "strategies.chat.slash_commands.file",
              description = "Select a file using Telescope",
              opts = {
                provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
                contains_code = true,
              },
            },
          },
        },
        inline = {
          adapter = "xai",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
      },
    },
  },

  {
    'mrjones2014/op.nvim',
    build = "make install",
    config = function()
      require("op").setup({
      })
    end,
  },

  -- try parrot.nvim as an alternative to codecompanion
  {
    "frankroeder/parrot.nvim",
    event = "VeryLazy",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim', 'mrjones2014/op.nvim' },
    config = function()
      require("parrot").setup {
        providers = {
          xai = {
            api_key = { "op", "read", "op://personal/xAI/api_key_neovim", "--no-newline" }
          },
        },
      }
    end,
    keys = {
      { "<c-g><c-g>", "<cmd>PrtChatNew<cr>", mode = { "n", "v" } },
    },
  },
}
