-- plugin/lsp.lua

-- 1. mason 主配置
require("mason").setup()

-- 2. mason-lspconfig 只负责安装。Neovim 0.10 没有 vim.lsp.enable(),
--    所以这里不要使用 mason-lspconfig 的 automatic_enable。
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd", "lua_ls" },
    automatic_enable = false,
})

-- 3. 显式启用 LSP server，兼容 Neovim 0.10。
local lspconfig = require("lspconfig")

local servers = {
    pyright = {},
    clangd = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                },
            },
        },
    },
}

for server, config in pairs(servers) do
    if lspconfig[server] then
        lspconfig[server].setup(config)
    end
end

-- 4. 安装 black/flake8/clang-format 等工具
require("mason-tool-installer").setup {
    ensure_installed = {
        "black",
        "flake8",
        "clang-format",
    },
    run_on_start = true, -- 启动时自动安装
}
