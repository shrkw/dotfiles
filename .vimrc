filetype off

augroup default
  autocmd!
augroup END

" encoding -----------------------------------------------------------
"set encoding=utf-8
"set fileencodings=utf-8,utf-16,ucs-2,cp932,euc-jp,iso-2022-jp

filetype plugin on
filetype indent on

source ~/.vim.d/.vimrc.basic
source ~/.vim.d/.vimrc.edit
source ~/.vim.d/.vimrc.neobundle
source ~/.vim.d/.vimrc.func_and_keymap

syntax enable
colorscheme twilight256

