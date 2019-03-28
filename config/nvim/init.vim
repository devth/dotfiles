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
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tommcdo/vim-fubitive' " bitbucket for fugitive
  Plug 'shumphrey/fugitive-gitlab.vim' " gitlab for fugitive
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-scriptease'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-tbone'
  Plug 'tpope/vim-unimpaired'
  " Plug 'tpope/vim-obsession'

  " Colors - some plugins rely on this
  Plug 'devth/vim-colors-solarized' " Note: devth-fork

  " General Syntax
  Plug 'tpope/vim-markdown', {'for': 'markdown'}
  Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
  Plug 'google/vim-jsonnet', {'for': 'jsonnet'}
  Plug 'fatih/vim-go', {'for': 'go'}
  Plug 'hashivim/vim-vagrant', {'for': 'vagrant'}
  Plug 'mattn/emmet-vim'
  " Plug 'jparise/vim-graphql', {'for': 'graphql'}

  " JavaScript
  Plug 'jelera/vim-javascript-syntax'
  Plug 'mxw/vim-jsx'

  " Clojure
  " Test out a fork of tpope/vim-fire place until
  " https://github.com/tpope/vim-fireplace/pull/323 is merged
  " Plug 'raymond-w-ko/vim-fireplace', {'for': 'clojure'}
  " Plug 'tpope/vim-fireplace', {'for': 'clojure'}

  Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'} " clj completion
  " needed for edn and the latest clojure syntax
  Plug 'guns/vim-clojure-static', {'for': 'clojure'}
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure', 'branch': 'master'}
  " Plug 'matthias-margush/vim-iced', {'for': 'clojure', 'branch': 'piggieback' }
  " Note: Doesn't work with .cljc files yet:
  " TODO get this working
  " Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }

  " Elm
  Plug 'ElmCast/elm-vim'

  " File exploration / openning
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Can't get these to work right - font is not configured?
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'ryanoasis/vim-devicons'

  " tmux integration
  " Plug 'tmux-plugins/vim-tmux'
  " Plug 'christoomey/vim-tmux-navigator'

  " Utils
  " Plug 'vimlab/split-term.vim' " Terminal utils
  Plug 'mhinz/vim-signify'
  Plug 'kassio/neoterm' " Terminal utils
  Plug 'vim-scripts/regreplop.vim' " replace!
  Plug 'w0rp/ale' " Async Lint Engine
  Plug 'vim-scripts/YankRing.vim' " Keep track of past yanked values
  Plug 'vim-scripts/tComment' " Comment stuff
  Plug 'junegunn/goyo.vim' " Writing mode
  Plug 'majutsushi/tagbar' " ctags!
  Plug 'michaeljsmith/vim-indent-object' " indent objects
  Plug 'junegunn/vim-easy-align' " alignment!
  Plug 'mileszs/ack.vim' " search file contents via ag or ack
  Plug 'fszymanski/ListToggle.vim' " Toggle Quickfix and Location List
  Plug 'simnalamburt/vim-mundo' " Vim undo tree viz
  " Plug 'chr4/sslsecure.vim' " Highlight insecure SSL configuration
  " Superfast fuzzy file finder
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug '/usr/local/opt/fzf' " installed via Homebrew
  Plug 'junegunn/fzf.vim'
  Plug 'Vigemus/nvimux' " Tmux-like key bindings for NeoVim

  " Powerline alternatives
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gcmt/taboo.vim'

  " Completion and snippets
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2-tmux' " don't use tmux anymore
  Plug 'ncm2/ncm2-path' " bufpath, cwdpath, rootpath
  Plug 'ncm2/ncm2-github' " github users, repos, links, issues, emoji
  Plug 'ncm2/ncm2-bufword' " words from current buffer for completion
  " View https://github.com/ncm2/ncm2/wiki for more completion plugins
  " Plug 'ncm2/ncm2-ultisnips' " TODO test this
  " Plug 'SirVer/ultisnips' " throws runtime errors
  " Plug 'honza/vim-snippets' " Do we need this?

  " TypeScript
  " Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " TSServer client
  " tsuquyomi is busted:
  " call dein#add('Quramy/tsuquyomi')

  " Facebook Flow
  " Very slow last I checked so it's disabled:
  " call dein#add('flowtype/vim-flow')

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
  set shell=/bin/zsh\ -l
  let mapleader = ","
  let maplocalleader = ","
  set history=1000
  set undolevels=1000
  set nocursorline nocursorcolumn " vim is slow with these on :/

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
  " Completion
  set complete=.,w,b,u,t,i,],kspell
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
  vmap <leader>twl :TREPLSendLine<cr>

  " neoterm configuration
  " let g:neoterm_position = 'vertical'
  " Don't try to auto load a term
  let g:neoterm_auto_repl_cmd = 0
  let g:neoterm_default_mod = 'vertical'
  let g:neoterm_term_per_tab = 1

  " Use gx{text-object} in normal mode
  nmap gx <Plug>(neoterm-repl-send)

  " Send selected contents in visual mode.
  xmap gx <Plug>(neoterm-repl-send)

  " Send line - can use 2gxx to send 2 lines
  nmap gxx <Plug>(neoterm-repl-send-line)

  " Toggle term visibility
  nmap gxt :Ttoggle<cr><c-w>=



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

  " Use marker foldmethod for specific file types
  autocmd FileType yaml,vim,zsh,sh,make setlocal foldmethod=marker foldlevel=0
  nnoremap z<space> za " easier toggling
  " Don't open folds for me when searching
  " (might want to be able to toggle this)
  set fdo-=search
" }}}

" Aesthetics {{{

  " This must be defined before activating colorscheme

  " augroup my_neomake_signs
  "     au!
  "     autocmd ColorScheme *
  "         \ hi NeomakeErrorSign ctermfg=red ctermbg=black |
  "         \ hi NeomakeWarningSign ctermfg=yellow
  " augroup END

  fun! CustomizeDarkColors()
    " Remove background on vertical splits
    " Hide the ~ characters at end of files
    " Customize Folds
    if &background == 'dark'
      hi VertSplit ctermbg=0 ctermfg=0 guibg=#FAF2DC
      hi NonText cterm=NONE gui=NONE guibg=NONE guifg=#FAF2DC ctermbg=0 ctermfg=0
      hi ColorColumn ctermbg=black
      hi Folded cterm=bold ctermfg=cyan ctermbg=black
      hi FoldColumn cterm=reverse
      hi fmrkr ctermbg=black ctermfg=black
    else
      hi NonText ctermbg=7 ctermfg=7
      hi ColorColumn ctermbg=7
      hi VertSplit ctermbg=7 ctermfg=7
      hi fmrkr ctermbg=7 ctermfg=7
    endif
  endfun

  augroup vimrc
    autocmd!
    autocmd ColorScheme * call CustomizeDarkColors()
  augroup END

  " Create syntax fmrkr for folds
  autocmd BufRead,BufNewFile * syn match fmrkr '"*{{{\|"*}}}' |
        \ syn cluster vimCommentGroup contains=fmrkr

  colorscheme solarized

  set colorcolumn=80
  set guioptions=egmt
  set bg=dark
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

  " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
  " set guifont=Knack\ Nerd\ Font\ Regular:12
  " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
  " Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

  " Remove vertical split pipe
  set fillchars=

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

" NERDTree {{{
  map <leader>nt :NERDTreeFocus<cr>
  map <leader>ntf :NERDTreeFind<cr>
  map <leader>ntc :NERDTreeClose<cr>
  " Stay in sync with current working directory
  let NERDTreeChDirMode=2
  let NERDTreeQuitOnOpen=0
  let NERDTreeMapToggleHidden=1
  let NERDTreeCascadeSingleChildDir=0 " do not collapse
  let NERDTreeShowHidden=1
" }}}

" tbone {{{

  " right
  " nnoremap <leader>twl <s-v>:Twrite right<cr>
  " vnoremap <leader>twl :Twrite right<cr>

  " left
  nnoremap <leader>twh <s-v>:Twrite left<cr>
  vnoremap <leader>twh :Twrite left<cr>

  " bottom left
  nnoremap <leader>twjh <s-v>:Twrite bottom-left<cr>
  vnoremap <leader>twjh :Twrite bottom-left<cr>

  " bottom right
  nnoremap <leader>twjl <s-v>:Twrite bottom-right<cr>
  vnoremap <leader>twjl :Twrite bottom-right<cr>

  " top left
  nnoremap <leader>twkh <s-v>:Twrite top-left<cr>
  vnoremap <leader>twkh :Twrite top-left<cr>

  " top right
  nnoremap <leader>twkl <s-v>:Twrite top-right<cr>
  vnoremap <leader>twkl :Twrite top-right<cr>

" }}}

" Regreplop {{{
  nmap <leader>r <Plug>ReplaceMotion
  nmap <leader>r<leader>r <Plug>ReplaceLine
  vmap <leader>r <Plug>ReplaceVisual
" }}}

" git {{{
  map <leader>gb :Gblame<cr>
  map <leader>gh :Gbrowse<cr>
  map <leader>ge :Gedit<cr>
  map <leader>gl :Glog<cr>
  map <leader>gw :Gwrite<cr>
  map <leader>gs :Gstatus<cr>
  map <leader>gs :Gstatus<cr>
  map <leader>gP :Gpush -u origin `git rev-parse --abbrev-ref HEAD`<cr>
  map <leader>gp :Gpull --rebase<cr>
  map <leader>ga :Dispatch! git add %<cr>
  map <leader>gc :Gcommit
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

  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['prettier']

  let g:ale_fixers['typescript'] = ['prettier']


  let g:ale_fixers['css'] = ['prettier']

  " Prettier
  let g:prettier#config#parser = 'babylon'
  let g:ale_javascript_prettier_use_local_config = 1

  nnoremap <leader>af :ALEFix<cr>

  " NUKE FLOW TO OBLIVION. NEVER RUN FLOW. FLOW WILL CONSUME ALL YOUR RESOURCES
  " AND BRING YOUR modern cutting edge hardware to a crawl. You will hard reboot
  " daily. You will pull your hair out. You will hate life.
  "
  " UNLESS YOU DISABLE FLOW. DO THE RIGHT THING.
  let g:ale_linters = {
    \   'javascript': ['eslint', 'jscs', 'jshint', 'prettier', 'prettier-eslint', 'prettier-standard', 'standard', 'xo'],
  \}

  let g:ale_linters_ignore = {'typescript': ['tslint']}

  " autocmd FileType javascript
  let g:ale_javascript_prettier_options = '--single-quote --no-bracket-spacing --print-width 120'

  let g:ale_linters = {
    \   'javascript': ['eslint', 'jscs', 'jshint', 'prettier', 'prettier-eslint', 'prettier-standard', 'standard', 'xo'],
  \}

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

" fzf {{{
  " let g:fzf_layout = { 'left': '~30%' }
  " ctrl-p replacement
  nmap <leader>p :Files<cr>
  nmap <leader>bp :Buffers<cr>
  " line wise completion
  imap <c-x><c-l> <plug>(fzf-complete-line)
  " find commits
  nnoremap <leader>fc :Commits<cr>
  " find lines
  nnoremap <leader>fl :Lines<cr>

" }}}

" vim-tmux-navigator {{{
  " Disable tmux navigator when zooming the Vim pane
  let g:tmux_navigator_disable_when_zoomed = 1
" }}}

" nvimux {{{

lua << EOF
local nvimux = require('nvimux')

-- Nvimux configuration
nvimux.config.set_all{
  prefix = '<C-space>',
  new_window = 'enew', -- Use 'term' if you want to open a new term for every new window
  new_tab = 'term', -- Defaults to new_window. Set to 'term' if you want a new term for every new tab
  new_window_buffer = 'single',
  quickterm_direction = 'botright',
  quickterm_orientation = 'vertical',
  quickterm_scope = 't', -- Use 'g' for global quickterm
  quickterm_size = '80',
}

-- Nvimux custom bindings
nvimux.bindings.bind_all{
  {'s', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
  {'v', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
}

-- Required so nvimux sets the mappings correctly
nvimux.bootstrap()
EOF

" }}}

" TagBar {{{
  let g:tagbar_compact = 1
  nmap <leader>tb :TagbarOpen fj<cr>
  " Configure TagBar for markdown
  " Add support for markdown files in tagbar.
  let g:tagbar_type_markdown = {
      \ 'ctagstype': 'markdown',
      \ 'ctagsbin' : '$HOME/.dotfiles/markdown2ctags.py',
      \ 'ctagsargs' : '-f - --sort=yes',
      \ 'kinds' : [
          \ 's:sections',
          \ 'i:images'
      \ ],
      \ 'sro' : '|',
      \ 'kind2scope' : {
          \ 's' : 'section',
      \ },
      \ 'sort': 0,
  \ }
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
      \'deftrace', 'defproject', 'deftest', 'with-db-connection']
    " allow syntax highlighting and indent on any number of lines
    let g:clojure_maxlines = 0
    " cljx syntax highlighting
    autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
    " vim-fireplace / clojure
    " autocmd FileType clojure nmap <buffer> cpP :Eval<cr>
    " autocmd FileType clojure nmap <buffer> <leader>l :Last<cr>
    " autocmd FileType clojure nmap <buffer> ctt :Require<cr>:Eval (run-tests)<cr>
    " autocmd FileType clojure nmap <buffer> ctm :Eval (require 'midje.repl)(midje.repl/load-facts *ns*)<cr>
    " autocmd FileType clojure nmap <buffer> cpR :Require!<cr>

    let g:fireplace_print_length = 80
    let g:fireplace_print_right_margin = 80

    " Re-enable gq!
    autocmd FileType clojure set formatexpr=
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
    let g:iced_enable_auto_indent = v:false

    " Replicate vim-fireplace mappings for vim-iced
    autocmd FileType clojure nmap cqp :IcedEval 
    autocmd FileType clojure nmap cpr :IcedRequireAll<cr>
    autocmd FileType clojure nmap cpp :IcedEvalOuterTopList<cr>
    autocmd FileType clojure nmap <buffer> cp <Plug>(iced_eval)
    autocmd FileType clojure nmap <buffer> ctm :IcedEval (require 'midje.repl)(midje.repl/load-facts *ns*)<cr>
    let g:sexp_enable_insert_mode_mappings = 0
    " Disable all sexp mappings
    let g:sexp_filetypes = ''

    " acid.nvim
    " autocmd FileType clojure nmap cpr :AcidRequire<cr>

  " }}}

" }}}

" easy-align {{{
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
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
  nnoremap \ :Ack!<space>
  nnoremap <leader>* :Ack!<cword><cr>
" }}}

" ListToggle {{{
  nmap <Leader>tq <Plug>ListToggleQuickfixListToggle
  nmap <Leader>tl <Plug>ListToggleLocationListToggle
" }}}

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

" ncm2 and UltiSnips {{{

  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to hide the menu and also start a new line.
  " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

  " let g:UltiSnipsSnippetsDir='~/.vim_snippets'
  " let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim_snippets']

  " let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  " let g:UltiSnipsExpandTrigger = "<tab>"

  " let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
  " let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
  " let g:UltiSnipsRemoveSelectModeMappings = 0
  " inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

  " enable ncm2 for all buffers
  " autocmd BufEnter * call ncm2#enable_for_buffer()

  " noesnippet
  " imap <c-j>     <Plug>(neosnippet_expand_or_jump)
  " vmap <c-j>     <Plug>(neosnippet_expand_or_jump)
  " inoremap <silent> <c-u> <c-r>=cm#sources#neosnippet#trigger_or_popup("\<Plug>(neosnippet_expand_or_jump)")<cr>
  " vmap <c-u>     <Plug>(neosnippet_expand_target)
  " " expand parameters
  " let g:neosnippet#enable_completed_snippet=1
  " let g:neosnippet#snippets_directory=$HOME.'/.vim_snippets'


" }}}

" JavaScript {{{
let g:jsx_ext_required = 0
" }}}
