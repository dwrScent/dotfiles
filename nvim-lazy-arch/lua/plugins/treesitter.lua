return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = function()
            if vim.fn.executable("tree-sitter") == 0 then
                vim.notify("tree-sitter CLI not found; skipping nvim-treesitter parser build", vim.log.levels.WARN)
                return
            end

            require("nvim-treesitter").install({
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "python",
                "cpp",
                "cuda",
            }):wait(300000)
        end,
        config = function()
            require("nvim-treesitter").setup()

            local query_files = vim.treesitter.query.get_files("markdown", "highlights")
            local markdown_query = query_files[1] and table.concat(vim.fn.readfile(query_files[1]), "\n") or nil

            if markdown_query then
                markdown_query = markdown_query:gsub("%s*%(#set!%s+conceal_lines%s+\"\"%)", "")
                vim.treesitter.query.set("markdown", "highlights", markdown_query)
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "c",
                    "cpp",
                    "cuda",
                    "lua",
                    "markdown",
                    "python",
                    "query",
                    "vim",
                    "vimdoc",
                },
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
