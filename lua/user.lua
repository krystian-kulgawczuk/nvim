-- [[ Sethhing options ]]
-- See `:help vim.o`

local set = vim.opt

-- Tabs
local tab_width = 4
set.tabstop = tab_width
set.softtabstop = tab_width
set.shiftwidth = tab_width

-- Relative  lines
set.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Set cursorline
vim.o.cursorline = true

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Switching panes
--vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
--vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })
--vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
--vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })

-- lf plugin disable <leader>f
vim.g.lf_map_keys = 0

-- fixes nvim-tree left/right switching
vim.opt.splitright = true

-- blinking cursor
set.guicursor = "n-v-c:blinkon100"

-- center cursor
set.scrolloff = 50
