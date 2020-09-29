""""""""""""
" Vim-Plug "
""""""""""""

"Install vim-plug if not already present
if empty(glob('~/vim-settings/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Install plugins with vim-plug
call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'arcticicestudio/nord-vim'
Plug 'Raku/vim-raku'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'google/vim-searchindex'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'ruanyl/vim-gh-line'

call plug#end()

"""""""""""""""""""""""""
" General Configuration "
"""""""""""""""""""""""""

set nocompatible
filetype plugin indent on
runtime macros/matchit.vim

syntax on

set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed
set number relativenumber
set ignorecase
set smartcase
set nofoldenable
"Toggle relative line numbering when focus changes to another pane
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
" Exclude tmp files from having undo history files to prevent
" passwords and other info from appearing in plain text
augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

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

""""""""""""""""""""""""
" Colorscheme settings "
""""""""""""""""""""""""

set background=dark
"Activate Nord colorscheme
colorscheme nord

""""""""""""""""""""
" General Bindings "
""""""""""""""""""""

"Makes 'Y' act like 'D', 'C' etc.
map Y y$

"Remappings
"Remap arrow keys to switch between windows
" noremap <Left> <C-w><C-h>
" noremap <Down> <C-w><C-j>
" noremap <Up> <C-w><C-k>
" noremap <Right> <C-w><C-l>
"Allows quick switching between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
if has('nvim')
  tnoremap <C-h> <C-\><C-n><C-w><C-h>
  tnoremap <C-j> <C-\><C-n><C-w><C-j>
  tnoremap <C-k> <C-\><C-n><C-w><C-k>
  tnoremap <C-l> <C-\><C-n><C-w><C-l>
endif
"Allows above motions to switch between windows in tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"Mappings to toggle hidden characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Expands %% to the file path of current buffer (in ex mode)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p').'/' : '%%'

"""""""""""""""""""""""""""""""""""""""""""""
" Plugin-specific bindings / configurations "
"""""""""""""""""""""""""""""""""""""""""""""

" Make raku operators automatically convert to unicode
let g:raku_unicode_abbrevs = 1

" Change Vimwiki bindings
:nmap <Leader>wf <Plug>VimwikiFollowLink
:nmap <Leader>swf <Plug>VimwikiSplitLink
:nmap <Leader>vwf <Plug>VimwikiVSplitLink
:nmap <Leader>wb <Plug>VimwikiGoBackLink
:nmap [K gg<Plug>VimwikiNextLink
:nmap [k <Plug>VimwikiPrevLink
:nmap ]K gg<Plug>VimwikiPrevLink
:nmap ]k <Plug>VimwikiNextLink

"Change Vimwiki syntax to standard markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"This line is necessary to stop vimwiki from
"changing the filetipe of .md files outside of the wiki
let g:vimwiki_global_ext=0

"Activate fuzzy finder 'fzf'
nnoremap <C-p> :<C-u>FZF<CR>

"Toggle NERDTREE"
map <Leader>n :NERDTree<CR>
map <Leader>N :NERDTreeToggle<CR>

"For Javascript files, use `eslint` (and only eslint)
let g:ale_linters = {
\  'javascript': ['eslint'],
\ }
"Ale Mappings in the style of vim-unimpaired
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"""""""""
" Misc. "
"""""""""
