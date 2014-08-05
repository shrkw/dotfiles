set nocompatible

" display -----------------------------------------------------------
syntax on
set nu
set ruler
set cursorline
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<,eol:$
colorscheme twilight256

set laststatus=2
set cmdheight=2
set showcmd
set title

set scrolloff=10

" search ----------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" edit -----------------------------------------------------------
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
"set clipboard+=unnamed

" tab -----------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
"inoremap <C-Tab> <C-V><Tab>


" backup -----------------------------------------------------------
set backup
set backupdir=~/.vim/vim_backup
set swapfile
set directory=~/.vim/vim_swap


" nmap -----------------------------------------------------------
"nmap bb :ls<CR>:buf


" encoding -----------------------------------------------------------
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

" for tab -----------------------------------------------------------
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

set showtabline=2

" t: tags-and-searches "{{{
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Jump.
" nnoremap [Tag]t  <C-]>
nnoremap <silent><expr> [Tag]t  &filetype == 'help' ?  "\<C-]>" :
      \ ":\<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include\<CR>"
nnoremap <silent><expr> [Tag]p  &filetype == 'help' ?
      \ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
map <silent> <F2>   :tabprevious<CR>
map <silent> <F3>   :tabnext<CR>
"}}}

" for NeoBundle -----------------------------------------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'grep.vim'
NeoBundle 'twilight256.vim'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" for neocomplete -----------------------------------------------------------
let g:neocomplete#enable_at_startup = 1

" for unite.vim -----------------------------------------------------------
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

" for lightline ----------------------------------------------------------
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"🔒":""}',
      \   'modified': '%{&modified?"✏️":""}',
      \ },
      \}

