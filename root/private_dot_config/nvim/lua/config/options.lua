-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
--
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
-- Add any additional options here

-- Winbar variants: path on the right; hostname left / path right; path left /
-- hostname right
-- vim.opt.winbar = "%=%m %f"
-- vim.opt.winbar = "%=" .. vim.fn.systemlist("hostname")[1] .. "            %m %f"
-- vim.opt.winbar = "%m %f%=" .. vim.fn.systemlist("hostname")[1]

-- LazyVim default leader
vim.g.mapleader = " "
-- To use backspace as leader instead:
-- vim.g.mapleader = vim.api.nvim_replace_termcodes("<BS>", false, false, true)

-- Wait up to 1s for a mapping sequence to complete (Neovim's default; LazyVim
-- sets 300ms). This is only the maximum: a full mapping typed faster executes
-- immediately. The which-key popup delay is configured separately in its
-- plugin spec.
vim.opt.timeout = true
vim.opt.timeoutlen = 1000

-- LazyVim defaults to "unnamedplus", which syncs every delete/change (not
-- just yanks) to the macOS pasteboard. Turn that off; the TextYankPost
-- autocmd in autocmds.lua re-adds clipboard sync for yanks only.
vim.opt.clipboard = ""

-- Snacks animations feel laggy
vim.g.snacks_animate = false

-- Indents are 4 spaces and a tab displays as 4 columns (LazyVim defaults
-- to 2)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Line numbers relative to the cursor line, for count-prefixed motions
-- like 5j / 12k
vim.opt.relativenumber = true

-- Soft-wrap lines longer than the window (LazyVim defaults to nowrap)
vim.opt.wrap = true

-- Visual indicator for wrapped lines
vim.opt.showbreak = "↪ "

-- Markdown only: auto-wrap at 80 columns while typing, with a colorcolumn
-- guide to match. textwidth never reflows existing or pasted lines:
-- https://www.reddit.com/r/neovim/comments/1av26kw/i_tried_to_figure_it_out_but_i_give_up_how_do_i/
-- colorcolumn is window-local, so it is cleared whenever the window shows a
-- non-markdown buffer. To apply globally instead, set vim.opt.textwidth = 80
-- and vim.opt.colorcolumn = "80" here.
vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
    callback = function()
        if vim.bo.filetype == "markdown" then
            vim.opt_local.colorcolumn = "80"
            vim.opt_local.textwidth = 80
        else
            vim.opt_local.colorcolumn = ""
        end
    end,
})

-- Change the working directory to the current file's directory (makes
-- neo-tree root there when entering a subdir)
-- vim.opt.autochdir = true

-- 0 shows all symbols in a file (bullet points, codeblock language markers).
-- obsidian.nvim works better with 1 or 2; kitty needs 2 or codeblocks render
-- oddly
vim.opt.conceallevel = 0

-- Auto-update plugins at startup. This must live in options.lua: lazy.nvim
-- loads autocmds.lua after VimEnter, so a VimEnter autocmd defined there
-- never fires.
-- https://github.com/LazyVim/LazyVim/issues/2592#issuecomment-2015093693
-- Update only when updates exist:
-- https://github.com/folke/lazy.nvim/issues/702#issuecomment-1903484213
-- Skipped when Neovim is launched as the terminal's scrollback pager (the
-- scrollback wrapper sets these globals).
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("lazyvim_autoupdate", { clear = true }),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false })
        end
    end,
})
-- if vim.g.scrollback_mode ~= "neobean" and vim.g.simpler_scrollback ~= "deeznuts" then
--     -- vim.notify("auto updating plugins", vim.log.levels.INFO)
--     local function augroup(name)
--         return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
--     end
--     vim.api.nvim_create_autocmd("VimEnter", {
--         group = augroup("autoupdate"),
--         callback = function()
--             if require("lazy.status").has_updates then
--                 require("lazy").update({ show = false })
--             end
--         end,
--     })
-- end

-- LazyVim's sessionoptions (https://www.lazyvim.org/configuration/general)
-- plus `localoptions`, so persistence.nvim restores buffer-local options like
-- markdown spelllang (en/es). See :h 'sessionoptions'.
vim.opt.sessionoptions = {
    "buffers",
    "curdir",
    "tabpages",
    "winsize",
    "help",
    "globals",
    "skiprtp",
    "folds",
    "localoptions",
}

-- Spellcheck language; per-buffer changes (e.g. es, or en,es for markdown)
-- survive restarts via `localoptions` above
vim.opt.spelllang = { "en" }

-- Delay before CursorHold fires; controls how quickly the diagnostics float
-- appears when the cursor rests on a line with an error
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
vim.o.updatetime = 200

-- Symbols used to render otherwise-invisible characters
vim.opt.listchars = {
    nbsp = "␣", -- non-breaking space
    precedes = "←", -- unwrapped line continues off-screen left
    extends = "→", -- unwrapped line continues off-screen right
    tab = "¬ ", -- tab character
    conceal = "※", -- placeholder for concealed text (conceallevel 1)
    trail = "•", -- trailing spaces
}
-- Turn on listchars rendering
vim.opt.list = true

-- Neovide settings. Related config lives outside this file:
-- ~/.config/neovide/config.toml (vsync etc.), and lazygit needs os.edit set
-- in ~/.config/lazygit/config.yml to open files in Neovide.
-- Text renders slightly bolder than in a terminal; no known fix:
-- https://github.com/neovide/neovide/issues/1231
if vim.g.neovide then
    -- Copy/paste mappings from
    -- https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
    vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<D-c>", '"+y') -- Copy
    vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

    -- Cmd+v paste for the remaining modes (operator-pending, insert/command,
    -- terminal)
    vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

    -- GUI font (terminal Neovim uses the terminal's font instead)
    -- vim.o.guifont = "MesloLGM_Nerd_Font:h14"
    vim.o.guifont = "JetBrainsMono Nerd Font:h20"

    -- Only takes effect with vsync off (disabled in neovide/config.toml).
    -- 120 despite a 75Hz monitor; same workaround as
    -- https://github.com/wez/wezterm/issues/6334
    vim.g.neovide_refresh_rate = 120
    -- Cursor travel animation; 0 removes the trail on long jumps
    -- (default 0.150)
    vim.g.neovide_cursor_animation_length = 0
    -- Cursor animation for short one/two-character travels, as when typing
    -- (default 0.04)
    vim.g.neovide_cursor_short_animation_length = 0.15
    -- Window position animation, e.g. :split (default 0.15)
    vim.g.neovide_position_animation_length = 0.20
    -- How far the back of the cursor trails the front; 1.0 jumps immediately
    -- with a maximum trail, lower is smoother but laggier (default 0.7)
    vim.g.neovide_cursor_trail_size = 0

    -- 0 works around the winbar being redrawn repeatedly while scrolling
    -- (default 0.3): https://github.com/neovide/neovide/issues/1550
    vim.g.neovide_scroll_animation_length = 0

    -- Cursor particle effects; "" disables. Options: railgun, torpedo,
    -- pixiedust, sonicboom, ripple, wireframe
    vim.g.neovide_cursor_vfx_mode = ""

    -- Right alt acts as meta so alt keymaps (e.g. alt+t for the terminal)
    -- work on macOS; left alt still types special characters
    -- https://youtu.be/33gQ9p-Zp0I
    vim.g.neovide_input_macos_option_key_is_meta = "only_right"
end

-- Cursor shapes per mode. The Cursor/lCursor/CursorIM highlight groups must
-- be defined by the colorscheme, otherwise the Neovide cursor renders white.
vim.opt.guicursor = {
    "n-v-c-sm:block-Cursor", -- normal/visual/command: block, 'Cursor' highlight
    "i-ci-ve:ver25-lCursor", -- insert modes: vertical bar, 'lCursor' highlight
    "r-cr:hor20-CursorIM", -- replace modes: horizontal bar, 'CursorIM' highlight
}
