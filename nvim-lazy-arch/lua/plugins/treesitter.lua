return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = function()
            require("nvim-treesitter.install").ensure_installed_sync({
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "python",
                "cpp",
            })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
