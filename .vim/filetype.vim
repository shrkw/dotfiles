" your own file type detect rules
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.erb         setfiletype ruby
"  au! BufRead,BufNewFile *.xyz          setfiletype drawing
augroup END
