vim.g.mapleader = " "

local keymaps = {
	["<leader><ESC>"] = ":nohl<CR>",
	["<leader>tn"] = ":tabnew<CR>",
	["<leader>tc"] = ":tabclose<CR>",
	["<C-Left>"] = ":vertical resize -5<CR>",
	["<C-Right>"] = ":vertical resize +5<CR>",

	-- 42 Header
	["<leader>h"] = ":Stdheader<CR>",

	-- Oil
	["-"] = ":Oil<CR>",

	-- Zen Mode
	["<leader>z"] = ":ZenMode<CR>",

	-- Fzf
	["<leader>ff"] = ":FzfLua files<CR>",
	["<leader>fb"] = ":FzfLua buffers<CR>",
	["<leader>fg"] = ":FzfLua live_grep<CR>",
	-- Fzf + Lsp
	["<leader>fd"] = ":FzfLua lsp_finder<CR>",
	["<leader>fr"] = ":FzfLua lsp_references<CR>",
	["<leader>ft"] = ":FzfLua lsp_typedefs<CR>",
	["<leader>fs"] = ":FzfLua lsp_document_symbols<CR>",
	["<leader>fw"] = ":FzfLua lsp_workspace_symbols<CR>",
	["<leader>fi"] = ":FzfLua lsp_implementations<CR>",

	-- Lsp
	["gd"] = vim.lsp.buf.definition,
	["gD"] = vim.lsp.buf.declaration,
	["<leader>gS"] = "<cmd>vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>",
	["<leader>D"] = function()
		vim.diagnostic.open_float({ scope = "line" })
	end,
}

for k, v in pairs(keymaps) do
	vim.keymap.set("n", k, v, { noremap = true, silent = true })
end
