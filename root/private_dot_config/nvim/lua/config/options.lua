-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- I like line wrap. Sue me.
vim.wo.wrap = true

-- Set the full path and status in the winbar
vim.opt.winbar = "%=%m %f"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Save undo history
vim.opt.undofile = true

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

  -- This allows me to use cmd+v to paste stuff into neovide
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

  -- produce particles behind the cursor, if want to disable them, set it to ""
  vim.g.neovide_cursor_vfx_mode = ""
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
  --  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"

  vim.o.guifont = "MesloLGS NF:h20"
end

-- -- Winbar
-- -- function to shorten long paths (> shorten_if_more_than real dirs)
-- local function shorten_path(path)
--   local shorten_if_more_than = 6 -- change this to 5, 7, etc
--   -- Strip and remember the root ("/" or "~/")
--   local prefix = ""
--   if path:sub(1, 2) == "~/" then
--     prefix = "~/"
--     path = path:sub(3)
--   elseif path:sub(1, 1) == "/" then
--     prefix = "/"
--     path = path:sub(2)
--   end
--   -- Split the remaining path into its components
--   local parts = {}
--   for part in string.gmatch(path, "[^/]+") do
--     table.insert(parts, part)
--   end
--   -- Shorten only when there are more than shorten_if_more_than directories
--   if #parts > shorten_if_more_than then
--     local first = parts[1]
--     local last_four = table.concat({
--       parts[#parts - 3],
--       parts[#parts - 2],
--       parts[#parts - 1],
--       parts[#parts],
--     }, "/")
--     return prefix .. first .. "/../" .. last_four
--   end
--
--   -- Re-attach the prefix when no shortening is needed
--   return prefix .. table.concat(parts, "/")
-- end
-- -- Function to get the full path and replace the home directory with ~
-- local function get_winbar_path()
--   local full_path = vim.fn.expand("%:p:h")
--   return full_path:gsub(vim.fn.expand("$HOME"), "~")
-- end
-- -- Function to get the number of open buffers using the :ls command
-- local function get_buffer_count()
--   return vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
-- end
-- -- Function to update the winbar
-- local function update_winbar()
--   local home_replaced = get_winbar_path()
--   local buffer_count = get_buffer_count()
--   local display_path = shorten_path(home_replaced)
--   vim.opt.winbar = "%#WinBar1#%m "
--     .. "%#WinBar2#("
--     .. buffer_count
--     .. ") "
--     -- this shows the filename on the left
--     .. "%#WinBar3#"
--     .. vim.fn.expand("%:t")
--     -- This shows the file path on the right
--     .. "%*%=%#WinBar1#"
--     .. display_path
--   -- I don't need the hostname as I have it in lualine
--   -- .. vim.fn.systemlist("hostname")[1]
-- end
-- -- Winbar was not being updated after I left lazygit
-- vim.api.nvim_create_autocmd({ "BufEnter", "ModeChanged" }, {
--   callback = function(args)
--     local old_mode = args.event == "ModeChanged" and vim.v.event.old_mode or ""
--     local new_mode = args.event == "ModeChanged" and vim.v.event.new_mode or ""
--     -- Only update if ModeChanged is relevant (e.g., leaving LazyGit)
--     if args.event == "ModeChanged" then
--       -- Get buffer filetype
--       local buf_ft = vim.bo.filetype
--       -- Only update when leaving `snacks_terminal` (LazyGit)
--       if buf_ft == "snacks_terminal" or old_mode:match("^t") or new_mode:match("^n") then
--         update_winbar()
--       end
--     else
--       update_winbar()
--     end
--   end,
-- })
