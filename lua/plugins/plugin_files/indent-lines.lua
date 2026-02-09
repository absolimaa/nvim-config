return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        scope = {
            show_start = false, -- Removes the underline at the start of scope
            show_end = false, -- Removes the underline at the end of scope (the line below)
            highlight = "IblScopeGray", -- Custom gray highlight
        },
    },
    config = function(_, opts)
        -- Set up the gray highlight group
        vim.api.nvim_set_hl(0, "IblScopeGray", { fg = "#808080" }) -- Gray color
        require("ibl").setup(opts)
    end,
}
