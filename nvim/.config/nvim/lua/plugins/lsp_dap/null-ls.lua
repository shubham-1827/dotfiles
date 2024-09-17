return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format current buffer" })

		-- Auto-format on save
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*",
			callback = function()
				-- Trigger format via null-ls
				local clients = vim.lsp.get_active_clients()
				for _, client in ipairs(clients) do
					if client.name == "null-ls" then
						-- Format the buffer if null-ls is available
						vim.lsp.buf.format({ async = true })
						break
					end
				end
			end,
		})
	end,
}
