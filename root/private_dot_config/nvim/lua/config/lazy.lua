local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            -- We put this here before even loading core plugins since we want to
            -- ensure that any plugins depending on direnv resources can access them.
            "NotAShelf/direnv.nvim",
            opts = {
                bin = "direnv",
                autoload_direnv = true,
                statusline = {
                    enabled = true,
                    icon = "󱚟 ",
                },
                keybindings = {
                    allow = "<Leader>da",
                    deny = "<Leader>dd",
                    reload = "<Leader>dr",
                    edit = "<Leader>de",
                },
                notifications = {
                    level = vim.log.levels.INFO,
                    silent_autoload = true,
                },
            },
            config = function(_, opts)
                require("direnv").setup(opts)
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DirenvLoaded",
                    callback = function()
                        vim.api.nvim_create_autocmd("DirChanged", {
                            once = true,
                            callback = function()
                                direnv.check_direnv()
                            end,
                        })
                    end,
                })
            end,
        },
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "catppuccin" } },
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    concurrency = (function()
        local handle = io.popen("cat /proc/device-tree/model 2>/dev/null")
        if handle then
            local model = handle:read("*a")
            handle:close()
            if model and model:match("Raspberry Pi") then
                return 8
            end
        end
        return nil -- use lazy.nvim default
    end)(),
    ui = {
        backdrop = 100,
        border = "rounded",
        size = {
            width = 0.8,
            height = 0.8,
        },
    },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = true, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                -- "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
