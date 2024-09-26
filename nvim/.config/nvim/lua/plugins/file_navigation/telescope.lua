return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		-- integration of trouble with telescope
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		-- Set up Telescope
		require("telescope").setup({
			defaults = {
				-- Default configuration for Telescope
				mappings = {
					i = {
						["<c-t>"] = open_with_trouble,
						["<c-a>"] = add_to_trouble,
					},
					n = {
						["<c-t>"] = open_with_trouble,
						["<c-a>"] = add_to_trouble,
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers
			},
			extensions = {

      },
		})
		--extension loading section

		-- Define key mappings for Telescope with descriptions
		local builtin = require("telescope.builtin")

		-- File operations
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fa", function()
			builtin.find_files({ hidden = true, follow = true })
		end, { desc = "Find all files (including hidden and ignored)" })
		vim.keymap.set("n", "<leader>fA", function()
			builtin.find_files({ no_ignore = true, hidden = true })
		end, { desc = "Find files including ignored" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "List recent files" })

		-- Live grep and search
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fW", function()
			builtin.grep_string({ search = vim.fn.input("Grep for > ") })
		end, { desc = "Grep for specific string" })
		vim.keymap.set("n", "<leader>fR", builtin.resume, { desc = "Resume last Telescope search" })
		vim.keymap.set(
			"n",
			"<leader>fz",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Fuzzy find in the current buffer", noremap = true, silent = true }
		)

		-- Buffer management
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
		vim.keymap.set("n", "<leader>bd", function()
			builtin.buffers({ sort_mru = true })
		end, { desc = "List buffers sorted by most recently used" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "List commands" })

		-- Git related
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Show Git commits" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Show Git status" })
		vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Show Git commits for the current buffer" })

		-- Help and documentation
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Show help tags" })
		vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Show man pages" })
		-- vim.keymap.set('n', '<leader>fr', builtin.repl, { desc = "Show REPL documentation" })

		-- others
		vim.keymap.set(
			"n",
			"<leader>fd",
			builtin.lsp_document_symbols,
			{ desc = "Show LSP document symbols", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			builtin.lsp_workspace_symbols,
			{ desc = "Show LSP workspace symbols", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>fk",
			builtin.keymaps,
			{ desc = "Show key mappings", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Show marks", noremap = true, silent = true })
	end,
}
