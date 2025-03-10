-- Disable spacebar behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext <CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious <CR>", opts)

-- Adjust split sizes
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", opts)

-- Netrw
vim.keymap.set("n", "<leader>e", ":25Lex<CR>", opts)

-- Remap esc
vim.keymap.set('i', 'jk', '<Esc>', opts)

-- Save file
vim.keymap.set('n', '<C-s>', '<Cmd> w <CR>', opts)

-- Vertical scroll center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', opts)

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<C-k><C-d>', vim.lsp.buf.format, opts)
