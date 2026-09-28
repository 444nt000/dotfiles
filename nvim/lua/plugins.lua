vim.pack.add({
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-mini/mini.indentscope" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/dawnbeen/c_formatter_42.git" },
	{ src = "https://github.com/42paris/42header.git" },
	{ src = "https://github.com/vyfor/cord.nvim.git" },
})

-- ===============================
-- Discord
-- ===============================

require("cord").setup({
	display = {
		view = "editor",
		theme = "default",
		flavor = "accent",
	},
	editor = {
		client = "neovim",
	},
})

-- ===============================
-- Colorscheme
-- ===============================

vim.cmd("colorscheme github_dark_default")

-- ===============================
-- Lualine
-- ===============================

require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 3 } },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

-- ===============================
-- Indentscope
-- ===============================

require("mini.indentscope").setup({
	draw = {
		delay = 0,
		animation = function()
			return 5
		end,
	},
	symbol = "▏",
	options = { try_as_border = true },
})

-- ===============================
-- Icons
-- ===============================

require("mini.icons").setup()

-- ===============================
-- Toggleterm
-- ===============================

require("toggleterm").setup({
	open_mapping = [[<C-,>]],
	start_in_insert = true,
	insert_mappings = true,
	direction = "float",
	close_on_exit = true,
})

-- ===============================
-- Oil
-- ===============================

require("oil").setup({
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
		natural_order = true,
	},
})

-- ===============================
-- Treesitter
-- ===============================

require("nvim-treesitter").setup({
	auto_install = true,
	highlight = { enable = true },
	match = { enable = true },
	indent = { enable = true },
})

-- ===============================
-- Gitsigns
-- ===============================

require("gitsigns").setup()

-- ===============================
-- Fzf
-- ===============================

require("fzf-lua").setup({
	files = {
		find_opts = [[-type f \! -path '*/.git/*' \! -path '*/.jj/*' \! -path '*/target/*']],
	},
})

-- ===============================
-- Cmp
-- ===============================

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "buffer" },
	}),
})

-- ===============================
-- LSP
-- ===============================

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", "Makefile", ".git" },
})

vim.lsp.enable({
	"lua_ls",
	"clangd",
})

-- ===============================
-- Code Formatting
-- ===============================

require("conform").setup({
	formatters = {
		c_formatter_42 = {
			command = "c_formatter_42",
			stdin = true,
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "c_formatter_42" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})
