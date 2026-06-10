-- -- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			styles = {
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine")

		for _, group in ipairs({
			"Normal",
			"NormalNC",
			"NormalFloat",
			"FloatBorder",
			"SignColumn",
			"EndOfBuffer",
		}) do
			vim.cmd(("highlight %s guibg=NONE ctermbg=NONE"):format(group))
		end
	end,
}
-- return {
--     {
--         "shaunsingh/nord.nvim",
--         priority = 1000,
--         config = function()
--             vim.g.nord_contrast = true
--             vim.g.nord_borders = false
--             vim.g.nord_disable_background = true
--             vim.g.nord_italic = false
--             vim.g.nord_uniform_diff_background = true
--             vim.g.nord_bold = false
--
--             require("nord").set()
--
--             local hl = vim.api.nvim_set_hl
--             hl(0, "Normal", { bg = "none" })
--             hl(0, "NormalNC", { bg = "none" })
--             hl(0, "NormalFloat", { bg = "none" })
--             hl(0, "FloatBorder", { bg = "none" })
--             hl(0, "SignColumn", { bg = "none" })
--             hl(0, "@function", { italic = false })
--         end,
--     },
-- }
