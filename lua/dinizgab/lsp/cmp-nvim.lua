require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require("cmp")
local luasnip = require("luasnip")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'path' },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-a>'] = cmp.mapping.abort()
    }
})
