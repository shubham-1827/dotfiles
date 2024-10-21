return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufWritePre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = "all",
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			-- indent = { enable = true },
			modules = {},
			ignore_install = {},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
