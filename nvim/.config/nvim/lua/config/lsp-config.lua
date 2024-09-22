local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	if client.server_capabilities["documentSymbolProvider"] then
		require("nvim-navic").attach(client, bufnr)
	end
	client.server_capabilities.documentFormattingProvider = false
end

lspconfig.lua_ls.setup({
	on_attach = on_attach,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
})
lspconfig.clangd.setup({
	on_attach = on_attach,
})

require("lspconfig").marksman.setup({
	on_attach = on_attach,
})

-- Define the border style
local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- Configure hover handler
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
})

-- Configure signature help handler
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border,
})

vim.cmd([[
  highlight FloatBorder guifg=#ff0000 guibg=#1e1e1e
]])
