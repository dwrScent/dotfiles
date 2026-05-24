local keymap = vim.keymap.set

-- ctrl + p 文件模糊搜索
-- already replaced by telescope
-- keymap("n", "<C-p>", ":Files .<CR>", { noremap = true, silent = true })

-- Ctrl + f 模糊搜索当前文件内容
keymap("n", "<C-f>", ":BLines<CR>", { noremap = true, silent = true })

-- 触发nvim-tree
keymap("n", "tt", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- switch windows
keymap("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })
keymap("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })


-- toggle terminal
keymap("n", "<leader>t", ":ToggleTerm direction=float dir=. <CR>", { noremap = true, silent = true })
keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- bufferline keymap
keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })  -- 关闭当前 buffer

-- telescope
local builtin = require('telescope.builtin')
keymap('n', '<C-p>', builtin.find_files, { noremap = true, silent = true, desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, {noremap = true, silent = true, desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- lsp shortcuts
local function lsp_supports(method)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
        if client.supports_method(method) then
            return true
        end
    end
    return false
end

local function lsp_request(method, callback)
    return function()
        if lsp_supports(method) then
            callback()
        else
            vim.notify("No LSP server supports " .. method .. " for this buffer", vim.log.levels.WARN)
        end
    end
end

keymap('n', 'gd', lsp_request('textDocument/definition', vim.lsp.buf.definition), {})
keymap('n', 'gD', lsp_request('textDocument/declaration', vim.lsp.buf.declaration), {})
keymap('n', 'gi', lsp_request('textDocument/implementation', vim.lsp.buf.implementation), {})
-- keymap('n', 'K', lsp_request('textDocument/hover', vim.lsp.buf.hover), {})
keymap('n', 'gl', vim.diagnostic.open_float, {})
keymap('n', '[d', vim.diagnostic.goto_prev, {})
keymap('n', ']d', vim.diagnostic.goto_next, {})
-- keymap('n', '<leader>ca', vim.lsp.buf.code_action, {})
keymap('n', '<leader>rn', lsp_request('textDocument/rename', vim.lsp.buf.rename), {})

-- img-clip
keymap('n', '<leader>p', ':PasteImage<CR>', { noremap = true, silent = true, desc = 'Paste image from clipboard' })
