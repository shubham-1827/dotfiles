-- return {
-- 	{
--     'MeanderingProgrammer/render-markdown.nvim',
--     opts = {},
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
-- },
-- }

return {
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{
		"godlygeek/tabular",
		ft = { "markdown" },
	},
}
