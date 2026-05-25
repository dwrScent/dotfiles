return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "clangd" },
                automatic_enable = true,
            })

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "black",
                    "flake8",
                    "clang-format",
                },
                run_on_start = true,
            })
        end,
    },
}
