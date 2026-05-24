-- plugin/lsp.lua

-- 1. mason 主配置
require("mason").setup()

-- 2. mason-lspconfig 安装和自动启用 LSP
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd" },
    automatic_enable = true,
})

-- 3. 安装 black/flake8/clang-format 等工具
require("mason-tool-installer").setup {
    ensure_installed = {
        "black",
        "flake8",
        "clang-format",
    },
    run_on_start = true, -- 启动时自动安装
}

