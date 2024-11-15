return {

	-- lsp, dap, cmp
	require("plugins.lsp_dap.lsp-config"),
	require("plugins.lsp_dap.null-ls"),
	require("plugins.lsp_dap.cmp"),
	require("plugins.lsp_dap.treesitter"),
	require("plugins.lsp_dap.nvim-dap"),

	-- productivity
	require("plugins.productivity.coderunner"),
	require("plugins.productivity.comment"),
	require("plugins.productivity.lazydev"),
	require("plugins.productivity.toggleterm"),
	require("plugins.productivity.trouble"),
	require("plugins.productivity.vim-tmux"),
	require("plugins.productivity.render-markdown"),
	require("plugins.productivity.live-server"),
	require("plugins.productivity.css-unit-convert"),

	-- motions
	require("plugins.motions.flash"),
	require("plugins.motions.hardtime"),
	require("plugins.motions.auto-pairs"),
	require("plugins.motions.which-key"),
	require("plugins.motions.nvim-surround"),
	require("plugins.motions.text-objects"),
	require("plugins.motions.illuminate"),

	-- themes
	require("plugins.themes.gruvbox"),
	require("plugins.themes.catppuccin"),

	-- cp
	require("plugins.cp.leetcode"),

	-- git
	require("plugins.git.git_signs"),
	require("plugins.git.lazygit"),

	-- ai
	require("plugins.ai.codeium"),
	-- require("plugins.ai.gemini"),

	-- file-navigation
	require("plugins.file_navigation.neo-tree"),
	require("plugins.file_navigation.oil"),
	require("plugins.file_navigation.telescope"),
	require("plugins.file_navigation.zoxide"),
	require("plugins.file_navigation.persistence"),
	require("plugins.file_navigation.harpoon"),

	-- looks
	require("plugins.looks.barbar"),
	require("plugins.looks.dashboard"),
	require("plugins.looks.lualine"),
	require("plugins.looks.colorizer"),
	require("plugins.looks.dressing"),
	require("plugins.looks.indent_blankline"),
	require("plugins.looks.noice"),
	require("plugins.looks.barbeque"),
	require("plugins.looks.scrollbar"),

	-- fun
	require("plugins.fun.cellular"),
	require("plugins.fun.vim-be-good"),
}
