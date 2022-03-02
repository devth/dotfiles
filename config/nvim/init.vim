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

  " auto-install vim-plug if not already installed
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo 'not installed'
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " begin vim-plug
  call plug#begin('~/.config/nvim/plugged')

  " Global plugins for all filetypes
  Plug 'tpope/vim-abolish'
  " Plug 'tpope/vim-dispatch'
  " Plug 'radenling/vim-dispatch-neovim'
  " Plug 'tpope/vim-eunuch'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb' " GBrowse and GH enterprise
  " this is buggy and causes lots of errors - TODO find alternative:
  " Plug 'APZelos/blamer.nvim'
  Plug 'shumphrey/fugitive-gitlab.vim' " gitlab for fugitive
  " Plug 'idanarye/vim-merginal' " branch mgmt for fugitive
  " Plug 'lambdalisue/gina.vim'
  Plug 'tpope/vim-git'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim', { 'branch': 'main' }
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils', { 'branch': 'main' }
  Plug 'folke/trouble.nvim', { 'branch': 'main' }
  Plug 'RRethy/vim-illuminate' " highlight words under cursor

  " Snippets
  Plug 'hrsh7th/vim-vsnip' " snippet engine

  " Completion
  Plug 'nvim-lua/completion-nvim'
  Plug 'github/copilot.vim', { 'branch': 'release' }
  " Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' } " nvim-cmp
  " Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' } " Install the buffer completion source

  " Generally usefull stuff
  Plug 'tpope/vim-repeat'
  " Plug 'tpope/vim-rhubarb' " TODO find replacement or re-enable
  Plug 'tpope/vim-speeddating' " increment stuff
  Plug 'tpope/vim-surround' " obviously
  " Plug 'tpope/vim-tbone'
  Plug 'tpope/vim-unimpaired' " bracket mappings
  " Plug 'tpope/vim-obsession'

  " Colors - some plugins rely on this
  " Plug 'devth/vim-colors-solarized' " Note: devth-fork
  " Plug 'overcache/NeoSolarized'
  Plug 'ishan9299/nvim-solarized-lua'


  " Use TreeSitter for language highlighting instead
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " General Syntax - these shouldn't slow things down
  " Plug 'tpope/vim-markdown', {'for': 'markdown'}
  " Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
  " Plug 'google/vim-jsonnet', {'for': 'jsonnet'}
  " Plug 'fatih/vim-go', {'for': 'go'}
  " Plug 'hashivim/vim-vagrant', {'for': 'vagrant'}
  " Plug 'mustache/vim-mustache-handlebars'
  " " Plug 'jparise/vim-graphql', {'for': 'graphql'}
  " Plug 'jparise/vim-graphql', {'for': 'graphql'}
  Plug 'delphinus/vim-firestore' " firestore highlighting
  " Plug 'pangloss/vim-javascript', {'for': 'javascript'}
  Plug 'hashivim/vim-terraform'
  Plug 'unisonweb/unison', { 'branch': 'trunk', 'rtp': 'editor-support/vim' }

  Plug 'mattn/emmet-vim' " expanding abbreviations (HTML mostly)

  " JavaScript
  " " Plug 'mxw/vim-jsx'
  " Plug 'neoclide/vim-jsx-improve'

  " Clojure
  " Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'} " clj completion
  " " needed for edn and the latest clojure syntax
  " Plug 'guns/vim-clojure-static', {'for': 'clojure'}
  " Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
  " " Plug 'liquidz/vim-iced', {'for': 'clojure', 'branch': 'dev'}
  Plug 'liquidz/vim-iced', {'for': 'clojure', 'branch': 'main' }
  Plug 'liquidz/vim-iced-project-namespaces', {'for': 'clojure'}
  Plug 'guns/vim-sexp', {'for': 'clojure'} " NOTE: required for vim-iced
  " Plug 'liquidz/vim-iced-kaocha'
  " " Plug 'matthias-margush/vim-iced', {'for': 'clojure', 'branch': 'piggieback' }
  " " Note: Doesn't work with .cljc files yet:
  " " TODO get this working
  " " Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }

  " " Elm
  " Plug 'ElmCast/elm-vim', {'for': 'elm'}

  " File exploration / openning
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  " Plug 'scrooloose/nerdtree'
  " Plug 'Xuyuanp/nerdtree-git-plugin'
  " Can't get these to work right - font is not configured?
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'ryanoasis/vim-devicons'

  " tmux integration
  " Plug 'tmux-plugins/vim-tmux'
  " Plug 'christoomey/vim-tmux-navigator'

  " Utils
  " Plug 'vimlab/split-term.vim' " Terminal utils
  " Plug 'christianrondeau/vim-base64'
  " Plug 'mhinz/vim-signify'
  Plug 'kassio/neoterm' " Terminal utils
  " Plug 'vim-scripts/regreplop.vim' " replace!

  Plug 'svermeulen/vim-subversive' " Replace stuff
  Plug 'tpope/vim-commentary' " commenting



  " TODO possibly re-enable this but figure out how to make it not conflict with
  " CoC.nvim
  " Plug 'dense-analysis/ale' " Async Lint Engine
  " Plug 'vim-scripts/YankRing.vim' " (SLOW) Keep track of past yanked values
  Plug 'svermeulen/vim-yoink'
  " Plug 'vim-scripts/tComment' " Comment stuff
  " Plug 'junegunn/goyo.vim' " Writing mode
  " Plug 'preservim/tagbar' " ctags!
  " Plug 'lvht/tagbar-markdown' " tagbar for md files
  " Plug 'liuchengxu/vista.vim'
  Plug 'michaeljsmith/vim-indent-object' " indent objects
  " Plug 'junegunn/vim-easy-align' " alignment!
  " Plug 'mileszs/ack.vim' " search file contents via ag or ack
  " Plug 'simnalamburt/vim-mundo' " Vim undo tree viz

  " Plug 'chr4/sslsecure.vim' " Highlight insecure SSL configuration

  " Fuzzy file finder
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug '/usr/local/opt/fzf' " installed via Homebrew

  " Plug 'junegunn/fzf.vim' " if you want latest fzf use this instead
  " Plug 'junegunn/fzf', { 'do': './install --all' }
  " Plug 'junegunn/fzf', { 'do': './install --bin' }
  " Plug 'junegunn/fzf.vim'

  " Use actual tmux instead
  " Plug 'Vigemus/nvimux' " Tmux-like key bindings for NeoVim

  " Status line
  Plug 'nvim-lualine/lualine.nvim'
  "
  " Powerline alternatives
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'

  " Plug 'gcmt/taboo.vim' " Tabs

  " TypeScript
  " Plug 'pangloss/vim-javascript'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'peitalin/vim-jsx-typescript'

  " Language Service Client
  " Originally configured for TypeScript following
  " https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " let g:coc_global_extensions = [
  "       \ 'coc-tsserver'
  "       \ ]

  " Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
  " Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " TSServer client

  call plug#end()
" }}}

" Vim system settings {{{
  if !empty(glob("~/.vimrc_private"))
    source ~/.vimrc_private
  endif
  " set foldmethod=marker
  set nowrap
  set ttyfast
  set lazyredraw
  set nocompatible
  syntax on
  filetype plugin indent on
  set shell=/bin/zsh
  " set shellcmdflag=-l
  let mapleader = ","
  let maplocalleader = ","
  set history=1000
  set undolevels=1000
  set nocursorline nocursorcolumn " vim is slow with these on :/

  imap kj <Esc>

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

" Lualine {{{

lua << EOF
require'lualine'.setup{
  options = { theme  = 'solarized_light' },
  extensions = {'quickfix', 'nvim-tree'},
  sections = { lualine_c = {'nvim_treesitter#statusline(90)'} }
}
EOF

" }}}


" Aesthetics {{{

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
  set guioptions=egmt
  " default background color - can be toggled
  set bg=light

  let g:airline_powerline_fonts = 1
  " Only load the Airline extensions we want
  " let g:airline_extensions = ['tabline', 'ale', 'fugitive']

  " let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#enabled = 1
  " let g:airline#extensions#tabline#formatter = 'pwd'
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
  " collapse parent dirs in buffer names
  " let g:airline#extensions#tabline#fnamecollapse = 1

  " let g:airline#extensions#tabline#show_tab_nr = 1
  " let g:airline#extensions#tabline#show_tab_type = 1

  " Use tab index
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#show_tab_nr = 1

  " Disable tmuxline overwriting so we can configure it ourselves
  let g:airline#extensions#tmuxline#enabled = 0

  " Use Taboo for tabs
  let g:airline#extensions#taboo#enabled = 1
  set t_Co=256

  " Disable Taboo's tabline
  let g:taboo_tabline = 0

  let taboo_renamed_tab_format = "%l"
  " if the above includes %m it looks all messed up with %#TabModifiedSelected
  " in the tab when it gets modified. Might be a Taboo bug ?
  let taboo_modified_tab_flag = "⚡️"

  " Quickly switch between light and dark
  nnoremap <leader>bgl :set bg=light<cr>
  nnoremap <leader>bgd :set bg=dark<cr>

  " controls vertical split pipe, end of buffer
  set fillchars=fold:\ ,vert:\│,eob:\.,msgsep:‾

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
" }}}

" TreeSitter {{{

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
}

EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" }}}

" Trouble {{{

lua << EOF
-- require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
-- }
EOF

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}

" LSP {{{

lua << EOF


-- from https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
-- updated 1/15/2022

local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
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
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)")
    end
end

lspconfig.tsserver.setup({
    flags = {
      debounce_text_changes = 500,
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})
--

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
}
local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 500,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}
local formatters = {
    prettier = {command = "eslint_d", args = {"--fix-to-stdout", "--stdin", "--stdin-filename", "%filepath"}}
}
local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier"
}

-- nvim_lsp.diagnosticls.setup {
--    on_attach = on_attach,
--    filetypes = vim.tbl_keys(filetypes),
--    init_options = {
--        filetypes = filetypes,
--        linters = linters,
--        formatters = formatters,
--        formatFiletypes = formatFiletypes
--    }
--}

EOF

" au BufEnter * typescript require'completion'.on_attach()

" }}}

" Completion {{{

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua <<EOF

vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_ignore_case = 1
vim.g.completion_auto_change_source = 1


-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    else
        return t "<Tab>"
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Chain completion list
vim.g.completion_chain_complete_list = {
  default = {
    default = {{complete_items = {'lsp', 'snippet', 'buffers'}}, {mode = '<c-p>'}, {mode = '<c-n>'}},
    comment = {},
    string = {{complete_items = {'path'}}}
  }
}

-- use .ts snippets in .tsx files
vim.g.vsnip_filetypes = {
    typescriptreact = {"typescript"}
}
EOF


let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]


" }}}

" File explorer (nvim-tree) {{{


lua <<EOF
-- following options are the default
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = false,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = true,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = true,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = true,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
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
  map <leader>dr :Dispatch<space>
  map <leader>dl :execute 'Dispatch ' . getline('.')<cr>
  " cmap <C-R><C-L> <C-R>=getline('.')<CR>

" }}}

" dein mappings & config {{{
  nnoremap <leader>du :call dein#update()<cr>
  nnoremap <leader>di :call dein#install()<cr>

  " Try this out temporarily
  let g:dein#enable_notification = 1

" }}}

" Linting {{{
  " Enable Neomake on save on expected file types
  " autocmd! BufWritePost sh,markdown Neomake
  " Or just enable it everywhere all the time because it's async!
  " autocmd! BufEnter,BufRead,BufWritePost * Neomake
  " let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
  " let g:neomake_error_sign = {'text': '•', 'texthl': 'NeomakeErrorSign'}

  let g:ale_sign_error = '⚠'
  let g:ale_sign_warning = '•'
  " Disabling trailing whitespace warnings doesn't affect Markdown because
  " markdownlint checks that too
  let g:ale_warn_about_trailing_whitespace = 0
  let g:ale_lint_delay = 1000

  let g:ale_fixers = {
  \   'javascript': ['prettier', 'eslint'],
  \   'typescript': ['prettier'],
  \   'css': ['prettier'],
  \}

  let g:ale_fix_on_save = 1

  " let b:ale_fixers = {}
  " let b:ale_fixers['javascript'] = ['prettier']
  " let b:ale_fixers['typescript'] = ['prettier']
  " let b:ale_fixers['css'] = ['prettier']
  " let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']

  " Prettier
  let g:prettier#config#parser = 'babylon'
  let g:ale_javascript_prettier_use_local_config = 1

  nnoremap <leader>af :ALEFix<cr>

  " NUKE FLOW TO OBLIVION. NEVER RUN FLOW. FLOW WILL CONSUME ALL YOUR RESOURCES
  " AND BRING YOUR modern cutting edge hardware to a crawl. You will hard reboot
  " daily. You will pull your hair out. You will hate life.
  "
  " UNLESS YOU DISABLE FLOW. DO THE RIGHT THING.

  " let g:ale_linters = {
  "   \   'javascript': ['eslint', 'jscs', 'jshint', 'prettier', 'prettier-eslint', 'prettier-standard', 'standard', 'xo'],
  " \}

  let g:ale_linters = {'clojure': ['clj-kondo']}

  " let g:ale_linters_ignore = {'typescript': ['tslint']}

  " autocmd FileType javascript
  " let g:ale_javascript_prettier_options = '--single-quote --no-bracket-spacing --print-width 120'

  " let g:ale_linters = {
  "   \   'javascript': ['eslint', 'jscs', 'jshint', 'prettier', 'prettier-eslint', 'prettier-standard', 'standard', 'xo'],
  " \}

  nmap <Leader><Leader>p <Plug>(Prettier)

  " let g:ale_fix_on_save = 1


  " Flow typed
  " https://github.com/flowtype/vim-flow
  " let g:flow#enable = 0
  " let g:flow#showquickfix = 0
  " let g:flow#autoclose = 1
  " let g:flow#timeout = 4
  " autocmd FileType javascript nnoremap <leader>ft :FlowType<cr>
  " autocmd FileType javascript nnoremap <leader>fj :FlowJumpToDef<cr>
  " " TODO what about gf for non-flow projects?
  " autocmd FileType javascript nnoremap gf :FlowJumpToDef<cr>

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
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fl <cmd>Telescope git_files<cr>
  nnoremap <leader>tgb <cmd>Telescope git_branches<cr>
  nnoremap <leader>tts <cmd>Telescope treesitter<cr>

  nnoremap \ <cmd>Telescope live_grep<cr>
  nnoremap <leader>* <cmd>Telescope grep_string<cr>

  " :lua require'telescope.builtin'.planets{}
  " :nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}

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
    " autocmd FileType clojure nmap <buffer> ctm :Eval (require 'midje.repl)(midje.repl/load-facts *ns*)<cr>
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

    " vim-iced
    let g:iced_enable_default_key_mappings = v:true
    " let g:iced_enable_auto_indent = v:false

    let g:iced#format#rule = {
      \ 'midje.sweet/fact': '[[:inner 0]]',
      \ 'midje.sweet/facts': '[[:inner 1]]',
    \ }

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
    autocmd FileType clojure nmap <buffer> ctm :IcedEval (require 'midje.repl)(midje.repl/load-facts *ns*)<cr>

    " add namespace
    autocmd FileType clojure nmap <buffer> <leader>an :IcedAddNs<cr>
    autocmd FileType clojure nmap <buffer> <leader>am :IcedAddMissing<cr>

    " vim-sexp
    let g:sexp_enable_insert_mode_mappings = 1
    " Disable all sexp mappings
    " let g:sexp_filetypes = ''

    " acid.nvim
    " autocmd FileType clojure nmap cpr :AcidRequire<cr>

  " }}}

  " TypeScript {{{
  " From https://github.com/peitalin/vim-jsx-typescript
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  hi tsxTag guifg=#F99575 ctermfg=lightgray
  hi tsxTagName guifg=#E06C75 ctermfg=darkblue
  hi tsxCloseString guifg=#F99575 ctermfg=darkblue
  hi tsxCloseTag guifg=#F99575 ctermfg=lightgray
  hi tsxCloseTagName guifg=#F99575 ctermfg=darkblue
  hi tsxAttributeBraces guifg=#F99575 ctermfg=white
  hi tsxJsBlock guifg=#F99575 ctermfg=darkcyan
  hi tsxEqual guifg=#F99575 ctermfg=brown
  hi tsxAttrib guifg=#F8BD7F cterm=italic ctermfg=darkmagenta

  " light-grey
  hi tsxTypeBraces guifg=#999999 ctermfg=lightgray
  hi tsxTypes guifg=#666666 ctermfg=lightgray

  hi ReactState guifg=#C176A7
  hi ReactProps guifg=#D19A66
  hi ApolloGraphQL guifg=#CB886B
  hi Events ctermfg=204 guifg=#56B6C2
  hi ReduxKeywords ctermfg=204 guifg=#C678DD
  hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
  hi WebBrowser ctermfg=204 guifg=#56B6C2
  hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

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

" yoink {{{
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this
" case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

" Now when you hit [y/]y the current yank will change and you will see a preview
" of it in the status bar
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

" You might also want to add a map for toggling whether the current paste is
" formatted or not:
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
" Now, hitting <c-=> after a paste will toggle between formatted and unformatted
" (equivalent to using the = key).

" Finally, you can also optionally add the following map:
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" After adding this map, yank will function exactly the same as previously with
" the one difference being that the cursor position will not change after
" performing a yank. This can be more useful especially when yanking a large
" text object such as a paragraph.

" }}}

" YankRing {{{
let yankring_persist = 1
let yankring_share_between_instances = 1
nnoremap <leader>yr :YRShow<cr>
" }}}

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
