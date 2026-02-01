return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
        'c', 'cpp', 'python', 'html', 'css', 'lua',
        'make', 'cmake', 'yaml', 'json', 'markdown',
    },
    auto_install = true,
    highlight = { enable = true, },
    indent = { enable = true, },
  },
}
