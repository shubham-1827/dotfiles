return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},

	config = function()
		-- triggers CursorHold event faster
		vim.opt.updatetime = 200

		require("barbecue").setup({
			create_autocmd = false, -- prevent barbecue from updating itself automatically
      attach_navic = false,
      show_modified = true,
      exclude_filetypes = { "dashboard" },

			theme = {
         normal = { fg = "#ebdbb2", bold = true, bg = "#282828" },
      },
      -- theme = "catppuccin",

		})

		vim.api.nvim_create_autocmd({
			"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
			"BufModifiedSet",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
