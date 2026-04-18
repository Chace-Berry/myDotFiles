return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = true,
        },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = " ",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },
                mappings = {
                    n = {
                        ["q"] = actions.close,
                        ["dd"] = actions.delete_buffer,
                    },
                    i = {
                        ["<c-enter>"] = "to_fuzzy_refine",
                        ["<c-w>"] = actions.delete_buffer,
                    },
                },
            },
            pickers = {},
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                project = {
                    base_dirs = {
                        "~/Documents", -- change this to where you keep your projects
                    },
                    hidden_files = false,
                    theme = "dropdown",
                    order_by = "asc",
                    sync_with_nvim_tree = false,
                },
            },
        })

        -- Load extensions
        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")
        pcall(telescope.load_extension, "file_browser")
        pcall(telescope.load_extension, "project")

        -- Keymaps
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pws", function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
        end)
        vim.keymap.set("n", "<leader>pWs", function()
            builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
        end)
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
}
