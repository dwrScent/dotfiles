require("plugins")
require("nvim-tree").setup({
    filters = {
        git_ignored = false,
    },
})

require("settings")

require("keymaps")

-- require("themes")
