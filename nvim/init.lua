local opt = vim.opt
opt.number = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.wrap = true
opt.termguicolors = true
opt.autoread = true
opt.scrolloff = 8

require("hlchunk").setup({
  chunk = {
    enable = true
  },
  indent = {
    enable = true
  },
  line_num = {
    enable = true
  },
  blank = {
    enable = true
  },
})

require('mini.files').setup({
  mappings = {
    go_in_plus = '<CR>';
  }
})

require('mini.icons').setup({})

require('no-neck-pain').setup({})

require('onedark').load()

require('lualine').setup({})

require('nvim-surround').setup({})

require("bufferline").setup{}

local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>m', '<cmd>lua MiniFiles.open()<cr>', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>tt', '<cmd>FloatermToggle<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>FloatermToggle<cr>')
vim.keymap.set('t', '<ESC>', '<cmd>FloatermToggle<cr>')
vim.keymap.set('t', '<C-n>', '<cmd>FloatermNew<cr>')
vim.keymap.set('t', '<C-q>', '<cmd>FloatermKill<cr>')
vim.keymap.set('t', '<C-h>', '<cmd>FloatermPrev<cr>')
vim.keymap.set('t', '<C-l>', '<cmd>FloatermNext<cr>')

vim.keymap.set('n', '<C-h>', '<cmd>bprev<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-q>', '<cmd>bdelete<cr>')
