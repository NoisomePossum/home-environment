syntax on

set clipboard=unnamed


"Color and theme settings
set background=dark
"colorscheme solarized
"end Color and theme settings

"General settings
set encoding=utf-8
set guioptions-=T "turns off toolbar
set number
set tabstop=4 "sets tabs already in document to 4 spaces
set shiftwidth=4 "pressing '>' creates a 4-space tab
set expandtab "inserts spaces instead of tabs
"end General settings

"Plugin settings
filetype plugin on
runtime macros/matchit.vim

"Macros and other variable settings
"Expands %% to the file path of current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Sets command line to current file's name plus full path
if has("statusline")
	 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
 endif

"Sets cursor behavior for vim in terminal
let &t_ti .= "\<Esc>[2 q" " Sets cursor shape on opening vim
let &t_SI .= "\<Esc>[6 q" " Sets cursor shape on entering insert mode
let &t_EI .= "\<Esc>[2 q" " Sets cursor shape on exiting insert mode
let &t_te .= "\<Esc>[0 q" " Sets cursor shape on exiting vim
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

"Remappings
noremap <Up> <C-w><C-k>
noremap <Down> <C-w><C-j>
noremap <Left> <C-w><C-h>
noremap <Right> <C-w><C-l>
map Y y$
