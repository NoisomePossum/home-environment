set nocompatible

syntax on
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed
set number relativenumber
set ignorecase
set smartcase
"Toggle relative line numbering when focus changes to another pane
"Toggle relative line numbering when entering/exiting command-line mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * set norelativenumber
augroup END
set guioptions-=T "turns off toolbar
set tabstop=4 "sets tabs already in document to 4 spaces
set shiftwidth=4 "pressing '>' creates a 4-space tab
set autoindent
set smarttab
set expandtab "inserts spaces instead of tabs
set undofile
if !has('nvim')
    set undodir=~/vim-settings/.vim/undo
endif
augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


"Color and theme settings
set background=dark
colorscheme desert
"end Color and theme settings

"Remappings
"Remap arrow keys to switch between windows
" noremap <Left> <C-w><C-h>
" noremap <Down> <C-w><C-j>
" noremap <Up> <C-w><C-k>
" noremap <Right> <C-w><C-l>
"Allows quick switching between windows
nnoremap <M-h> <C-w><C-h>
nnoremap <M-j> <C-w><C-j>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-l> <C-w><C-l>
if has('nvim')
  tnoremap <M-h> <C-\><C-n><C-w><C-h>
  tnoremap <M-j> <C-\><C-n><C-w><C-j>
  tnoremap <M-k> <C-\><C-n><C-w><C-k>
  tnoremap <M-l> <C-\><C-n><C-w><C-l>
endif
"Allows above motions to switch between windows in tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
"Makes 'Y' act like 'D', 'C' etc.
map Y y$
"Activate fuzzy finder 'fzf'
nnoremap <C-p> :<C-u>FZF<CR>
"Toggle NERDTREE"
map <Leader>n :NERDTree<CR>
map <Leader>N :NERDTreeToggle<CR>
"For Javascript files, use `eslint` (and only eslint)
let g:ale_linters = {
\  'javascript': ['eslint'],
\ }
"Mappings in the style of vim-unimpaired
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"Plugin settings
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

"Nvim specific settings
"Allows 'escape' to switch to normal mode while in terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif
"Ensures that programs that open a default editor won't create nested
"instances of nvim
if has('nvim') && executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
