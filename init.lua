if vim.g.neovide then
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_cursor_trail_size = 0.8
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_floating_corner_radius = 0.5
end

--
-- Global Editor Variables
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--
-- NeoVim Options
-- :help options
--

-- Tabstop Settings
vim.opt.tabstop = 2 -- width of tab character
vim.opt.softtabstop = 2 -- amount of white space to be added
vim.opt.shiftwidth = 2 -- amount of white space to add in normal mode
vim.opt.expandtab = true -- use spaces instead of tabs

-- Indentation Settings
vim.opt.smartindent = true -- autoindenting when starting a new line
vim.opt.wrap = false -- disable line wrapping

-- Search
vim.opt.incsearch = true -- enable incremental search
vim.opt.ignorecase = true -- ignore case in search pattern
vim.opt.smartcase = true -- case sensitive, if search pattern contains upper case characters
vim.opt.hlsearch = true -- disable highlighting

-- Appearance
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.number = true -- enable line numbers
vim.opt.colorcolumn = "120" -- highlighted line length
vim.opt.signcolumn = "yes" -- draw the signcolumn (default = "auto")
vim.opt.cmdheight = 1 -- number of screen lines to use for the command-line
vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showtabline = 0 -- never show tabline
vim.opt.pumheight = 10 -- limit completion items
vim.opt.cursorline = true -- highlight the current line

-- Behaviour
vim.opt.errorbells = false -- switch off noise in case of errors
vim.opt.swapfile = false -- disable swapfiles for buffers
vim.opt.backup = false -- disable backup file
vim.opt.undofile = true -- enable undo files
vim.opt.undodir = vim.fn.expand("~/.nvim/undo")
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = true -- don't change the working directory automatically
vim.opt.iskeyword:append("-")
vim.opt.mouse:append("a") -- enable mouse support for all modes
vim.opt.clipboard = "unnamedplus"
vim.opt.modifiable = true -- buffers per default modifiable
vim.opt.encoding = "UTF-8"

-- -- Spell Check
-- vim.opt.spelllang = 'en_us'
-- vim.opt.spell = true

--
-- NeoVim Keymappings
--

-- Open file browser netrw
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move highlighted parts
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move down

-- Remaps
vim.keymap.set("i", "<C-c>", "<ESC>")

vim.keymap.set("i", "<C-BS>", "<C-W>")

vim.keymap.set("n", "<C-1>", "<C-w>o")
vim.keymap.set("n", "<C-2>", "<C-w>v")
vim.keymap.set("n", "<M-C-2>", "<C-w>v<C-w><C-w>")
vim.keymap.set("n", "<C-3>", "<C-w>s")

vim.keymap.set("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("v", "<C-.>", "<cmd>CodeActionMenu<CR>")

vim.keymap.set("n", "<M-C-9>", "<cmd>Telescope git_status theme=ivy<CR>")
vim.keymap.set("n", "<C-0>", "<cmd>Telescope projects<CR>")

vim.keymap.set("n", "<C-f>", "/")

vim.keymap.set("n", "<A-j>", "}")
vim.keymap.set("n", "<A-k>", "{")
vim.keymap.set("v", "<A-j>", "}")
vim.keymap.set("v", "<A-k>", "{")

vim.keymap.set("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next({ float = true })<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev({ float = true })<CR>")

vim.keymap.set("n", "<M-NL>", ":cnext<CR>")
vim.keymap.set("n", "<M-C-K>", ":cprev<CR>")

vim.keymap.set("n", "<M-C-O>", "g;")
vim.keymap.set("n", "<M-Tab>", "g,")

vim.keymap.set("n", "<A-S-j>", "<cmd>lua require 'gitsigns'.next_hunk()<cr>")
vim.keymap.set("n", "<A-S-k>", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>")

vim.keymap.set("n", "<A-S-o>", "<cmd>TSToolsOrganizeImports<CR>")
vim.keymap.set("n", "ø", "<cmd>TSToolsOrganizeImports<CR>")
vim.keymap.set("n", "ª", "<cmd>TSToolsFixAll<CR>")
vim.keymap.set("n", "↓", "<cmd>TSToolsRemoveUnused<CR>")
vim.keymap.set("n", "<A-S-i>", "<cmd>TSToolsAddMissingImports<CR>")
vim.keymap.set("n", "<A-S-r>", "<cmd>TSToolsRemoveUnused<CR>")

vim.keymap.set("i", "<C-s>", "<ESC>")
vim.keymap.set("n", "<C-s>", ":wall<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-tab>", ":e#<CR>")

vim.keymap.set("i", "<C-Enter>", "<C-o>O")

vim.keymap.set("n", "<A-u>", "<cmd>noh<cr>")

vim.diagnostic.config({
	virtual_text = false,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
	-- VSCode extension
	require("lazy").setup({
		require("plugins.treesitter"),
		require("plugins.flash"),
		require("plugins.textobjects"),
	})
	return
end

--
-- Windows specific configuration
--

if vim.loop.os_uname().sysname == "Windows" then
	pcall(require, "windows")
end

--
-- GUI specific configuration
--

require("gui")

--
-- Package Manager lazy.vim
-- https://github.com/folke/lazy.nvim
--

require("lazy").setup({
	{ import = "plugins" },
})

-- idealer Weg: Expressions udn Gültigkeiten topologisch sortiert und dann in
-- einem Durchlauf auswerten
--
