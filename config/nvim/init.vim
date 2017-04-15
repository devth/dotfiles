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

  " Download dein if it doesn't exist yet
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  " Configure dein
  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')

  " tpope
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fireplace')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-markdown')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-scriptease')
  call dein#add('tpope/vim-speeddating')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-tbone')
  call dein#add('tpope/vim-unimpaired')

  " Colors - some plugins rely on this
  call dein#add('devth/vim-colors-solarized') " Note: devth-fork

  " Syntax
  call dein#add('ekalinin/Dockerfile.vim')

  " Clojure
  call dein#add('clojure-vim/async-clj-omni') " clj completion for deoplete
  " needed for edn and the latest clojure syntax
  " call dein#add('guns/vim-clojure-static')

  " git
  call dein#add('tommcdo/vim-fubitive') " bitbucket for fugitive
  call dein#add('shumphrey/fugitive-gitlab.vim') " gitlab for fugitive

  " File exploration / openning
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  " Can't get these to work right - font is not configured?
  " call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  " call dein#add('ryanoasis/vim-devicons')

  " tmux integration
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('christoomey/vim-tmux-navigator')

  " Utils
  call dein#add('vim-scripts/regreplop.vim') " replace!
  call dein#add('neomake/neomake') " async syntax checking, building
  call dein#add('vim-scripts/YankRing.vim') " Keep track of past yanked values
  call dein#add('vim-scripts/tComment') " Comment stuff
  call dein#add('junegunn/goyo.vim') " Writing mode
  call dein#add('majutsushi/tagbar') " ctags!
  call dein#add('michaeljsmith/vim-indent-object') " indent objects
  call dein#add('junegunn/vim-easy-align') " alignment!
  call dein#add('mileszs/ack.vim') " search file contents via ag or ack
  call dein#add('fszymanski/ListToggle.vim') " Toggle Quickfix and Location List
  call dein#add('simnalamburt/vim-mundo') " Vim undo tree viz

  " Superfast fuzzy file finder
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Powerline alternatives
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax')

  " Ensure configured dein plugins are installed
  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  " End dein
  call dein#end()
  call dein#save_state()
" }}}

" Vim system settings {{{
  " set foldmethod=marker
  set nowrap
  set nocompatible
  syntax on
  filetype plugin indent on
  set shell=/bin/zsh
  let mapleader = ","
  let maplocalleader = ","
  set history=1000
  set undolevels=1000
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
" }}}

" Vim system mappings {{{

  " Split navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Center screen on line
  nmap <space> zz

  " Edit / reload .vimrc
  nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
  nmap <silent> <leader>sv :so $MYVIMRC<CR>
  vmap <leader>sv y:@"<CR>

  " Edit .zshrc
  nnoremap <leader>ez <C-w><C-v><C-l>:e ~/.zshrc<cr>

  " Always open help in vert split
  autocmd FileType help wincmd L

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
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>``

  " Remove last character in line
  function! RmLastChar()
    :s/.$/
  endfunction
  nnoremap <leader>ax :call RmLastChar()<cr>
  vnoremap <leader>ax :call RmLastChar()<cr>

  " Toggle Goyo
  nnoremap <leader>go :Goyo<cr>
" }}}

" Vim system autocmds {{{
  " turn on spelling for certain files
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  autocmd BufRead,BufNewFile *.md set cursorline cursorcolumn

  autocmd FileType gitcommit setlocal spell complete+=kspell
    \ cursorline cursorcolumn

  " S-K to pull up dictionary on markdown
  autocmd FileType markdown setlocal keywordprg=sdcv
  " yaml
  autocmd BufRead,BufNewFile *.yaml set cursorline cursorcolumn
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
  autocmd FileType vim,zsh,sh setlocal foldmethod=marker foldlevel=0
  nnoremap z<space> za " easier toggling
  " Don't open folds for me when searching
  " (might want to be able to toggle this)
  set fdo-=search
" }}}

" Aesthetics {{{

  " This must be defined before activating colorscheme
  augroup my_neomake_signs
      au!
      autocmd ColorScheme *
          \ hi NeomakeErrorSign ctermfg=red ctermbg=black |
          \ hi NeomakeWarningSign ctermfg=yellow
  augroup END

  fun CustomizeDarkColors()
    " Remove background on vertical splits
    " Hide the ~ characters at end of files
    " Customize Folds
    if &background == 'dark'
      hi VertSplit ctermbg=0 guibg=#FAF2DC
      hi NonText cterm=NONE gui=NONE guibg=NONE guifg=#FAF2DC ctermbg=0 ctermfg=0
      hi ColorColumn ctermbg=black
      hi Folded cterm=bold ctermfg=cyan ctermbg=black
      hi FoldColumn cterm=reverse
      hi fmrkr ctermbg=black ctermfg=black
    else
      hi NonText ctermbg=7 ctermfg=7
      hi ColorColumn ctermbg=7
      hi VertSplit ctermbg=7
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
  " Disable tmuxline overwriting so we can configure it ourselves
  let g:airline#extensions#tmuxline#enabled = 0

  " Quickly switch between light and dark
  nnoremap <leader>bgl :set bg=light<cr>
  nnoremap <leader>bgd :set bg=dark<cr>

  " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
  " set guifont=Knack\ Nerd\ Font\ Regular:12
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
  " Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

  " Remove vertical split pipe
  set fillchars=

  " Goyo {{{
    let g:goyo_height = "100%"
    let g:goyo_width = 84
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
  map <leader>nt :NERDTreeToggle<cr>
  map <leader>ntf :NERDTreeFind<cr>
  map <leader>ntc :NERDTreeClose<cr>
  " Stay in sync with current working directory
  let NERDTreeChDirMode=2
  let NERDTreeQuitOnOpen=1
  let NERDTreeMapToggleHidden=1
" }}}

" tbone {{{

  " right
  nnoremap <leader>twl <s-v>:Twrite right<cr>
  vnoremap <leader>twl :Twrite right<cr>

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
  map <leader>gP :NeomakeSh git push<cr>
  map <leader>gp :Gpull --rebase<cr>
  map <leader>ga :NeomakeSh git add %<cr>
  map <leader>gc :Gcommit
" }}}

" dein mappings & config {{{
  nnoremap <leader>du :call dein#update()<cr>
  nnoremap <leader>di :call dein#install()<cr>

  " Try this out temporarily
  let g:dein#enable_notification = 1

" }}}

" Neomake {{{
  " Enable Neomake on save on expected file types
  " autocmd! BufWritePost sh,markdown Neomake
  " Or just enable it everywhere all the time because it's async!
  autocmd! BufEnter,BufRead,BufWritePost * Neomake

  let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
  let g:neomake_error_sign = {'text': '•', 'texthl': 'NeomakeErrorSign'}
" }}}

" Clipboard {{{
  " Put default register into system clipboard
  nnoremap <leader>yc :let @+=@"<cr>
  " Put system clipboard into default register
  nnoremap <leader>cy :let @"=@+<cr>
" }}}

" deoplete {{{
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" }}}

" fzf {{{
  " ctrl-p replacement
  nmap <leader>p :Files<cr>
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
      \'deftrace', 'defproject', 'deftest']
    let g:clojure_maxlines = 80
    " cljx syntax highlighting
    autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
    " vim-fireplace / clojure
    autocmd FileType clojure nmap <buffer> cpP :Eval<cr>
    autocmd FileType clojure nmap <buffer> <leader>l :Last<cr>
    autocmd FileType clojure nmap <buffer> ctt :Require<cr>:Eval (run-tests)<cr>
    " Clojure macros
    autocmd FileType clojure let @i='ysabbais'
    " Clojure should have a very large foldlevel
    autocmd FileType clojure set foldlevel=64
    " ClojureScript
    nmap <leader><leader>pg :Piggieback (figwheel-sidecar.repl-api/repl-env)<cr>
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
    let g:ackprg = 'ag --vimgrep'
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
