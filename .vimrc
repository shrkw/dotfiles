set nocompatible

" display
" "-----------------------------------------------------------
syntax on
"set shortmess+=I
set list
set nu
set ruler
set listchars=tab:>-,trail:-,extends:>,precedes:<,eol:$
"set display=uhex

set laststatus=2
set cmdheight=2
set showcmd
set title

set scrolloff=5

set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

" search
" "-----------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" edit
" "-----------------------------------------------------------
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM

" tab
" "-----------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
"inoremap <C-Tab> <C-V><Tab>


" backup
" "-----------------------------------------------------------
set backup
set backupdir=~/.vim/vim_backup
set swapfile
set directory=~/.vim/vim_swap


" nmap
" "-----------------------------------------------------------
"nmap bb :ls<CR>:buf
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>


" encoding
" "-----------------------------------------------------------
"set enc=utf-8
"set fencs=iso-2022-jp,euc-jp,cp932
"set ambiwidth=double
set encoding=utf-8
set fileencodings=utf-8,utf-16,ucs-2,cp932,euc-jp,iso-2022-jp

set history=1000

filetype plugin indent on
hi Search term=reverse ctermbg=DarkBlue ctermfg=NONE
autocmd FileType ruby set tabstop=2 tw=0 sw=2 expandtab
autocmd FileType eruby set tabstop=2 tw=0 sw=2 expandtab
autocmd BufNewFile,BufRead app/*/*.rhtml set ft=mason fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.rb set ft=ruby fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.yml set ft=ruby fenc=utf-8
autocmd FileType c hi Comment ctermfg=darkcyan
autocmd FileType cpp hi Comment ctermfg=darkcyan


" underline at current window
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorcolumn nocursorline
  autocmd WinEnter,BufRead * set cursorcolumn cursorline
augroup END

highlight CursorLine ctermbg=black guibg=black
highlight CursorColumn ctermbg=black guibg=black

""""----------------------------------------------------------
" for vundle
" "-----------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" original repos on github
" Bundle 'tpope/vim-fugitive'

" vim-scripts repos
" Bundle 'rails.vim'
Bundle 'neocomplcache'
Bundle 'unite.vim'
Bundle 'surround.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on

" for neocomplete
" "-----------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

" for unite.vim
" "-----------------------------------------------------------
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


