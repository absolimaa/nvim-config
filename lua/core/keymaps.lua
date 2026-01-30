local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Default shell
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-command"
vim.opt.shellquote = "\""
vim.opt.shellxquote = ""

-- Indentation
vim.keymap.set('i', '<C-BS>', '<C-w>', opts)
vim.keymap.set('i', '<S-Tab>', '<C-d>', opts)
vim.keymap.set('n', '<S-Tab>', '<<', opts)
vim.keymap.set('v', '<S-Tab>', '<gv', opts)

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Navigate between window splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Paste buffer override
vim.keymap.set('v', 'p', '"_dP', opts)

-- delete without copying to register
vim.keymap.set('v', 'd', '"_d', opts)
vim.keymap.set('n', 'dd', '"_dd', opts)

-- Buffers
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bp | bd #<CR>', opts) -- close buffer without closing window
vim.keymap.set('n', '<leader>t', '<cmd> enew <CR>', opts) -- new buffer

-- Undo and Redo with Ctrl+Z and Ctrl+Y in insert mode
vim.keymap.set('i', '<C-z>', '<C-o>u', opts)
vim.keymap.set('i', '<C-y>', '<C-o><C-r>', opts)

-- Delete next word with Ctrl+Delete in insert mode
vim.keymap.set('i', '<C-Del>', '<C-o>dw', { noremap = true, silent = true })

-- Git add current buffer/file
vim.keymap.set('n', '<leader>ga', '<cmd>!git add %<CR>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Make Enter key add a new line
vim.keymap.set('n', '<CR>', 'o<Esc>', { desc = 'Add newline below in normal mode' })

-- Zoom in/out in Neovide
if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.75 -- default zoom
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 0.075<CR>")
end
