return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					-- Accept the current completion.
					accept = "<C-g>",
					-- Accept the next word.
					accept_word = false,
					-- Accept the next line.
					accept_line = "<C-z>",
					-- Clear the virtual text.
					clear = "<C-v>",
					-- Cycle to the next completion.
					next = "<M-]>",
					-- Cycle to the previous completion.
					prev = "<M-[>",
				},
			},
		})
		require("codeium.virtual_text").set_statusbar_refresh(function()
			require("lualine").refresh()
		end)
	end,
}
