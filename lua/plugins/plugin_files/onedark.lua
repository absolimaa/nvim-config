return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup {
            style = 'darker',
            colors = {
                bg0 = "#181a1f",
                -- green = "#81cf5a",
                green = "#81e25a",
                purple = "#aa5dfd",
                rich_orange = "#f47344",
                teal = "#35b093",
                var = "#d0404f",
                yellow = "#f4c244",
                macro= "#bd9ffa",
            },
            highlights = {
                MatchParen = { fg = "#80ff00", fmt = "bold" },
                ["@lsp.type.keyword"] = { fg = "$purple" },
                ["@lsp.type.property"] = { fg = "$cyan" },
                ["@lsp.type.macro"] = { fg = "$macro" },
                ["@lsp.type.parameter"] = { fg = "$rich_orange", fmt = 'italic' },
                ["@lsp.type.variable"] = { fg = "$var" },
                ["@lsp.type.enumMember"] = { fg = "$cyan", fmt = 'italic' },
                -- C/C++ --
                ["cDefine"] = { fg = "$purple" },
                ["cInclude"] = { fg = "$purple" },
                -- Python --
                ["@lsp.type.selfParameter.python"] = { fg = "#68d6da" },
                ["@lsp.type.class.python"] = { fg = "$yellow" },
                ["@lsp.type.property.python"] = { fg = "$var" },
            }
        }
        require('onedark').load()
    end
}
