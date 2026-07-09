return {
    {
        "folke/noice.nvim",
        init = function()
            -- Noice's markdown keymaps (e.g. K on links) in markdown buffers
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function(event)
                    vim.schedule(function()
                        require("noice.text.markdown").keys(event.buf)
                    end)
                end,
            })
        end,
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                opts = {
                    position = {
                        row = "30%",
                        col = "50%",
                    },
                },
            },
            presets = {
                lsp_doc_border = true,
                inc_rename = true,
            },
            lsp = {
                hover = {
                    enabled = true,
                    silent = false, -- set to true to not show a message if hover is not available
                },
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = true,
                    },
                    opts = {
                        size = {
                            max_height = 25, -- Limit height to n lines
                            max_width = 90, -- Limit width to n columns
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        scrollbar = true, -- Show scrollbar for truncated content
                    },
                },
            },
            routes = {
                -- skip img-clip warning when using cmd+v
                { filter = { event = "notify", find = "Content is not an image" }, opts = { skip = true } },

                -- skip the LSP hover "No information available" notification
                { filter = { event = "notify", find = "No information available" }, opts = { skip = true } },

                -- skip Snacks Picker "No results found" warning (shows when using tiny-code-action with no actions available)
                { filter = { event = "notify", kind = "warn", find = "No results found for" }, opts = { skip = true } },

                { -- Mason / registry / update chatter (info only)
                    filter = {
                        event = "notify",
                        kind = "info",
                        any = {
                            { find = "^Updating registries" },
                            { find = "^Successfully updated %d+ registr%w+%.?" },
                            { find = "^Checking for package updates" },
                            { find = "^No updates available" },
                        },
                    },
                    opts = { skip = true },
                },
            },
        },
    },
}
