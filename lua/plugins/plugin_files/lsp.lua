return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "lua_ls", "clangd", "basedpyright", "stylua" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "stevearc/conform.nvim",
  },
  config = function()
    -- Configure diagnostics to show inline messages
    vim.diagnostic.config({
      virtual_text = {
        source = "if_many",
        spacing = 2,
      },
    })

    -- Setup mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd", "basedpyright" },
    })

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
