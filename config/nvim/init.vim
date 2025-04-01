"      _            _   _
"     | |          | | | |                ( )
"   __| | _____   _| |_| |__    _ ____   ___ _ __ ___  _ __ ___
"  / _  |/ _ \ \ / / __| |_ \  |  _ \ \ / / |  _   _ \|  __/ __|
" | (_| |  __/\ V /| |_| | | | | | | \ V /| | | | | | | | | (__
"  \____|\___| \_/  \__|_| |_| |_| |_|\_/ |_|_| |_| |_|_|  \___|
"
" Author: Trevor Hartman
" Source: https://github.com/devth/dotfiles
" A part of the pristine dotfile zen garden of @devth

" Plugins {{{

lua <<EOF
  vim.g.sexp_enable_insert_mappings = 0
  vim.g.sexp_mappings = {}
  vim.g.sexp_filetypes = ''
EOF

  lua require("config.lazy")
  " }}}

" Lua config {{{
  lua require("config.theme")
" }}}

" Vim system settings {{{
  if !empty(glob("~/.vimrc_private"))
    source ~/.vimrc_private
  endif
  " set foldmethod=marker
  set nowrap
  set linebreak " for when we do need wrapping
  set ttyfast
  " don't need this anymore and noice doesn't like it.
  " set lazyredraw
  set nocompatible
  " min number of lines above below cursor
  set scrolloff=3
  syntax on
  filetype plugin indent on
  set shell=/bin/zsh
  " set shellcmdflag=-l
  set history=1000
  set undolevels=1000
  set nocursorline nocursorcolumn " vim is slow with these on :/

  set termguicolors
  imap jj <Esc>

  " don't auto resize window on splitting
  " set noequalalways

  " store tab titles and other stuff in sessions
  set sessionoptions+=globals,tabpages

  " Splits
  set splitbelow splitright

  " Persistent undo
  let undodir = expand('~/.undo-vim')
  if !isdirectory(undodir)
    call mkdir(undodir)
  endif
  set undodir=~/.undo-vim
  set undofile
  set wildmenu
  set wildmode=list:longest
  set visualbell
  set shortmess=I " hide the startup message
  set shortmess+=F " don't show file info when editing
  set ic " case insensitive search
  set gdefault
  set incsearch
  set wrapscan " side effect: jumps to result as you type
  set hlsearch
  set showmatch
  set hidden " allow unsaved buffers to exist in the bg
  set noautochdir
  set norelativenumber
  set nonumber
  set nobackup
  set noswapfile
  " Whitespace
  set tabstop=2
  set smarttab
  set shiftwidth=2
  set autoindent
  set expandtab
  set backspace=start,indent
  set textwidth=80
  set linebreak
  set wrapmargin=1
  " prevent double spaces when joining with C-j
  set nojoinspaces
  set spelllang=en_us
  " whitespace characters
  set list listchars=tab:»·,trail:·,nbsp:·
  " Show glyphs from vim-devicons
  set encoding=utf8
  " Configure python
  let g:python2_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'

  " Format options {{{

  " Allow wrapping lines at textwidth automatically
  set fo+=t
  set fo-=l

  " Set correct filetypes
  autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy


  " }}}


" }}}


" lua vim settings {{{
lua <<EOF
-- consider disabling this - it causes too much layout shift
vim.diagnostic.config({virtual_lines = { current_line = true}})
EOF

" }}}

" nvim lua default package lookup {{{

lua <<EOF
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.config/nvim/lua/?.lua"
EOF
" }}}


" Mason / LSP must be before lspconfig below {{{
lua <<EOF
  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = {
      "biome",
      "ts_ls",
      "kotlin_language_server",
      "ruby_lsp",
      "rubocop",
      "sorbet",
      "yamlls",
      "pyright",
      "ruff",
      -- "jedi_language_server",
    },
    automatic_installation = true
  }
EOF
" }}}
"


" Images 3rd/image.nvim {{{
" lua <<EOF
" package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
" package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"
" require("image").setup({})
" EOF
" }}}


" Vim system mappings {{{

  " Silent write file
  nnoremap <leader>w :silent write<cr>

  " Split navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Center screen on line
  nmap <space> zz

  " Navigate wrapped files
  nmap j gj
  nmap k gk

  " Edit / reload .vimrc
  nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
  nmap <silent> <leader>sv :so $MYVIMRC<CR>
  vmap <leader>sv y:@"<CR>

  " Edit .zshrc
  nnoremap <leader>ez <C-w><C-v><C-l>:e ~/.zshrc<cr>

  " Always open help in vert split
  " Disable this because vim-iced uses the help for doc strings
  " autocmd FileType help wincmd L

  " Clear searches
  nnoremap <leader><space> :nohlsearch<cr>
  " Tab between braces
  nnoremap <tab> %
  vnoremap <tab> %

  " Show next matched string at eh center of screen
  nnoremap n nzz
  nnoremap N Nzz

  " Yank current file path
  nnoremap <leader>cp :let @" = expand("%")<cr>

  " Substitute word under cursor
  :nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

  " Remove trailing whitespace
  nnoremap <leader>aw :%s/\s\+$//<cr>:let @/=''<cr>``

  " Remove last character in line
  function! RmLastChar()
    :s/.$/
  endfunction
  nnoremap <leader>ax :call RmLastChar()<cr>
  vnoremap <leader>ax :call RmLastChar()<cr>

  " Toggle Goyo
  nnoremap <leader>go :Goyo<cr>

  " Tab navigation replacement for tmux
"   nnoremap <C-space>l :tabp<cr>
"   nnoremap <C-space>c :tabnew<cr>
"   nnoremap <C-space>0 1gt
"   nnoremap <C-space>1 2gt
"   nnoremap <C-space>2 3gt
"   nnoremap <C-space>3 4gt
"   nnoremap <C-space>4 5gt
"   nnoremap <C-space>4 5gt
"   nnoremap <C-space>5 6gt

 " }}}

" Vim system autocmds {{{

  " watch for dir changed
  " autocmd DirChanged * echomsg string(v:event)

  " turn on spelling for certain files
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  autocmd BufRead,BufNewFile *.md set cursorline cursorcolumn

  autocmd FileType gitcommit setlocal spell complete+=kspell
    \ cursorline cursorcolumn

  " S-K to pull up dictionary on markdown
  autocmd FileType markdown setlocal keywordprg=sdcv
  " yaml
  autocmd BufRead,BufNewFile *.yaml set cursorline cursorcolumn
  " FileType for EJS
  autocmd BufNewFile,BufRead *.ejs set ft=json
  " FileType for eslint
  autocmd BufNewFile,BufRead .eslintrc set ft=json
" }}}

" Vim terminal {{{

  " NeoVim Terminal Mode
  tnoremap <C-[> <C-\><C-n>
  tnoremap jj <C-\><C-n>
  highlight TermCursor ctermfg=red guifg=red

  " tbone replacement using neoterm plugin
  nmap <leader>twl <s-v>:TREPLSendLine<cr>
  nmap gxx <s-v>:TREPLSendLine<cr>
  vmap gx :TREPLSendSelection<cr>


  " vmap <leader>twl :TREPLSendLine<cr>

  " neoterm configuration
  " let g:neoterm_position = 'vertical'
  " Don't try to auto load a term
  let g:neoterm_auto_repl_cmd = 0
  let g:neoterm_default_mod = 'vertical'
  let g:neoterm_term_per_tab = 1

  nmap gxt :Ttoggle<cr>

  " Use gx{text-object} in normal mode
  " nmap gx <Plug>(neoterm-repl-send)

  " Send selected contents in visual mode.
  " xmap gx <Plug>(neoterm-repl-send)

  " Send line - can use 2gxx to send 2 lines
  " nmap gxx <Plug>(neoterm-repl-send-line)

  " Toggle term visibility
  " nmap gxt :Ttoggle<cr><c-w>=



" }}}

" Fold settings {{{
  function! MyFoldText() " {{{
      let line = getline(v:foldstart)
      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let clean_line = substitute(line, "{", "", "g")
      let clean_line = substitute(clean_line, "\"", "", "g")
      let fillcharcount = windowwidth - len(clean_line) - len(foldedlinecount) - len('lines')
      return clean_line . '↯' . repeat(" ",fillcharcount) . foldedlinecount . ' lines '
  endfunction " }}}

  set foldtext=MyFoldText()

  set foldlevel=3

  " Use marker foldmethod for specific file types
  autocmd FileType yaml,vim,zsh,sh,make setlocal foldmethod=marker foldlevel=0
  nnoremap z<space> za " easier toggling
  " Don't open folds for me when searching
  " (might want to be able to toggle this)
  set fdo-=search
" }}}

" yaml treesitter {{{
lua << EOF
  -- config here if you need it
  require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
  }
EOF
" }}}

" Lualine {{{

lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- angles (default)
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},

    -- bubbles
    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },

    -- slants
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'mode', 'nvim_treesitter#statusline(90)'},
    lualine_x = {'searchcount', 'fileformat', 'filesize', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'quickfix', 'nvim-tree', 'trouble', 'fzf', 'lazy'}
}

EOF

" }}}

" Aesthetics {{{

  " https://github.com/norcalli/nvim-colorizer.lua
  lua require'colorizer'.setup()

  let g:neosolarized_vertSplitBgTrans = 1

  " This must be defined before activating colorscheme

  " augroup my_neomake_signs
  "     au!
  "     autocmd ColorScheme *
  "         \ hi NeomakeErrorSign ctermfg=red ctermbg=black |
  "         \ hi NeomakeWarningSign ctermfg=yellow
  " augroup END

  fun! CustomizeDarkColors()
    " " Remove background on vertical splits
    " " Hide the ~ characters at end of files
    " " Customize Folds
    " if &background == 'dark'
    "   hi VertSplit ctermbg=0 ctermfg=0 guibg=#FAF2DC
    "   hi NonText cterm=NONE gui=NONE guibg=NONE guifg=#FAF2DC ctermbg=0 ctermfg=0
    "   hi ColorColumn ctermbg=black
    "   hi Folded cterm=bold ctermfg=cyan ctermbg=black
    "   hi FoldColumn cterm=reverse
    "   hi fmrkr ctermbg=black ctermfg=black
    " else
    "   hi NonText ctermbg=7 ctermfg=7
    "   hi ColorColumn ctermbg=7
    "   hi VertSplit ctermbg=7 ctermfg=7
    "   hi fmrkr ctermbg=7 ctermfg=7
    " endif
  endfun

  augroup vimrc
    autocmd!
    autocmd ColorScheme * call CustomizeDarkColors()
  augroup END

  " Create syntax fmrkr for folds
  autocmd BufRead,BufNewFile * syn match fmrkr '"*{{{\|"*}}}' |
        \ syn cluster vimCommentGroup contains=fmrkr

  " colorscheme solarized
  colorscheme solarized

  set termguicolors " https://github.com/overcache/NeoSolarized
  set colorcolumn=80
  " default background color - can be toggled
  set bg=dark

  " Quickly switch between light and dark
  nnoremap <leader>bgl :set bg=light<cr>
  nnoremap <leader>bgd :set bg=dark<cr>

  " controls vertical split pipe, end of buffer
  set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

  " Goyo {{{
    let g:goyo_height = "100%"
    let g:goyo_width = 94
    function! s:goyo_enter()
      silent !tmux set status off
      " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      set noshowmode
      set noshowcmd
      " set scrolloff=999
    endfunction

    function! s:goyo_leave()
      silent !tmux set status on
      " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      set showmode
      set showcmd
      " set scrolloff=5
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
  " }}}

" }}}

" Replace / substitute {{{
  " s for substitute
  nmap s <plug>(SubversiveSubstitute)
  nmap ss <plug>(SubversiveSubstituteLine)
  nmap S <plug>(SubversiveSubstituteToEndOfLine)

  " https://github.com/svermeulen/vim-subversive
  xmap s <plug>(SubversiveSubstitute)
  xmap p <plug>(SubversiveSubstitute)
  xmap P <plug>(SubversiveSubstitute)
" }}}
"

" TreeSitter {{{

lua <<EOF
-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.mdx = "markdown"
-- vim.treesitter.language.register('mdx', 'markdown', 'markdown')

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'css', 'graphql', 'html', 'javascript', 'lua', 'nix', 'python', 'svelte',
    'tsx', 'twig', 'typescript', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
    'clojure', 'regex', 'bash'
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },

  -- see all config options at
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#text-objects-select
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
    },
  },
}

-- https://github.com/windwp/nvim-ts-autotag?tab=readme-ov-file#setup
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})

-- vim.treesitter.language.register('mdx', 'markdown')

EOF

set foldmethod=expr
set foldexpr = "v:lua.vim.lsp.foldexpr()"
" set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevel=20

" }}}

" Trouble {{{

lua << EOF
require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
EOF

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}

" DAP {{{

lua << EOF

-- https://github.com/David-Kunz/vim/blob/master/init.lua
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- dap node
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/oss/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

-- _G.shutDownDapSession = function()
--   local dap = require'dap'
--   dap.terminate()
--   dap.disconnect( { terminateDebuggee = true })
--   dap.close()
-- end

map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<leader>k', ':lua require"dap".step_out()<CR>')
map('n', "<leader>l", ':lua require"dap".step_into()<CR>')
map('n', '<leader>j', ':lua require"dap".step_over()<CR>')
map('n', '<leader>h', ':lua require"dap".continue()<CR>')
map('n', '<leader>dn', ':lua require"dap".run_to_cursor()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
map('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
-- map('n', '<leader>dc', ':lua require"dap".terminate()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('n', '<leader>dR', ':lua require"dap".clear_breakpoints()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>ds', ':Telescope dap frames<CR>')
map('n', '<leader>dc', ':Telescope dap commands<CR>')
map('n', '<leader>dv', ':Telescope dap variables<CR>')
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

-- nvim-telescope/telescope-file-browser.nvim
-- require('telescope').load_extension('file_browser')
-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
require('nvim-dap-virtual-text').setup()
-- g.dap_virtual_text = true

-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
require('telescope').load_extension('fzf')

-- https://github.com/nvim-telescope/telescope-media-files.nvim
require('telescope').load_extension('media_files')

-- https://github.com/aaronhallaert/advanced-git-search.nvim#%EF%B8%8F-installation
require("telescope").load_extension("advanced_git_search")

-- pass args to grep https://github.com/nvim-telescope/telescope-live-grep-args.nvim
require("telescope").load_extension("live_grep_args")

-- telescope for code actions
require("telescope").load_extension("ui-select")


-- David-Kunz/jester
map('n', '<leader>tt', ':lua require"jester".run({ path_to_jest = "/opt/homebrew/bin/jest" })<cr>')
map('n', '<leader>t_', ':lua require"jester".run_last({ path_to_jest = "/opt/homebrew/bin/jest" })<cr>')
map('n', '<leader>tf', ':lua require"jester".run_file({ path_to_jest = "/opt/homebrew/bin/jest" })<cr>')
-- map('n', '<leader>dd', ':lua require"jester".debug({ path_to_jest = "/opt/homebrew/bin/jest" })<cr>')
map('n', '<leader>d_', ':lua require"jester".debug_last({ path_to_jest = "/opt/homebrew/bin/jest" })<cr>')
-- map('n', '<leader>df', ':lua require"jester".debug_file({ path_to_jest = "/opt/homebrew/bin/jest" })<cr>')
map('n', '<leader>dq', ':lua require"jester".terminate()<cr>')

EOF

" }}}

" vim-test {{{
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" }}}

" LSP {{{

lua << EOF


-- local cfg = {}
-- require "lsp_signature".setup(cfg)

-- https://github.com/ray-x/navigator.lua
-- require'navigator'.setup()

-- from https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
-- updated 1/15/2022


local lspconfig = require("lspconfig")
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.format { timeout_ms = 5000 }")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gl", ":LspRefs<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    -- buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    -- buf_map(bufnr, "n", "<Leader>fo", ":LspFormatting<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          -- this can be super slow - consider formatting manually instead
          -- vim.lsp.buf.formatting_sync()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end

end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pylsp.lua
-- lspconfig.pylsp.setup{}
-- lspconfig.pyright.setup{}
-- lspconfig.gopls.setup{}

-- these seem too slow so disable them:
-- lspconfig.ruby_lsp.setup({})
-- lspconfig.rubocop.setup{}

-- this will use biome for formatting too but it doesn't load format or lint.
-- errors into diagnostics. none-ls is required for that.
-- lspconfig.biome.setup{}

lspconfig.yamlls.setup {}

-- this replaces lspconfig ts_ls
require("typescript-tools").setup {
  settings = {
    expose_as_code_action = "all",
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
}

-- python lsp
-- require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.pyright.setup{}

-- require'lspconfig'.ts_ls.setup{
--   on_attach = function(client, bufnr)
--     -- disable formatting so it doesn't conflict with eslint / prettier
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormatting = false
--     -- only config typescript-tools after attaching to a TS language server
--     -- local ts_utils = require("nvim-lsp-ts-utils")
--     -- ts_utils.setup({})
--     -- ts_utils.setup_client(client)
--     -- this command is broken until https://github.com/pmizio/typescript-tools.nvim/issues/295 is fixed
--     buf_map(bufnr, "n", "gs", ":TSToolsOrganizeImports<CR>")
--     -- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
--     -- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
--     on_attach(client, bufnr)
--   end,
-- }


-- lspconfig.tsserver.setup({
--   flags = {
--     debounce_text_changes = 500,
--   },
--   capabilities = capabilities,
--   on_attach = function(client, bufnr)
--     -- disable formatting so it doesn't conflict with eslint / prettier
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormatting = false
--     local ts_utils = require("nvim-lsp-ts-utils")
--     ts_utils.setup({})
--     ts_utils.setup_client(client)
--     buf_map(bufnr, "n", "gs", ":TSToolsOrganizeImports<CR>")
--     buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
--     buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
--     on_attach(client, bufnr)
--   end,
-- })


-- replaced null_ls with none-ls following biome's instructions
local null_ls = require("null-ls")
-- use biome (via lsp) instead!
null_ls.setup({
  sources = {
    -- temp disable these while trying biome:
    -- require("none-ls.diagnostics.eslint"),
    -- require("none-ls.diagnostics.eslint"),
    -- require("none-ls.code_actions.eslint"),

    -- use prettier instead of lsp formatting
    -- null_ls.builtins.formatting.prettier,

    null_ls.builtins.formatting.biome
    },
    on_attach = on_attach,
  }
)

EOF

" au BufEnter * typescript require'completion'.on_attach()

" }}}

" Completion {{{

" Use <Tab> and <S-Tab> to navigate through popup menu

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Avoid showing message extra message when using completion
" set shortmess+=c

set completeopt=menu,menuone,noselect

lua <<EOF

  -- setup Codeium
  require("codeium").setup({
    enable_chat = true,
  })

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only
        -- confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', priority = 1000 },
      { name = "codeium", priority = 900 },
      -- https://www.reddit.com/r/neovim/comments/so4g5e/comment/hw7i5n0/
      { name = "nvim_lsp_signature_help" },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'calc' },
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      }
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF


" }}}

" File explorer (nvim-tree) {{{


lua <<EOF

local function nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"
  api.config.mappings.default_on_attach(bufnr)
  -- remove C-e so we can use default vim C-e scrolling behavior
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })
end
require'nvim-tree'.setup {
  on_attach = nvim_tree_on_attach,
}

EOF

  " Can be `0` or `1`. When `1`, will close the tree when a file is opened.
  " Applies to: `edit`, `vsplit`, `split`, `tabnew`.
  " Default is 0
  let g:nvim_tree_quit_on_open = 0

  nnoremap <leader>nt :NvimTreeToggle<CR>
  nnoremap <leader>tr :NvimTreeRefresh<CR>
  nnoremap <leader>tf :NvimTreeFindFile<CR>


" }}}

" tbone {{{

  " right
  " nnoremap <leader>twl <s-v>:Twrite right<cr>
  " vnoremap <leader>twl :Twrite right<cr>

  " left
  " nnoremap <leader>twh <s-v>:Twrite left<cr>
  " vnoremap <leader>twh :Twrite left<cr>

  " bottom left
  " nnoremap <leader>twjh <s-v>:Twrite bottom-left<cr>
  " vnoremap <leader>twjh :Twrite bottom-left<cr>

  " bottom right
  " nnoremap <leader>twjl <s-v>:Twrite bottom-right<cr>
  " vnoremap <leader>twjl :Twrite bottom-right<cr>

  " top left
  " nnoremap <leader>twkh <s-v>:Twrite top-left<cr>
  " vnoremap <leader>twkh :Twrite top-left<cr>

  " top right
  " nnoremap <leader>twkl <s-v>:Twrite top-right<cr>
  " vnoremap <leader>twkl :Twrite top-right<cr>

" }}}

" Regreplop {{{
  nmap <leader>r <Plug>ReplaceMotion
  nmap <leader>r<leader>r <Plug>ReplaceLine
  vmap <leader>r <Plug>ReplaceVisual
" }}}

" git {{{

  " let g:blamer_enabled = 1
  " let g:blamer_date_format = '%y/%m/%d'
  map <leader>gb :Git blame<cr>
  map <leader>gh :GBrowse<cr>
  map <leader>ge :Gedit<cr>
  map <leader>gl :Glog<cr>
  map <leader>gw :Gwrite<cr>

  map <leader>gs :G<cr>

  map <leader>gP :Git push<cr>
  map <leader>gp :Git pull --rebase<cr>
  map <leader>gc :Git commit<cr>
  map <leader>ga :Git add %<cr>
" }}}

" Dispatch {{{
  " map <leader>dr :Dispatch<space>
  " map <leader>dl :execute 'Dispatch ' . getline('.')<cr>
  " cmap <C-R><C-L> <C-R>=getline('.')<CR>

" }}}

" Clipboard {{{
  " Put default register into system clipboard
  nnoremap <leader>yc :let @+=@"<cr>
  " Put system clipboard into default register
  nnoremap <leader>cy :let @"=@+<cr>
" }}}

" Telescope fuzzy finder {{{

  " Find files using Telescope command-line sugar.
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>p <cmd>Telescope git_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fd <cmd>Telescope lsp_definitions<cr>
  nnoremap <leader>fa <cmd>Telescope lsp_code_actions<cr>
  nnoremap <leader>fs <cmd>Telescope lsp_document_symbols<cr>
  nnoremap <leader>fw <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fl <cmd>Telescope git_files<cr>
  nnoremap <leader>tgb <cmd>Telescope git_branches<cr>
  nnoremap <leader>tts <cmd>Telescope treesitter<cr>

  " nnoremap \ <cmd>Telescope live_grep<cr>
  nnoremap \ <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
  " keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

  nnoremap <leader>* <cmd>Telescope grep_string<cr>

  " :lua require'telescope.builtin'.planets{}
  " :nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}

lua <<EOF
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")


-- local image_preview = require('telescopeimage').telescope_image_preview()


telescope.setup {
  defaults = {
      -- file_previewer = image_preview.file_previewer,
      -- buffer_previewer_maker = image_preview.buffer_previewer_maker,
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = lga_actions.to_fuzzy_refine,
        },
      },
      additional_args = { "-." },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
    require("telescope.themes").get_dropdown {
        -- even more opts
    }
  }
}
EOF


" }}}

" fzf {{{
  " let g:fzf_layout = { 'left': '~30%' }
  " ctrl-p replacement
  " nmap <leader>p :Files<cr>
  " nmap <leader>bp :Buffers<cr>
  " " line wise completion
  " imap <c-x><c-l> <plug>(fzf-complete-line)
  " " find commits
  " nnoremap <leader>fc :Commits<cr>
  " " find lines
  " nnoremap <leader>fl :Lines<cr>

" }}}

" vim-tmux-navigator {{{
  " Disable tmux navigator when zooming the Vim pane
  let g:tmux_navigator_disable_when_zoomed = 1
" }}}

" TODO remove since we're using actual tmux now
" nvimux {{{
" lua << EOF
" local nvimux = require('nvimux')
"
" -- Nvimux configuration
" nvimux.config.set_all{
"   prefix = '<C-space>',
"   new_window = 'enew', -- Use 'term' if you want to open a new term for every new window
"   new_tab = 'term', -- Defaults to new_window. Set to 'term' if you want a new term for every new tab
"   new_window_buffer = 'single',
"   quickterm_direction = 'botright',
"   quickterm_orientation = 'vertical',
"   quickterm_scope = 't', -- Use 'g' for global quickterm
"   quickterm_size = '80',
" }
"
" -- Nvimux custom bindings
" nvimux.bindings.bind_all{
"   {'s', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
"   {'v', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
" }
"
" -- Required so nvimux sets the mappings correctly
" nvimux.bootstrap()
" EOF

" }}}

" TagBar {{{
  let g:tagbar_compact = 1
  nmap <leader>tb :TagbarOpen fj<cr>
  " Configure TagBar for markdown
  " Add support for markdown files in tagbar.
  " let g:tagbar_type_markdown = {
  "     \ 'ctagstype': 'markdown',
  "     \ 'ctagsbin' : '$HOME/.dotfiles/markdown2ctags.py',
  "     \ 'ctagsargs' : '-f - --sort=yes',
  "     \ 'kinds' : [
  "         \ 's:sections',
  "         \ 'i:images'
  "     \ ],
  "     \ 'sro' : '|',
  "     \ 'kind2scope' : {
  "         \ 's' : 'section',
  "     \ },
  "     \ 'sort': 0,
  " \ }
" }}}

" vim-markdown {{{
  let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'clojure']
" }}}

" Languages {{{

  " Clojure {{{
    " vim-clojure-static
    let g:clojure_align_multiline_strings = 1
    let g:clojure_fuzzy_indent_patterns = ['s/fdef', 'params', 'with-test-env',
      \'card', 'getInitialState', 'component', 'this-as', '^def', '^dom', 'div$',
      \'query', 'ident', 'render', 'cmd-hook', 'defentity', 'defplan',
      \'defproject', 'defsynth', 'group-spec', 'node-spec', 'defroutes', 'match',
      \'deftrace', 'defproject', 'deftest', 'with-db-connection', 'fact']
    " allow syntax highlighting and indent on any number of lines
    let g:clojure_maxlines = 0
    " cljx syntax highlighting
    autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
    " vim-fireplace / clojure
    " autocmd FileType clojure nmap <buffer> cpP :Eval<cr>
    " autocmd FileType clojure nmap <buffer> <leader>l :Last<cr>
    autocmd FileType clojure nmap <buffer> ctt :IcedTestUnderCursor<cr>
    autocmd FileType clojure nmap <buffer> ctm :IcedTestAll<cr>
    autocmd FileType clojure nmap <buffer> ctr :IcedTestRedo<cr>
    " autocmd FileType clojure nmap <buffer> cpR :Require!<cr>

    let g:fireplace_print_length = 80
    let g:fireplace_print_right_margin = 80

    " Re-enable gq!
    " autocmd FileType clojure set formatexpr=
    " Enable auto formatting
    autocmd FileType clojure set fo+=tc
    " Clojure macros
    autocmd FileType clojure let @i='ysabbais'
    " Clojure should have a very large foldlevel
    autocmd FileType clojure set foldlevel=64
    " ClojureScript
    nmap <leader><leader>pg :Piggieback (figwheel-sidecar.repl-api/repl-env)<cr>

    " vim-iced - https://liquidz.github.io/vim-iced
    aug VimIcedAutoFormatOnWriting
      au!
      " Format whole buffer on writing files
      " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

      " Format only current form on writing files
      " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
    aug END

    " Replicate vim-fireplace mappings for vim-iced
    autocmd FileType clojure nmap cqp :IcedEval<space>
    autocmd FileType clojure nmap cpr :IcedRequireAll<cr>
    autocmd FileType clojure nmap cpp :IcedEvalOuterTopList<cr>
    " autocmd FileType clojure nmap <buffer> cp <Plug>(iced_eval)
    autocmd FileType clojure nmap <buffer> cp <Plug>(iced_eval_and_print)
    " autocmd FileType clojure nmap <buffer> ct <Plug>(iced_eval_and_tap)
    " autocmd FileType clojure nmap <buffer> c! <Plug>(iced_print_last)
    autocmd FileType clojure nmap <buffer> c! <Plug>(iced_eval_and_tap)
    " this has potential to override "change till m" - might need a different
    " mapping, or get kaocha working
    " autocmd FileType clojure nmap <buffer> ctm :IcedEval (require 'midje.repl)(midje.repl/load-facts *ns*)<cr>

    " always print after evaluating in vim-iced
     " call iced#hook#add('evaluated', {
     "    \ 'type': 'command',
     "    \ 'exec': 'IcedPrintLast',
     "    \ })


    " add namespace
    autocmd FileType clojure nmap <buffer> <leader>an :IcedAddNs<cr>
    autocmd FileType clojure nmap <buffer> <leader>am :IcedAddMissing<cr>

    " vim-sexp
    " let g:sexp_enable_insert_mode_mappings = 0
    " Disable all sexp mappings
    let g:sexp_filetypes = ''

    " acid.nvim
    " autocmd FileType clojure nmap cpr :AcidRequire<cr>

  " }}}

  " TypeScript {{{
  " From https://github.com/peitalin/vim-jsx-typescript
  " autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  " hi tsxTag guifg=#F99575 ctermfg=lightgray
  " hi tsxTagName guifg=#E06C75 ctermfg=darkblue
  " hi tsxCloseString guifg=#F99575 ctermfg=darkblue
  " hi tsxCloseTag guifg=#F99575 ctermfg=lightgray
  " hi tsxCloseTagName guifg=#F99575 ctermfg=darkblue
  " hi tsxAttributeBraces guifg=#F99575 ctermfg=white
  " hi tsxJsBlock guifg=#F99575 ctermfg=darkcyan
  " hi tsxEqual guifg=#F99575 ctermfg=brown
  " hi tsxAttrib guifg=#F8BD7F cterm=italic ctermfg=darkmagenta

  " " light-grey
  " hi tsxTypeBraces guifg=#999999 ctermfg=lightgray
  " hi tsxTypes guifg=#666666 ctermfg=lightgray

  " hi ReactState guifg=#C176A7
  " hi ReactProps guifg=#D19A66
  " hi ApolloGraphQL guifg=#CB886B
  " hi Events ctermfg=204 guifg=#56B6C2
  " hi ReduxKeywords ctermfg=204 guifg=#C678DD
  " hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
  " hi WebBrowser ctermfg=204 guifg=#56B6C2
  " hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

  " Give more space for displaying messages.
  " set cmdheight=2
  " }}}

" }}}

" easy-align {{{
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
" }}}
"

" " yoink {{{
" nmap <c-n> <plug>(YoinkPostPasteSwapBack)
" nmap <c-p> <plug>(YoinkPostPasteSwapForward)

" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)

" " Also replace the default gp with yoink paste so we can toggle paste in this
" " case too
" nmap gp <plug>(YoinkPaste_gp)
" nmap gP <plug>(YoinkPaste_gP)

" " Now when you hit [y/]y the current yank will change and you will see a preview
" " of it in the status bar
" " nmap [y <plug>(YoinkRotateBack)
" " nmap ]y <plug>(YoinkRotateForward)

" " You might also want to add a map for toggling whether the current paste is
" " formatted or not:
" nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
" " Now, hitting <c-=> after a paste will toggle between formatted and unformatted
" " (equivalent to using the = key).

" " Finally, you can also optionally add the following map:
" nmap y <plug>(YoinkYankPreserveCursorPosition)
" xmap y <plug>(YoinkYankPreserveCursorPosition)

" " After adding this map, yank will function exactly the same as previously with
" " the one difference being that the cursor position will not change after
" " performing a yank. This can be more useful especially when yanking a large
" " text object such as a paragraph.

" " }}}

" ack {{{
  if executable('ag')
    let g:ackprg = 'ag --vimgrep --hidden'
  endif
  " use telescope instead
  " nnoremap \ :Ack!<space>
  " nnoremap <leader>* :Ack!<cword><cr>
" }}}

" This plugin no longer exists
" " ListToggle {{{
"   nmap <Leader>tq <Plug>ListToggleQuickfixListToggle
"   nmap <Leader>tl <Plug>ListToggleLocationListToggle
" " }}}

" Mundo {{{
  nnoremap <leader>mu :MundoToggle<cr>
" }}}

" jsonnet {{{
  autocmd FileType jsonnet setlocal commentstring=//\ %s
" }}}

" TypeScript {{{
  autocmd FileType typescript setlocal commentstring=//\ %s
  autocmd FileType typescript.jsx setlocal commentstring=//\ %s
" }}}

" Firestore {{{
  autocmd FileType firestore setlocal commentstring=//\ %s
" }}}

" JavaScript {{{
let g:jsx_ext_required = 0
" }}}

" kitty {{{

" tbone replacement using kitty
"

" ls -al

  " system('tmux send-keys -t '.pane_id.' "" '.shellescape(a:keys))
  " system('kitty @ send-text --match title:left hi')
  " :Dispatch! kitty @ send-text --match title:left echo hi $line
  " :call dispatch#start("kitty @ send-text --match title:left ls")
  " :call dispatch#start("kitty @ send-text --match title:left ls")

function! TerminalH()
  let line=getline('.')
  " execute "Spawn! kitty @ send-text --match title:left ".line."\r"
  " execute "!kitty  @ send-text --match title:left " . line . "\r"
  let ignore = system("kitty  @ send-text --match title:left " . line . "\r", "")
  echo ignore
endfunction
nnoremap <leader>twh :call TerminalH()<cr>

function! TerminalL()
  let line=getline('.')
  " execute "Spawn! kitty @ send-text --match title:ia ".line."\r"
  let result = system("kitty @ send-text --match title:right " . line . "\r")
endfunction
nnoremap <leader>twl :call TerminalL()<cr>

" nmap <leader>twl <s-v>:Dispatch


" vmap <leader>twl :TREPLSendLine<cr>


" }}}
