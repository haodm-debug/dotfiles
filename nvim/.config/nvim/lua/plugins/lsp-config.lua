return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- setup mason with default properties
            require("mason").setup({
                ui = { border = "rounded"
                }
            })
        end,
    },
    -- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "jdtls", "cssls", "pyright", "docker_compose_language_service", "yamlls" },
            })
        end,
    },
    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end,
    },
    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
            "ray-x/lsp_signature.nvim"
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- get access to the lspconfig plugins functions
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            -- lua
            vim.lsp.config['lua_ls'] = {
                cmd = { "lua-language-server" },
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern(".git", "lua", "init.lua"),
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }
            vim.lsp.enable('lua_ls')

            vim.lsp.config['ts_ls'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['eslint'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['zls'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['yamlls'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['tailwindcss'] = {
                capabilities = capabilities,
            }

            vim.lsp.config['gopls'] = {
                capabilities = capabilities,
            }

            -- nix
            vim.lsp.config['rnix'] = {
                capabilities = capabilities,
            }

            -- protocol buffer
            vim.lsp.config['buf_ls'] = {
                capabilities = capabilities,
            }

            -- docker compose
            vim.lsp.config['docker_compose_language_service'] = {
                capabilities = capabilities,
            }

            -- cobol
            vim.lsp.config['cobol_ls'] = {
                capabilities = capabilities,
            }

            -- svelte
            vim.lsp.config['svelte'] = {
                capabilities = capabilities,
            }
            -- python
            vim.lsp.config['pyright'] = {
                capabilities = capabilities,
            }

            -- bash
            vim.lsp.config['bashls'] = {
                capabilities = capabilities,
            }

            -- protocol buffer (kích hoạt riêng theo filetype)
            vim.lsp.config['buf_language_server'] = {
                capabilities = capabilities,
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "proto",
                callback = function()
                    vim.lsp.enable('buf_language_server')
                end,
            })
            vim.lsp.enable({
                'ts_ls',
                'eslint',
                'zls',
                'yamlls',
                'tailwindcss',
                'gopls',
                'rnix',
                'buf_ls',
                'docker_compose_language_service',
                'cobol_ls',
                'svelte',
                'pyright',
                'bashls'
            })
            
            -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- Set vim motion for <Space> + c + r to display references to the code under the cursor
            vim.keymap.set(
                "n",
                "<leader>cr",
                require("telescope.builtin").lsp_references,
                { desc = "[C]ode Goto [R]eferences" }
            )
            -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
            vim.keymap.set(
                "n",
                "<leader>ci",
                require("telescope.builtin").lsp_implementations,
                { desc = "[C]ode Goto [I]mplementations" }
            )
            -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end,
    },
}
