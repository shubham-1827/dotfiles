return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	config = function()
		vim.g.barbar_auto_setup = true

		-- Initialize Barbar
		require("barbar").setup({
			sidebar_filetypes = {
				["neo-tree"] = true,
			},
		})
	end,
}
