return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                -- Use :Mason to install language servers manually.
                ensure_installed = {},
                automatic_enable = true,
            })
        end,
    },
}
