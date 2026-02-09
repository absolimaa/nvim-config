return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "clangd", "basedpyright" },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ensure_installed = { "stylua", "black", "clang-format" },
            },
        },
        "neovim/nvim-lspconfig",
        "stevearc/conform.nvim",
    },
    config = function()
        -- Configure diagnostics
        vim.diagnostic.config({
            virtual_text = {
                source = "if_many",
                spacing = 2,
            },
        })

        -- Setup mason-lspconfig
        require("mason-lspconfig").setup()

        -- Setup conform
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                c = { "clang-format" },
                cpp = { "clang-format" },
            },
            format_on_save = function(bufnr)
                if not vim.g.autoformat_enabled then
                    return
                end
                local autoformat_fts = { "lua", "python" }
                local ft = vim.bo[bufnr].filetype
                if vim.tbl_contains(autoformat_fts, ft) then
                    return {
                        timeout_ms = 500,
                        lsp_fallback = false,
                    }
                end
            end,
        })

        vim.g.autoformat_enabled = true

        vim.api.nvim_create_user_command("ToggleAutoformat", function()
            vim.g.autoformat_enabled = not vim.g.autoformat_enabled
            print("Autoformat " .. (vim.g.autoformat_enabled and "enabled" or "disabled"))
        end, {})
    end,
}
