-- 1. SET LEADER FIRST (Must be at the very top)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. Load Core Settings and Plugins
require("nvimislovenvimislife.set")
require("nvimislovenvimislife.lazy_init")
require("nvimislovenvimislife.remap")

-- 3. Autogroups
local augroup = vim.api.nvim_create_augroup
local NvimisloveNvimislifeGroup = augroup('NvimIsLOveNvimIsLife', {})
local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd

-- 4. Helper Functions
function R(name)
    require("plenary.reload").reload_module(name)
end

-- 5. Filetype Additions
vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

-- 6. Autocommands
-- Highlight on Yank
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Strip trailing whitespace on save
autocmd({"BufWritePre"}, {
    group = NvimisloveNvimislifeGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- LSP Keybindings (Attached only when an LSP is active)
autocmd('LspAttach', {
    group = NvimisloveNvimislifeGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- 7. Netrw Settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
