return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup {
            style = 'darker',
            colors = {
                bg0 = "#181a1f",
                green = "#81cf5a",
            },
        }
        require('onedark').load()
    end
}
