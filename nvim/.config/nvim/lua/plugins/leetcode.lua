return {
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		cmd = "Leet",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			{
				arg = "leetcode.nvim",

				lang = "cpp",

				storage = {
					home = vim.fn.stdpath("data") .. "/leetcode",
					cache = vim.fn.stdpath("cache") .. "/leetcode",
				},

				plugins = {
					non_standalone = true,
				},

				logging = true,

				injector = {},

				cache = {
					update_interval = 60 * 60 * 24 * 7,
				},

				console = {
					open_on_runcode = true,

					dir = "row",

					size = {
						width = "90%",
						height = "75%",
					},

					result = {
						size = "60%", ---@type lc.size
					},

					testcase = {
						virt_text = true, ---@type boolean

						size = "40%", ---@type lc.size
					},
				},

				description = {
					position = "left", ---@type lc.position

					width = "40%", ---@type lc.size

					show_stats = true, ---@type boolean
				},

				hooks = {
					---@type fun()[]
					["enter"] = {},

					---@type fun(question: lc.ui.Question)[]
					["question_enter"] = {},

					---@type fun()[]
					["leave"] = {},
				},

				keys = {
					toggle = { "q" },
					confirm = { "<CR>" },

					reset_testcases = "r",
					use_testcase = "U",
					focus_testcases = "H",
					focus_result = "L",
				},

				theme = {},

				image_support = false,
			},
		},
	},
}
