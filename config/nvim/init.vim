"      _            _   _                  _                    
"     | |          | | | |                (_)                   
"   __| | _____   _| |_| |__    _ ____   ___ _ __ ___  _ __ ___ 
"  / _` |/ _ \ \ / / __| '_ \  | '_ \ \ / / | '_ ` _ \| '__/ __|
" | (_| |  __/\ V /| |_| | | | | | | \ V /| | | | | | | | | (__ 
"  \__,_|\___| \_/  \__|_| |_| |_| |_|\_/ |_|_| |_| |_|_|  \___|
"
" Author: Trevor Hartman
" https://github.com/devth/dotfiles
"

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

  call dein#add('vim-scripts/YankRing.vim')
  call dein#add('vim-scripts/tComment')

  " tpope
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-scriptease')
  call dein#add('tpope/vim-speeddating')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-tbone')
  call dein#add('tpope/vim-unimpaired')

  " git
  call dein#add('tommcdo/vim-fubitive') " bitbucket for fugitive
  call dein#add('shumphrey/fugitive-gitlab.vim') " gitlab for fugitive

  " File exploration / openning
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " tmux integration
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('christoomey/vim-tmux-navigator')

  " Utils
  call dein#add('vim-scripts/regreplop.vim') " replace!

  " Colors
  call dein#add('altercation/vim-colors-solarized')
  " Powerline alternatives
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

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
  nnoremap <leader><space> :nohlsearch<cr>
  nnoremap <tab> %
  vnoremap <tab> %
  " Whitespace
  set tabstop=2
  set smarttab
  set shiftwidth=2
  set autoindent
  set expandtab
  set backspace=start,indent
  set textwidth=80
  set wrapmargin=1
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
" }}}

" Colors {{{
  colorscheme solarized
  set colorcolumn=80
  hi ColorColumn ctermbg=black
  set guioptions=egmt
  set bg=dark

" }}}

" NERDTree {{{
  map <leader>nt :NERDTreeToggle<cr>
  map <leader>ntf :NERDTreeFind<cr>
  map <leader>ntc :NERDTreeClose<cr>
  " Stay in sync with current working directory
  let NERDTreeChDirMode=2
  let NERDTreeQuitOnOpen=1
  " let NERDTreeQuitOnOpen=0
  let NERDTreeQuitOnOpen=0
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


