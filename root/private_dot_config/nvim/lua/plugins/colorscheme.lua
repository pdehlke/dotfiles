return {
    {
        "maxmx03/solarized.nvim",
        lazy = true,
        priority = 1000,
        ---@type solarized.config
        opts = {
            variant = "autumn",
            plugins = {
                lualine = false,
            },
            styles = {
                comments = { italic = true, bold = false },
                types = { bold = true },
                functions = { bold = true },
                parameters = { bold = true },
                strings = { bold = true },
                keywords = { bold = true },
                variables = { bold = true },
                constants = { bold = true },
            },
            transparent = {
                enabled = false,
            },
            on_highlights = function(colors, color)
                ---@type solarized.highlights
                local groups = {
                    SpellBad = { underline = false, strikethrough = false, undercurl = true },
                }
                return groups
            end,
        },
        config = function(_, opts)
            vim.o.termguicolors = true
            vim.o.background = "dark"
            require("solarized").setup(opts)
            vim.cmd.colorscheme("solarized")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        ---@type CatppuccinOptions
        opts = {
            flavour = "mocha",
            integrations = {
                lualine = false,
            },
            styles = {
                comments = { "italic" },
                types = { "bold" },
                functions = { "bold" },
                strings = { "bold" },
                keywords = { "bold" },
                variables = { "bold" },
            },
            transparent_background = false,
            custom_highlights = function(colors)
                return {
                    SpellBad = { style = { "undercurl" } },
                    ["@variable.parameter"] = { style = { "bold" } },
                    ["@constant"] = { style = { "bold" } },
                }
            end,
        },
    },
}
