" Matugen generated colorscheme
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "matugen"

" UI Colors
highlight Normal guifg={{colors.on_surface.default.hex}} guibg={{colors.surface.default.hex}}
highlight Comment guifg={{colors.on_surface_variant.default.hex}} gui=italic
highlight Constant guifg={{colors.primary.default.hex}}
highlight String guifg={{colors.secondary.default.hex}}
highlight Function guifg={{colors.tertiary.default.hex}}
highlight Keyword guifg={{colors.primary.default.hex}} gui=bold
highlight Type guifg={{colors.tertiary.default.hex}}
" Add more highlight groups as needed
