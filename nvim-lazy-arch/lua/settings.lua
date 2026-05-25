-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


vim.cmd("syntax enable")

-- 缩进设置
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- 自动换行和断行
vim.o.wrap = true
vim.o.linebreak = true

-- 启用鼠标
vim.o.mouse = "a"

-- 行号
vim.wo.relativenumber = false
vim.opt.nu = true

-- 剪贴板
vim.o.clipboard = "unnamedplus"

-- 
vim.o.scrolloff = 5

-- transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

