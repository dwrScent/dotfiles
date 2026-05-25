return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "float",
                size = 10,
            })
        end,
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                highlights = {
                    fill = { guibg = "NONE" },
                    background = { guibg = "NONE" },
                    tab = { guibg = "NONE" },
                    tab_selected = { guibg = "NONE" },
                    separator = { guibg = "NONE" },
                    separator_selected = { guibg = "NONE" },
                    separator_visible = { guibg = "NONE" },
                },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "HakonHarnes/img-clip.nvim",
        cmd = "PasteImage",
        config = function()
            require("img_clip").setup({})
        end,
    },
}
