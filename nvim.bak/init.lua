----------------------HELPERS------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local u = require('utils')

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

----------------------PLUGINS------------------------------
cmd 'packadd paq-nvim'                       -- load the package manager
local paq = require('paq-nvim').paq          -- a convenient alias
paq {'savq/paq-nvim', opt = true}            -- paq-nvim manages itself
paq {'nvim-treesitter/nvim-treesitter'}      -- configures and installs language modules
paq {'neovim/nvim-lspconfig'}                -- configures language servers
paq {'nvim-lua/plenary.nvim'}                -- various functions used by other plugins
paq {'nvim-lua/popup.nvim'}                  -- An implementation of the Popup API from vim in Neovim
paq {'nvim-telescope/telescope.nvim'}        -- Fuzzy finder written for nvim
paq {'numtostr/FTerm.nvim'}                  -- pop-up terminal for nvim
paq {'lukas-reineke/indent-blankline.nvim'}  -- indentation guidelines
paq {'lewis6991/gitsigns.nvim'}              -- Git status indicators in left gutter
paq {'arcticicestudio/nord-vim'}             -- Nord colorscheme
paq {'hrsh7th/nvim-compe'}                   -- auto-completion
paq {'vhyrro/neorg'}                         -- Note organizer and todo list manager

paq {'godlygeek/tabular'}
paq {'elzr/vim-json'}
paq {'plasticboy/vim-markdown'}
paq {'Raku/vim-raku'}
paq {'vim-airline/vim-airline'}
paq {'scrooloose/nerdtree'}
paq {'tpope/vim-commentary'}
paq {'tpope/vim-repeat'}
paq {'tpope/vim-surround'}
paq {'tpope/vim-obsession'}
paq {'tpope/vim-unimpaired'}
paq {'tpope/vim-fugitive'}
paq {'christoomey/vim-tmux-navigator'}
paq {'ruanyl/vim-gh-line'}

----------------------OPTIONS------------------------------
cmd 'colorscheme nord'
opt.clipboard = 'unnamed'
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.tabstop = 2 -- sets tabs already in document to 4 spaces
opt.shiftwidth = 2 -- pressing '>' creates a 4-space tab
opt.smarttab = true
opt.expandtab = true -- inserts spaces instead of tabs
opt.undofile = true

----------------------TREE-SITTER--------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

----------------------LSP----------------------------------
require'lspconfig'.pylsp.setup{}
require'lspconfig'.yamlls.setup{}

----------------------PLUGINS------------------------------
require('gitsigns').setup()

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
    emoji = true;
    neorg = true;
  };
}

require'FTerm'.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})

require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {}, -- Allows for use of icons
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    my_workspace = "~/Dropbox/notes"
                }
            }
        }
    },
}

----------------------MAPPINGS-----------------------------
map('n', '<leader>i', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<leader>i', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

map('n', 'Y', 'y$') -- "Makes 'Y' act like 'D', 'C' etc.
map('n', '<leader>c', ':noh<CR>')
map('n', '<Leader>n', ':NERDTree<CR>') -- "Refresh NERDTREE"
map('n', '<Leader>N', ':NERDTreeToggle<CR>') -- "Toggle NERDTREE"
map('n', '<leader>l', ':set list!<CR>') -- "Mapping to toggle hidden characters

local tele = require 'telescope.builtin'
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- opt.listchars = 'tab:▸\ ,eol:¬'

-- cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p').'/' : '%%' -- "Expands %% to the file path of current buffer (in ex mode)

----------------------COMMANDS-----------------------------
u.create_augroup({
    {'BufLeave,CmdLineEnter,FocusLost,InsertEnter,WinLeave * set nu nornu | redraw'},
    {'BufEnter,CmdlineLeave,FocusGained,InsertLeave,WinEnter * set rnu'},
}, 'numbertoggle')

u.create_augroup({
    {'BufWritePre /tmp/* setlocal noundofile'},
}, 'undoexclude')

cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}' -- briefly highlight yanked text
