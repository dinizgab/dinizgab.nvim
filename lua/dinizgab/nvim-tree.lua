local nvim_tree = require("nvim-tree")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n","<leader>e", api.tree.toggle)
end


nvim_tree.setup({
    on_attach = on_attach,
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
})
