-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable spacebar behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- Remap esc
vim.keymap.set('i', 'jk', '<Esc>', opts)

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Vertical scroll center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Keep last yanked when pasting 
vim.keymap.set('v', 'p', '"_dP', opts)

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
