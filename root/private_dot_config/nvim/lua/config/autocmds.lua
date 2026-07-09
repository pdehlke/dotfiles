-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ──────────────────Global Color Highlight ───────────────────────

-- === Global highlight overrides (work for ANY theme) ===
do
    local aug = vim.api.nvim_create_augroup("GlobalHighlightsOverrides", { clear = true })

    local function fix(spec)
        spec = vim.tbl_extend("force", {}, spec or {})
        if spec.bg == "" then
            spec.bg = "NONE"
        end
        if spec.fg == "" then
            spec.fg = "NONE"
        end
        return spec
    end

    -- solarized.nvim palette values (see lua/solarized/palette/init.lua in the
    -- plugin), so the barbar/cursor overrides below stay on the colorscheme's
    -- own colors
    local sol = {
        yellow = "#B58900",
        orange = "#CB4B16",
        red = "#DC322F",
        magenta = "#D33682",
        blue = "#268BD2",
        cyan = "#2AA198",
        green = "#859900",
        base01 = "#586E75", -- dim gray, used for inactive UI
        base02 = "#073642", -- highlight background
        mix_base1 = "#2C4E56", -- solarized's own Visual background
    }

    local overrides = {
        -- =================== BLINK-CMP =======================
        BlinkCmpMenu = fix({ bg = "" }),
        BlinkCmpDoc = fix({ bg = "" }),
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        BlinkCmpDocBorder = { link = "FloatBorder" },

        -- =============== NVIM-DAP-VIRTUAL-TEXT ====================
        NvimDapVirtualText = fix({ fg = "#b58900", italic = true }),
        NvimDapVirtualTextError = fix({ fg = "#dc322f", bold = true, underline = true }),
        NvimDapVirtualTextChanged = fix({ fg = "#6c71c4", underline = true }),

        -- =================== BAR-BAR =======================
        -- CURRENT BUFFER
        BufferCurrent = fix({ fg = sol.orange, bg = "" }),
        BufferCurrentIndex = fix({ fg = sol.magenta, bg = "" }),
        -- GIT STATUS - ACTIVE
        BufferCurrentAdded = fix({ fg = sol.green, bg = "" }),
        BufferCurrentDeleted = fix({ fg = sol.red, bg = "" }),
        BufferCurrentChanged = fix({ fg = sol.yellow, bg = "" }),
        -- FILE STATUS - ACTIVE
        BufferCurrentMod = fix({ fg = sol.orange, bg = "" }),
        BufferCurrentWARN = fix({ fg = sol.yellow, bg = "" }),
        BufferCurrentERROR = fix({ fg = sol.red, bg = "" }),
        BufferCurrentHINT = fix({ fg = sol.cyan, bg = "" }),
        BufferCurrentINFO = fix({ fg = sol.blue, bg = "" }),
        BufferCurrentSign = fix({ fg = sol.blue, bg = "" }),
        BufferCurrentSignRight = fix({ fg = sol.blue, bg = "" }),
        -- INACTIVE BUFFERS
        BufferInactive = fix({ fg = sol.base01, bg = "" }),
        BufferInactiveIndex = fix({ fg = sol.blue, bg = "" }),
        -- GIT STATUS - INACTIVE
        BufferInactiveAdded = fix({ fg = sol.green, bg = "" }),
        BufferInactiveDeleted = fix({ fg = sol.red, bg = "" }),
        BufferInactiveChanged = fix({ fg = sol.yellow, bg = "" }),
        -- FILE STATUS - INACTIVE
        BufferInactiveMod = fix({ fg = sol.yellow, bg = "" }),
        BufferInactiveWARN = fix({ fg = sol.yellow, bg = "" }),
        BufferInactiveERROR = fix({ fg = sol.red, bg = "" }),
        BufferInactiveHINT = fix({ fg = sol.cyan, bg = "" }),
        BufferInactiveINFO = fix({ fg = sol.blue, bg = "" }),
        BufferInactiveSign = fix({ fg = sol.blue, bg = "" }),
        BufferInactiveSignRight = fix({ fg = sol.blue, bg = "" }),
        -- ALTERNATE BUFFERS
        BufferAlternate = fix({ fg = sol.orange, bg = "" }),
        -- GIT STATUS - ALTERNATE
        BufferAlternateAdded = fix({ fg = sol.green, bg = "" }),
        BufferAlternateDeleted = fix({ fg = sol.red, bg = "" }),
        BufferAlternateChanged = fix({ fg = sol.yellow, bg = "" }),
        -- FILE STATUS - ALTERNATE
        BufferAlternateMod = fix({ fg = sol.yellow, bg = "" }),
        BufferAlternateWARN = fix({ fg = sol.yellow, bg = "" }),
        BufferAlternateERROR = fix({ fg = sol.red, bg = "" }),
        BufferAlternateHINT = fix({ fg = sol.cyan, bg = "" }),
        BufferAlternateINFO = fix({ fg = sol.blue, bg = "" }),
        BufferAlternateSign = fix({ fg = sol.blue, bg = "" }),
        BufferAlternateSignRight = fix({ fg = sol.blue, bg = "" }),
        -- VISIBLE BUFFERS
        BufferVisible = fix({ fg = sol.blue, bg = "" }),
        -- GIT STATUS - VISIBLE
        BufferVisibleAdded = fix({ fg = sol.green, bg = "" }),
        BufferVisibleDeleted = fix({ fg = sol.red, bg = "" }),
        BufferVisibleChanged = fix({ fg = sol.yellow, bg = "" }),
        -- FILE STATUS - VISIBLE
        BufferVisibleMod = fix({ fg = sol.yellow, bg = "" }),
        BufferVisibleWARN = fix({ fg = sol.yellow, bg = "" }),
        BufferVisibleERROR = fix({ fg = sol.red, bg = "" }),
        BufferVisibleHINT = fix({ fg = sol.cyan, bg = "" }),
        BufferVisibleINFO = fix({ fg = sol.blue, bg = "" }),
        BufferVisibleSign = fix({ fg = sol.blue, bg = "" }),
        BufferVisibleSignRight = fix({ fg = sol.blue, bg = "" }),

        -- ========================= CURSOR ======================
        CursorLine = { bg = sol.base02 },
        Visual = { bg = sol.mix_base1 },

        -- ========================= WIN-SEPARATOR ======================
        WinSeparator = fix({ fg = "", bg = "" }),
        EdgyWinSep = fix({ fg = "#45475a", bg = "" }),

        -- ================ NEO-TREE ============================
        NeoTreeWinSeparator = fix({ fg = "#45475a", bg = "" }),
        NeoTreeTabSeparatorInactive = { fg = "#313244", bg = "#1e1e2e" },
        NeoTreeTabSeparatorActive = { fg = "#45475a", bg = "#1e1e2e" },
        NeoTreeDotfile = fix({ fg = "#A8A8A8", bg = "" }),
        NeoTreeHiddenByName = fix({ fg = "#A8A8A8", bg = "" }),

        -- =================== VS CODE CMP ===================
        CmpItemKindConstructor = { fg = "#f28b25" },
        CmpItemKindUnit = { fg = "#D4D4D4" },
        CmpItemKindProperty = { fg = "#D4D4D4" },
        CmpItemKindKeyword = { fg = "#D4D4D4" },
        CmpItemKindMethod = { fg = "#C586C0" },
        CmpItemKindFunction = { fg = "#C586C0" },
        CmpItemKindColor = { fg = "#C586C0" },
        CmpItemKindText = { fg = "#9CDCFE" },
        CmpItemKindInterface = { fg = "#9CDCFE" },
        CmpItemKindVariable = { fg = "#9CDCFE" },
        CmpItemKindField = { fg = "#9CDCFE" },
        CmpItemKindValue = { fg = "#9CDCFE" },
        CmpItemKindEnum = { fg = "#9CDCFE" },
        CmpItemKindEnumMember = { fg = "#9CDCFE" },
        CmpItemKindStruct = { fg = "#9CDCFE" },
        CmpItemKindReference = { fg = "#9CDCFE" },
        CmpItemKindTypeParameter = { fg = "#9CDCFE" },
        CmpItemKindSnippet = { fg = "#D4D4D4" },
        CmpItemKindClass = { fg = "#f28b25" },
        CmpItemKindModule = { fg = "#D4D4D4" },
        CmpItemKindOperator = { fg = "#D4D4D4" },
        CmpItemKindConstant = { fg = "#D4D4D4" },
        CmpItemKindFile = { fg = "#D4D4D4" },
        CmpItemKindFolder = { fg = "#D4D4D4" },
        CmpItemKindEvent = { fg = "#D4D4D4" },
        CmpItemAbbrMatch = { fg = "#18a2fe", bold = true },
        CmpItemAbbrMatchFuzzy = { fg = "#18a2fe", bold = true },
        CmpItemMenu = { fg = "#777d86" },

        -- VS code tree (Aerial)
        AerialArrayIcon = fix({ fg = "" }),
        AerialClassIcon = { fg = "#f28b25" },
        AerialConstantIcon = { fg = "#D4D4D4" },
        AerialConstructorIcon = { fg = "#f28b25" },
        AerialEnumIcon = { fg = "#9CDCFE" },
        AerialEnumMember = { fg = "#9CDCFE" },
        AerialEventIcon = { fg = "#D4D4D4" },
        AerialFieldIcon = { fg = "#9CDCFE" },
        AerialFileIcon = { fg = "#D4D4D4" },
        AerialFunctionIcon = { fg = "#C586C0" },
        AerialInterfaceIcon = { fg = "#9CDCFE" },
        AerialKeyIcon = { fg = "#D4D4D4" },
        AerialMethodIcon = { fg = "#C586C0" },
        AerialModuleIcon = { fg = "#D4D4D4" },
        AerialNamespaceIcon = { fg = "#D4D4D4" },
        AerialNullIcon = { fg = "#D4D4D4" },
        AerialNumberIcon = { fg = "#D4D4D4" },
        AerialObjectIcon = { fg = "#f28b25" },
        AerialOperatorIcon = { fg = "#D4D4D4" },
        AerialPackageIcon = { fg = "#D4D4D4" },
        AerialPropertyIcon = { fg = "#D4D4D4" },
        AerialStringIcon = { fg = "#9CDCFE" },
        AerialStructIcon = { fg = "#f28b25" },
        AerialTypeParameter = { fg = "#9CDCFE" },
        AerialVariableIcon = { fg = "#9CDCFE" },
        AerialGuide = { fg = "#777d86" },

        -- ============ SPELLING =================
        SpellBad = { sp = "#ffbba6", undercurl = true },
        SpellCap = { sp = "#ffbba6", undercurl = true },
        SpellLocal = { sp = "#ffbba6", undercurl = true },
        SpellRare = { sp = "#ffbba6", undercurl = true },

        -- ============ LSP INLAY HINTS ============
        LspInlayHint = { fg = "#8f939b" },

        -- ============ ALPHA DASHBOARD ============
        MyHeaderHighlight = fix({ fg = "#88C0D0", bg = "" }),
        MyGreetingHighlight = fix({ fg = "#81A1C1", bg = "" }),
        MyButtonsHighlight = fix({ fg = "#D8DEE9", bg = "" }),
        MyAlphaShortcut = { fg = "#A3BE8C", bold = true },
        MyFooterHighlight = fix({ fg = "#EBCB8B", bg = "" }),
        MyQuoteText = { fg = "#8FBCBB", italic = true },
    }

    local function apply_overrides()
        for group, spec in pairs(overrides) do
            vim.api.nvim_set_hl(0, group, spec)
        end
    end

    -- Apply once now
    vim.schedule(apply_overrides)

    -- Re-apply after ANY future :colorscheme
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = aug,
        callback = function()
            -- defer so we run after the theme’s own callbacks
            vim.schedule(apply_overrides)
        end,
        desc = "Apply global highlight overrides after colorscheme",
    })
end

--- ============================================================= ---

-- Copy yanks (but not deletes/changes) to the system clipboard. Pairs with
-- `opt.clipboard = ""` in options.lua, which stops LazyVim's default
-- "unnamedplus" from sending every "d"/"c"/"x" to the macOS pasteboard.
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("yank_to_system_clipboard", { clear = true }),
    callback = function()
        if vim.v.event.operator == "y" then
            vim.fn.setreg("+", vim.v.event.regcontents)
        end
    end,
    desc = "Copy yanked (not deleted) text to the system clipboard",
})

--- ============================================================= ---

-- Disable spell check in markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.spell = false
    end,
})

--- ============================================================= ---

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("gotmpl_highlight", { clear = true }),
    pattern = "*.tmpl",
    callback = function()
        local filename = vim.fn.expand("%:t")
        local ext = filename:match(".*%.(.-)%.tmpl$")

        -- Add more extension to syntax mappings here if you need to.
        local ext_filetypes = {
            sh = "sh",
            go = "go",
            html = "html",
            md = "markdown",
            toml = "toml",
            yaml = "yaml",
            yml = "yaml",
        }

        if ext and ext_filetypes[ext] then
            -- Set the primary filetype
            vim.bo.filetype = ext_filetypes[ext]

            -- Define embedded Go template syntax
            vim.cmd([[
        syntax include @gotmpl syntax/gotmpl.vim
        syntax region gotmpl start="{{" end="}}" contains=@gotmpl containedin=ALL
        syntax region gotmpl start="{%" end="%}" contains=@gotmpl containedin=ALL
      ]])
        end
    end,
})

-- Run Mason updates after Lazy finishes syncing
vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("AlphaLazyThenMason", { clear = true }),
    pattern = "LazySync",
    callback = function()
        vim.schedule(function()
            vim.cmd("MasonUpdate")
            vim.cmd("MasonUpdateAll")
        end)
    end,
})
