-- if true then
--     return {}
-- end

local function lsp_status()
    if vim.o.columns < 100 then
        return ""
    end
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if not clients or #clients == 0 then
        return ""
    end

    local hide = { copilot = true } -- add more like `['lazydev']=true` if desired
    local seen, names = {}, {}
    for _, c in ipairs(clients) do
        local name = c.name or ""
        local lower = name:lower()
        if not hide[lower] and not seen[lower] then
            names[#names + 1] = name
            seen[lower] = true
        end
    end

    if #names == 0 then
        return ""
    end
    table.sort(names)
    return table.concat(names, ", ")
end

local mutagen = {}

local function mutagen_status()
    local cwd = vim.uv.cwd() or "."
    mutagen[cwd] = mutagen[cwd]
        or {
            updated = 0,
            total = 0,
            enabled = vim.fs.find("mutagen.yml", { path = cwd, upward = true })[1] ~= nil,
            status = {},
        }
    local now = vim.uv.now() -- timestamp in milliseconds
    local refresh = mutagen[cwd].updated + 10000 < now
    if #mutagen[cwd].status > 0 then
        refresh = mutagen[cwd].updated + 1000 < now
    end
    if mutagen[cwd].enabled and refresh then
        ---@type {name:string, status:string, idle:boolean}[]
        local sessions = {}
        local lines = vim.fn.systemlist("mutagen project list")
        local status = {}
        local name = nil
        for _, line in ipairs(lines) do
            local n = line:match("^Name: (.*)")
            if n then
                name = n
            end
            local s = line:match("^Status: (.*)")
            if s then
                table.insert(sessions, {
                    name = name,
                    status = s,
                    idle = s == "Watching for changes",
                })
            end
        end
        for _, session in ipairs(sessions) do
            if not session.idle then
                table.insert(status, session.name .. ": " .. session.status)
            end
        end
        mutagen[cwd].updated = now
        mutagen[cwd].total = #sessions
        mutagen[cwd].status = status
        if #sessions == 0 then
            vim.notify("Mutagen is not running", vim.log.levels.ERROR, { title = "Mutagen" })
        end
    end
    return mutagen[cwd]
end

-- Open Trouble workspace diagnostics on click
local function open_trouble_diag()
    -- Prefer Trouble v3 Lua API if available
    local ok, trouble = pcall(require, "trouble")
    if ok and type(trouble.open) == "function" then
        trouble.open({ mode = "diagnostics", focus = true })
        return
    end

    -- Command fallback (works for v3/v2)
    if vim.fn.exists(":Trouble") == 2 then
        vim.cmd("Trouble diagnostics")
        return
    elseif vim.fn.exists(":TroubleToggle") == 2 then
        vim.cmd("TroubleToggle workspace_diagnostics")
        return
    end

    -- Final fallback if Trouble isn't installed
    local ok_tb, tb = pcall(require, "telescope.builtin")
    if ok_tb then
        tb.diagnostics({})
    else
        vim.diagnostic.setqflist()
        vim.cmd("copen")
    end
end

-- helper: hide components on narrow windows
local function wide(min)
    return function()
        return vim.o.columns >= (min or 100)
    end
end

local function copilot_enabled()
    return vim.b.copilot_enabled == true
end

local function toggle_copilot_for_buf()
    if copilot_enabled() then
        vim.b.copilot_enabled = false
        vim.notify("Copilot (blink) DISABLED for this buffer", vim.log.levels.INFO)
    else
        vim.b.copilot_enabled = true
        vim.notify("Copilot (blink) ENABLED for this buffer", vim.log.levels.INFO)
    end
end

local function copilot_icon()
    return copilot_enabled() and "" or ""
end

return {
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            ---@type table<string, {updated:number, total:number, enabled: boolean, status:string[]}>

            local error_color = { fg = Snacks.util.color("DiagnosticError") }
            local ok_color = { fg = Snacks.util.color("DiagnosticInfo") }
            table.insert(opts.sections.lualine_x, {
                cond = function()
                    return mutagen_status().enabled
                end,
                color = function()
                    return (mutagen_status().total == 0 or mutagen_status().status[1]) and error_color or ok_color
                end,
                function()
                    local s = mutagen_status()
                    local msg = s.total
                    if #s.status > 0 then
                        msg = msg .. " | " .. table.concat(s.status, " | ")
                    end
                    return (s.total == 0 and "󰋘 " or "󰋙 ") .. msg
                end,
            })

            table.insert(opts.sections.lualine_x, {
                "encoding",
            })
            table.insert(opts.sections.lualine_x, {
                "fileformat",
            })
            table.insert(opts.sections.lualine_x, {
                "filetype",
            })
            table.insert(opts.sections.lualine_x, {
                function()
                    return require("direnv").statusline()
                end,
            })
            table.insert(opts.sections.lualine_x, {
                copilot_icon,
                padding = { left = 1, right = 1 },
                color = function()
                    return { fg = copilot_enabled() and "#6CC644" or "#6371A4" }
                end,
                cond = function()
                    return vim.fn.exists(":Copilot") == 2
                end,
                on_click = function()
                    if vim.bo.buftype == "" then
                        toggle_copilot_for_buf()
                    end
                end,
            })
            table.insert(opts.sections.lualine_y, {
                cond = function()
                    return vim.bo.filetype == "go"
                end,
                function()
                    local handle = io.popen("go version | awk '{sub(/^go/, \"\", $3); print $3}'")
                    if handle then
                        local version = handle:read("*a"):gsub("\n", ""):gsub("go ", "")
                        handle:close()
                        return " " .. version
                    end
                    return ""
                end,
            })
            table.insert(opts.sections.lualine_y, {
                cond = function()
                    return vim.bo.filetype == "javascript"
                end,
                function()
                    local handle = io.popen("node -v")
                    if handle then
                        local version = handle:read("*a"):gsub("\n", ""):gsub("Node ", "")
                        handle:close()
                        return " " .. version
                    end
                    return ""
                end,
            })
            table.insert(opts.sections.lualine_y, {
                cond = function()
                    return vim.bo.filetype == "java"
                end,
                function()
                    local handle = io.popen("java -version 2>&1 | awk -F '\"' '/version/ {print $2}'")
                    if handle then
                        local version = handle:read("*a"):gsub("\n", ""):gsub("Java ", "")
                        handle:close()
                        return "☕︎" .. version
                    end
                    return ""
                end,
            })
            table.insert(opts.sections.lualine_y, {
                cond = function()
                    return vim.bo.filetype == "python"
                end,
                function()
                    local handle = io.popen("python --version 2>&1")
                    if handle then
                        local version = handle:read("*a"):gsub("\n", ""):gsub("Python ", "")
                        handle:close()
                        return "🐍 " .. version
                    end
                    return ""
                end,
            })
            table.insert(opts.sections.lualine_y, {
                lsp_status,
                icon = " LSP:",
                cond = function()
                    return vim.o.columns >= 100 and #vim.lsp.get_clients({ bufnr = 0 }) > 0
                end,
                on_click = function()
                    if vim.bo.buftype == "" then
                        vim.cmd("LspInfo")
                    end
                end,
            })
        end,
    },
}
