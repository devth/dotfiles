"      _            _   _                  _
"     | |          | | | |                (_)
"   __| | _____   _| |_| |__    _ ____   ___ _ __ ___  _ __ ___
"  / _` |/ _ \ \ / / __| '_ \  | '_ \ \ / / | '_ ` _ \| '__/ __|
" | (_| |  __/\ V /| |_| | | | | | | \ V /| | | | | | | | | (__
"  \__,_|\___| \_/  \__|_| |_| |_| |_|\_/ |_|_| |_| |_|_|  \___|
"
" Author: Trevor Hartman
" Part of the pristine dotfile zen garden of @devth
" https://github.com/devth/dotfiles

" Setup dein {{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif
  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')

  " Plugins to Use
  "
  " tpope
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-fireplace')
  call dein#add('tpope/vim-fugitive')
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

  " Clojure
  call dein#add('clojure-vim/async-clj-omni') " clj completion for deoplete

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

  " Superfast fuzzy file finder
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })


  " Powerline alternatives
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Completion
  call dein#add('Shougo/deoplete.nvim')


  " End dein
  call dein#end()
  call dein#save_state()
" }}}

" Vim system settings {{{
  " set foldmethod=marker
  set nowrap
  set nocompatible
  filetype on
  syntax enable
  set shell=/bin/zsh
  let mapleader = ","
  let maplocalleader = ","
  set history=1000
  set undolevels=1000
  set wildmenu
  set wildmode=list:longest
  set visualbell
  set shortmess=I " hide the startup message
  set ic " case insensitive search
  set gdefault
  set incsearch
  set showmatch
  set hlsearch
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
  set complete=.,w,b,u,t,i,],kspell
  " special characters
  set list
  " whitespace characters
  set listchars=tab:>-,trail:-
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

  " Open the location list
  nnoremap <leader>l :lopen<cr>

  " Remove last character in line
  function! RmLastChar()
    :s/.$/
  endfunction
  nnoremap <leader>ax :call RmLastChar()<cr>
  vnoremap <leader>ax :call RmLastChar()<cr>
" }}}

" Vim system autocmds {{{
  " turn on spelling for markdown files
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  autocmd BufRead,BufNewFile *.md set cursorline cursorcolumn
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
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines '
  endfunction " }}}

  set foldtext=MyFoldText()
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0
  nnoremap z<space> za " easier toggling
" }}}

" Colors / aesthetics {{{

  " This must be defined before activating colorscheme
  augroup my_neomake_signs
      au!
      autocmd ColorScheme *
          \ hi NeomakeErrorSign ctermfg=red ctermbg=black |
          \ hi NeomakeWarningSign ctermfg=yellow
  augroup END

  colorscheme solarized
  set colorcolumn=80
  hi ColorColumn ctermbg=black
  set guioptions=egmt
  set bg=dark
  let g:airline_powerline_fonts = 1
  " Disable tmuxline overwriting so we can configure it ourselves
  let g:airline#extensions#tmuxline#enabled = 0

  " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
  " set guifont=Knack\ Nerd\ Font\ Regular:12
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
  " Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

  " Remove vertical split pipe
  set fillchars=
  " and the background
  hi VertSplit ctermbg=0 guibg=#FAF2DC

  " NonText is used for chars like the ~ in blank lines
  hi NonText cterm=NONE gui=NONE guibg=NONE guifg=#FAF2DC ctermbg=0 ctermfg=0

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
  let g:neomake_error_sign = {'text': '🚨', 'texthl': 'NeomakeErrorSign'}
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
  nmap <leader>p :Files<cr>
" }}}

" vim-tmux-navigator {{{
  " Disable tmux navigator when zooming the Vim pane
  let g:tmux_navigator_disable_when_zoomed = 1
" }}}

" TagBar {{{
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
