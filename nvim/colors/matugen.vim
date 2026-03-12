" Matugen generated colorscheme
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "matugen"

" UI Colors
highlight Normal guifg=#ede0d4 guibg=#18120b
highlight Comment guifg=#d3c4b4 gui=italic
highlight Constant guifg=#f5bc6f
highlight String guifg=#dec2a1
highlight Function guifg=#b9cda0
highlight Keyword guifg=#f5bc6f gui=bold
highlight Type guifg=#b9cda0
" Add more highlight groups as needed
