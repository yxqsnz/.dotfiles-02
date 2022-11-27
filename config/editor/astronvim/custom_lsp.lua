return {
    skip_setup = { "rust_analyzer" }, -- skip lsp setup because rust-tools will do it itself
    servers = {
        "gdscript",
        "vuels",
    },
    formatting = {
        -- control auto formatting on save
        format_on_save = {
            enabled = true, -- enable or disable format on save globally
            allow_filetypes = { -- enable format on save for specified filetypes only
                -- "go",
            },
            ignore_filetypes = { -- disable format on save for specified filetypes
                -- "python",
            },
        },
        disabled = { -- disable formatting capabilities for the listed language servers
        },
        timeout_ms = 1000, -- default format timeout
        -- filter = function(client) -- fully override the default formatting function
        --   return true
        -- end
    },
    mappings = {
        n = {
            K = { vim.lsp.buf.hover },
        },
        v = {},
    },
    -- add to the global LSP on_attach function
    on_attach = function(client, bufnr)
        if client.server_capabilities.colorProvider then
            -- Attach document colour support
            require("document-color").buf_attach(bufnr)
        end
    end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,
    --

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
        clangd = {
            cmd = {
                "clangd",
                "--all-scopes-completion",
                "--suggest-missing-includes",
                "--background-index",
                "--pch-storage=disk",
                "--cross-file-rename",
                "--log=info",
                "--completion-style=detailed",
                "--enable-config",
                "--clang-tidy",
                "--offset-encoding=utf-16",
                "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
                "--fallback-style=Google",
                "--header-insertion=iwyu",
                "--header-insertion-decorators",
            },
        },

        gdscript = {
            flags = {
                -- debounce_text_changes = 150,
                -- allow_incremental_sync = true,
            },
        },

        yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            settings = {
                yaml = {
                    schemas = {
                        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                    },
                },
            },
        },
    },
}
