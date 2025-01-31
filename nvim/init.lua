local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then

  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',

    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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

require('lazy').setup({
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  { 'echasnovski/mini.nvim' },
  { 'echasnovski/mini.icons' },
  { 'navarasu/onedark.nvim' },
  { 'nvim-lualine/lualine.nvim' },
  { 'kylechui/nvim-surround' },
  { 'akinsho/bufferline.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'voldikss/vim-floaterm' },
  { 'kylechui/nvim-surround' },
  { 'cohama/lexima.vim' },
  { 'preservim/nerdcommenter' },
  { 'tpope/vim-repeat' },
  { 'akinsho/bufferline.nvim' },
  { 'vim-denops/denops.vim' },
  { 
    'Shougo/ddc.vim',
    dependencies = {
      'Shougo/pum.vim',
      'Shougo/ddc-ui-pum',
      'Shougo/ddc-source-around',
      'LumaKernel/ddc-source-file',
      'Shougo/ddc-filter-matcher_head',
      'Shougo/ddc-filter-sorter_rank',
      'Shougo/ddc-filter-converter_remove_overlap',
      'uga-rosa/ddc-source-nvim-lua',
      'Shougo/ddc-source-lsp',
      'neovim/nvim-lspconfig',
      'matsui54/denops-popup-preview.vim',
     },
  },
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'typescript'},
      highlight = { enabale = true },
    }
  }
})

require('hlchunk').setup({
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

require('mini.icons').setup()

require('onedark').load()

require('lualine').setup()

require('nvim-surround').setup()

require('bufferline').setup()

require('nvim-treesitter').setup {}

local capabilities = require("ddc_source_lsp").make_client_capabilities()

local lspconfig = require('lspconfig')

lspconfig.ccls.setup({
  capabilities = capabilities
})

local is_node_dir = function()
  return lspconfig.util.root_pattern('package.json')(vim.fn.getcwd())
end

-- ts_ls
local ts_opts = {
  capabilities = capabilities
}
ts_opts.on_attach = function(client)
  if not is_node_dir() then
    client.stop(true)
  end
end
lspconfig.ts_ls.setup(ts_opts)

-- denols
local deno_opts = {
  capabilities = capabilities
}
deno_opts.on_attach = function(client)
  if is_node_dir() then
    client.stop(true)
  end
end

lspconfig.denols.setup(deno_opts)

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

vim.fn['popup_preview#enable']()

vim.fn['ddc#custom#load_config'](vim.fs.joinpath(vim.fn.stdpath('config'),'ddc', 'ddc.ts'))

vim.fn['ddc#enable']()

vim.keymap.set('i', '<TAB>', 
  function()
    if vim.fn['ddc#visible']() then
      return '<Cmd>call pum#map#insert_relative(1, "loop")<CR>'
    else
      return '<TAB>'
    end
  end
, { noremap = false, expr = true })

vim.keymap.set('i', '<S-TAB>', 
  function()
    if vim.fn['pum#visible']() then
      return '<Cmd>call pum#map#insert_relative(-1, "loop")<CR>'
    else
      return '<S-TAB>'
    end
  end
, { noremap = false, expr = true })


