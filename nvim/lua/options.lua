local options = {
	confirm = true, -- prompts for confirmation when closing unsaved changes
	cursorline = true, -- highlights the line where the cursor is located
	fileencoding = "utf-8", -- sets the default file encoding to utf-8
	number = true, -- displays line numbers
	relativenumber = true, -- shows relative line numbers
	scrolloff = 8, -- keeps 8 lines visible above and below the cursor when scrolling
	sidescrolloff = 8, -- keeps 8 columns visible to the left and right of the cursor when scrolling horizontally
	signcolumn = "yes", -- always shows the sign column, preventing text shifting
	smartcase = true, -- enables smart case-sensitive searching
	autoindent = true, -- reproduce the previous line indentation
	smartindent = true, -- automatically inserts indentation in a smart way
	termguicolors = true, -- enables 24-bit rgb color in the terminal
	undofile = true, -- enables persistent undo
	undodir = vim.fn.expand("~/.nvim/undodir"), -- sets the directory for storing undo files
	wrap = false, -- disable line wrapping
	smoothscroll = true, -- enables smooth scrolling
	swapfile = false, -- disables swap file creation
	inccommand = "split", -- open a window during substitution
	virtualedit = "block", -- visually highlight (select) specific text areas
	showcmd = false, -- disables the display of incomplete commands in the command line
	shiftwidth = 2, -- number of spaces used for each indentation
	showtabline = 2, -- always show tab line
	tabstop = 2, -- number of spaces a tab represents
	commentstring = "// %s", -- default comment pattern
	laststatus = 3, -- keeps statusline always at the bottom
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
