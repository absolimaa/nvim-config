return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    require("mason-null-ls").setup({
      ensure_installed = {
        "checkmake",
        "prettier",
        "eslint_d",
        "shfmt",
        "stylua",
      },
      automatic_installation = true,
    })

    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown" }
      }),
      formatting.stylua,
      formatting.shfmt.with({ args = { "-i", "4" } }),
      formatting.terraform_fmt,
      require("none-ls.formatting.ruff").with({
        extra_args = {
          "--extend-select", "I",
          "--ignore", "E501,E251,E231,E303",
        },
      }),
      require("none-ls.formatting.ruff_format"),
    }

    null_ls.setup({
      sources = sources,
      -- Format-on-save disabled
      -- Add manual format keybinding instead
      on_attach = function(client, bufnr)
        -- Optional: set up a keybinding to format manually
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>fmt", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = bufnr, desc = "Format buffer" })
        end
      end,
    })
  end,
}
