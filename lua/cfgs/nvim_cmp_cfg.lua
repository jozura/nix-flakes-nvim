local M = {}

local function setKeybindings(cmp)
  return {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, { "i", "s", "c", }),
    ["<Space>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          fallback()
        else
          cmp.confirm()
        end
      else
        fallback()
      end
    end, { "i", "s", "c", }),
  }
end

function M.setup()
    local cmp = require 'cmp'

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert(setKeybindings(cmp)),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    -- Set configuration for specific filetype.
    -- cmp.setup.filetype('gitcommit', {
    --   sources = cmp.config.sources({
    --   -- You can specify the `cmp_git` source if you were installed it.
    --     { name = 'cmp_git' },
    --   }, {
    --     { name = 'buffer' },
    --   })
    -- })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

end

return M
