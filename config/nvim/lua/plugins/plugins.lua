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
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tsserver",
        "biome",
        "kotlin_language_server",
        "ruby_lsp",
        "rubocop",
        "sorbet",
        "yamlls",
        "pyright",
        "stylua",
        "ruff",
        -- "jedi_language_server",
      },
      automatic_installation = true,
    },
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  -- remove this in favor of snacks.nvim
  -- { "3rd/image.nvim" },

  { "nvimtools/none-ls.nvim" },
  { "nvimtools/none-ls-extras.nvim" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- this isn't that great. maybe there's a good CLI based solution?
  -- {
  --   "dmmulroy/ts-error-translator.nvim",
  --   opts = {}
  -- },

  -- diagnostics
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- nice ui messages
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
    },
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
      },
    },
  },

  -- clojure
  -- TODO switch to the successor thing
  {
    "liquidz/vim-iced",
    dependencies = {
      "guns/vim-sexp",
    },
    config = function()
      -- Disable vim-sexp default mappings
      vim.g.sexp_enable_insert_mappings = 0
      vim.g.sexp_mappings = {}
      -- Disable automatic filetype activation
      vim.g.sexp_filetypes = ""
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
        enable_chat = true,
      })
    end,
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
  -- do we need this?
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
  -- { "kassio/neoterm" },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- size = 20,
      shade_terminals = false,
      open_mapping = [[<c-t>]],
      -- direction = "float",
      -- float_opts = { border = "curved" },

      -- on_create = function(term)
      --   if term.id == 2 then
      --     term.direction = "vertical"
      --   end
      -- end,
    },
    keys = {
      { "<c-t>", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", desc = "Toggle Terminal" },
      { "<leader>tg", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
      { "<leader>twh", ":ToggleTermSendCurrentLine<cr>", desc = "Send Current Line" },
      {
        "<leader>twh",
        ":'<,'>ToggleTermSendVisualLines<cr>",
        mode = "v",
        desc = "Send Selected Lines",
      },
      {
        "<leader>twl",
        function()
          local cfg = require("toggleterm.config").get()
          local old_direction, old_size = cfg.direction, cfg.size
          cfg.direction, cfg.size = "vertical", 90

          require("toggleterm").send_lines_to_terminal("single_line", true, {
            go_back = true,
            term_id = 2,
          })

          cfg.direction, cfg.size = old_direction, old_size
        end,
        desc = "Send current line to terminal 2 without stealing focus",
      },
      vim.keymap.set("v", "<leader>twl", function()
        local cfg = require("toggleterm.config").get()
        local old_direction, old_size = cfg.direction, cfg.size
        cfg.direction, cfg.size = "vertical", 90
        require("toggleterm").send_lines_to_terminal("visual_selection", true, {
          go_back = true,
          term_id = 2,
        })

        cfg.direction, cfg.size = old_direction, old_size
      end, { desc = "Send visual selection to terminal 2" }),
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
      {
        "<leader>y",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
      },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before cursor",
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n", "x" },
        desc = "Put yanked text after selection",
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before selection",
      },
      {
        "<c-p>",
        "<Plug>(YankyPreviousEntry)",
        desc = "Select previous entry through yank history",
      },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      {
        "]p",
        "<Plug>(YankyPutIndentAfterLinewise)",
        desc = "Put indented after cursor (linewise)",
      },
      {
        "[p",
        "<Plug>(YankyPutIndentBeforeLinewise)",
        desc = "Put indented before cursor (linewise)",
      },
      {
        "]P",
        "<Plug>(YankyPutIndentAfterLinewise)",
        desc = "Put indented after cursor (linewise)",
      },
      {
        "[P",
        "<Plug>(YankyPutIndentBeforeLinewise)",
        desc = "Put indented before cursor (linewise)",
      },
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
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- GitHub CI
  {
    "topaxi/pipeline.nvim",
    keys = {
      { "<leader>ci", "<cmd>Pipeline<cr>", desc = "Open pipeline.nvim" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
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
            schema = {
              model = {
                default = "grok-3", -- Ensure this is the latest model name, e.g., "grok-3-reasoning" or check xAI's API
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
          model = "grok-3",
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
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
              opts = {},
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
              opts = {},
            },
            cycle_buffers = false
            -- Add further custom keymaps here
          }
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
    "mrjones2014/op.nvim",
    build = "make install",
    config = function()
      require("op").setup({})
    end,
  },

  -- try parrot.nvim as an alternative to codecompanion
  -- {
  --   "frankroeder/parrot.nvim",
  --   event = "VeryLazy",
  --   dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "mrjones2014/op.nvim" },
  --   config = function()
  --     require("parrot").setup({
  --       system_prompt = {
  --         chat = "Keep your answer very consice and to the point",
  --       },
  --       providers = {
  --         xai = {
  --           name = "xai",
  --           api_key = { "op", "read", "op://personal/xAI/api_key_neovim", "--no-newline" },
  --           endpoint = "https://api.x.ai/v1/chat/completions",
  --           model_endpoint = "https://api.x.ai/v1/language-models",
  --           models = {
  --             "grok-3",
  --             "grok-3-mini",
  --           },
  --           params = {
  --             chat = { model = "grok-3" },
  --             command = { model = "grok-3" },
  --           },
  --           topic = {
  --             model = "grok-3-mini",
  --             params = { max_tokens = 32 },
  --           },
  --         },
  --       },
  --       hooks = {
  --         -- TODO could this take a prompt?
  --         Buff = function(prt, params)
  --           local template = [[
  --             Respond with an extremely consice answer.
  --             Review the entire code in this file, carefully examine it.
  --             Keep your explanation short and to the point and format it using markdown:

  --             ```{{filetype}}
  --             {{filecontent}}
  --             ```
  --           ]]
  --           local model_obj = prt.get_model("command")
  --           prt.logger.info("Outlining file with model: " .. model_obj.name)
  --           prt.Prompt(params, prt.ui.Target.vnew, model_obj, nil, template)
  --         end,
  --       },
  --     })
  --   end,
  --   keys = {
  --     { "<c-g><c-g>", "<cmd>PrtChatNew<cr>", mode = "n", desc = "Start new chat in normal mode" },
  --     { "<c-g><c-g>", ":'<,'>PrtChatNew<cr>", mode = "v", desc = "Start new chat with selection" },
  --     { "<c-g>t", "<cmd>PrtChatToggle<cr>", mode = { "n", "v" }, desc = "Toggle chat window" },
  --   },
  -- },
}
