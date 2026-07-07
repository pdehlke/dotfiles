-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

-- opt.relativenumber = false -- Relative line numbers
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.wrap = true -- Line wrapping
opt.showbreak = "↪ "

g.python3_host_prog = os.getenv("NVIM_PYTHON_PATH")
g.lazyvim_prettier_needs_config = true

-- LazyVim defaults to "unnamedplus", which syncs every delete/change (not
-- just yanks) to the macOS pasteboard. Turn that off; the TextYankPost
-- autocmd in autocmds.lua re-adds clipboard sync for yanks only.
opt.clipboard = ""
