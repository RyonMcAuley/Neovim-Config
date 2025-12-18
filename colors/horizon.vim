" " horizon.vim
"
" " Base 30 colors
" let g:horizon_white = "#D5D8DA"
" let g:horizon_black = "NONE"
" let g:horizon_darker_black = "NONE"
" let g:horizon_black2 = "#282b36"
" let g:horizon_one_bg = "#2f3340"
" let g:horizon_one_bg2 = "#393d4d"
" let g:horizon_one_bg3 = "#43485b"
" let g:horizon_grey = "#4f546b"
" let g:horizon_grey_fg = "#5b607b"
" let g:horizon_grey_fg2 = "#676c8b"
" let g:horizon_light_grey = "#757b99"
" let g:horizon_red = "#E95678"
" let g:horizon_baby_pink = "#ff007c"
" let g:horizon_pink = "#F43E5C"
" let g:horizon_line = "#3b3c41"
" let g:horizon_green = "#27D796"
" let g:horizon_vibrant_green = "#21BFC2"
" let g:horizon_nord_blue = "#75BEFF"
" let g:horizon_blue = "#25B2BC"
" let g:horizon_yellow = "#FAC29A"
" let g:horizon_sun = "#FAB795"
" let g:horizon_purple = "#B877DB"
" let g:horizon_dark_purple = "#B180D7"
" let g:horizon_teal = "#21BFC2"
" let g:horizon_orange = "#F09383"
" let g:horizon_cyan = "#25B2BC"
" let g:horizon_statusline_bg = "NONE"
" let g:horizon_lightbg = "#2d323d"
" let g:horizon_pmenu_bg = "#FAB795"
" let g:horizon_folder_bg = "NONE"
"
" " Base 16 colors
" let g:horizon_base00 = "NONE"
" let g:horizon_base01 = "#4B4C53"
" let g:horizon_base02 = "#3a324a"
" let g:horizon_base03 = "#4B4C53"
" let g:horizon_base04 = "#8B8D8F"
" let g:horizon_base05 = "#D5D8DA"
" let g:horizon_base06 = "#c8ccd4"
" let g:horizon_base07 = "#6C6F93"
" let g:horizon_base08 = "#E95678"
" let g:horizon_base09 = "#FAB795"
" let g:horizon_base0A = "#FABD2F"
" let g:horizon_base0B = "#21BFC2"
" let g:horizon_base0C = "#B877DB"
" let g:horizon_base0D = "#59C2FF"
" let g:horizon_base0E = "#B877DB"
" let g:horizon_base0F = "#F09383"
"
" " Set background
" set background=dark
"
" " Highlight groups (syntax and treesitter)
" highlight Normal guifg=g:horizon_base05 guibg=g:horizon_base00
" highlight Comment guifg=g:horizon_grey gui=italic
" highlight Constant guifg=g:horizon_orange
" highlight Identifier guifg=g:horizon_blue
" highlight Statement guifg=g:horizon_red
" highlight Type guifg=g:horizon_purple
" highlight Special guifg=g:horizon_yellow
" highlight Line guifg=g:horizon_line
"
" " Treesitter highlights (this can be expanded)
" highlight link @type.builtin Keyword
" highlight link @tag g:horizon_red
" highlight link @tag.attribute g:horizon_orange
" highlight link @tag.delimiter g:horizon_red
" highlight link @operator.html g:horizon_purple
" highlight link @constant.css g:horizon_yellow
" highlight link @keyword.directive.css Keyword
" highlight link @constant.scss @constant.css
" highlight link @keyword.directive.scss @keyword.directive.css
" highlight link @markup.strong guifg=g:horizon_purple gui=bold
" highlight link @markup.italic guifg=g:horizon_cyan gui=italic
" highlight link @markup.quote guifg=g:horizon_orange
" highlight link @markup.heading guifg=g:horizon_red
" highlight link @markup.heading.1 guifg=g:horizon_red
" highlight link @markup.heading.2 guifg=g:horizon_sun
" highlight link @markup.heading.3 guifg=g:horizon_yellow
" highlight link @markup.heading.4 guifg=g:horizon_orange
" highlight link @markup.heading.5 guifg=g:horizon_cyan
" highlight link @markup.heading.6 guifg=g:horizon_purple
" highlight link @constant Constant
" highlight link @keyword.repeat Keyword
" highlight link @keyword.directive Keyword
" highlight link @keyword.directive.define Keyword
" highlight link @punctuation.bracket guifg=g:horizon_yellow
"
" " Additional semantic token overrides
" highlight link @lsp.type.variable Variable
" highlight link @lsp.mod.readonly Constant
" highlight link @lsp.mod.global Constant
" highlight link @lsp.typemod.variable.globalScope Constant
" highlight link @lsp.typemod.variable.global Constant
" highlight link @lsp.typemod.variable.defaultLibrary Constant
"
" horizon.vim

" Base 30 colors (without `g:` for highlight usage)
let s:horizon_white = "#D5D8DA"
let s:horizon_black = "NONE"
let s:horizon_darker_black = "NONE"
let s:horizon_black2 = "#282b36"
let s:horizon_one_bg = "#2f3340"
let s:horizon_one_bg2 = "#393d4d"
let s:horizon_one_bg3 = "#43485b"
let s:horizon_grey = "#4f546b"
let s:horizon_grey_fg = "#5b607b"
let s:horizon_grey_fg2 = "#676c8b"
let s:horizon_light_grey = "#757b99"
let s:horizon_red = "#E95678"
let s:horizon_baby_pink = "#ff007c"
let s:horizon_pink = "#F43E5C"
let s:horizon_line = "#3b3c41"
let s:horizon_green = "#27D796"
let s:horizon_vibrant_green = "#21BFC2"
let s:horizon_nord_blue = "#75BEFF"
let s:horizon_blue = "#25B2BC"
let s:horizon_yellow = "#FAC29A"
let s:horizon_sun = "#FAB795"
let s:horizon_purple = "#B877DB"
let s:horizon_dark_purple = "#B180D7"
let s:horizon_teal = "#21BFC2"
let s:horizon_orange = "#F09383"
let s:horizon_cyan = "#25B2BC"
let s:horizon_statusline_bg = "NONE"
let s:horizon_lightbg = "#2d323d"
let s:horizon_pmenu_bg = "#FAB795"
let s:horizon_folder_bg = "NONE"

" Base 16 colors
let s:horizon_base00 = "NONE"
let s:horizon_base01 = "#4B4C53"
let s:horizon_base02 = "#3a324a"
let s:horizon_base03 = "#4B4C53"
let s:horizon_base04 = "#8B8D8F"
let s:horizon_base05 = "#D5D8DA"
let s:horizon_base06 = "#c8ccd4"
let s:horizon_base07 = "#6C6F93"
let s:horizon_base08 = "#E95678"
let s:horizon_base09 = "#FAB795"
let s:horizon_base0A = "#FABD2F"
let s:horizon_base0B = "#21BFC2"
let s:horizon_base0C = "#B877DB"
let s:horizon_base0D = "#59C2FF"
let s:horizon_base0E = "#B877DB"
let s:horizon_base0F = "#F09383"

" Set background
set background=dark

" Highlight groups (syntax and treesitter)
highlight Normal guifg=s:horizon_base05 guibg=s:horizon_base00
highlight Comment guifg=s:horizon_grey gui=italic
highlight Constant guifg=s:horizon_orange
highlight Identifier guifg=s:horizon_blue
highlight Statement guifg=s:horizon_red
highlight Type guifg=s:horizon_purple
highlight Special guifg=s:horizon_yellow
highlight Line guifg=s:horizon_line

" Treesitter highlights (this can be expanded)
highlight link @type.builtin Keyword
highlight link @tag guifg=s:horizon_red
highlight link @tag.attribute guifg=s:horizon_orange
highlight link @tag.delimiter guifg=s:horizon_red
highlight link @operator.html guifg=s:horizon_purple
highlight link @constant.css guifg=s:horizon_yellow
highlight link @keyword.directive.css Keyword
highlight link @constant.scss @constant.css
highlight link @keyword.directive.scss @keyword.directive.css
highlight link @markup.strong guifg=s:horizon_purple gui=bold
highlight link @markup.italic guifg=s:horizon_cyan gui=italic
highlight link @markup.quote guifg=s:horizon_orange
highlight link @markup.heading guifg=s:horizon_red
highlight link @markup.heading.1 guifg=s:horizon_red
highlight link @markup.heading.2 guifg=s:horizon_sun
highlight link @markup.heading.3 guifg=s:horizon_yellow
highlight link @markup.heading.4 guifg=s:horizon_orange
highlight link @markup.heading.5 guifg=s:horizon_cyan
highlight link @markup.heading.6 guifg=s:horizon_purple
highlight link @constant Constant
highlight link @keyword.repeat Keyword
highlight link @keyword.directive Keyword
highlight link @keyword.directive.define Keyword
highlight link @punctuation.bracket guifg=s:horizon_yellow

" Additional semantic token overrides
highlight link @lsp.type.variable Variable
highlight link @lsp.mod.readonly Constant
highlight link @lsp.mod.global Constant
highlight link @lsp.typemod.variable.globalScope Constant
highlight link @lsp.typemod.variable.global Constant
highlight link @lsp.typemod.variable.defaultLibrary Constant

