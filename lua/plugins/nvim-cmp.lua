return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")      
      
      local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
      end
	
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
	snippet = {
	  expand = function(args)
	    luasnip.lsp_expand(args.body)
	  end,
	},

	mapping = cmp.mapping.preset.insert({
	  ["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
	      cmp.confirm({ select = true })
	    elseif luasnip.expand_or_jumpable() then
	      luasnip.expand_or_jump()
	    elseif check_back_space() then
	      fallback()
	    else
	      fallback()
	    end
	  end, { "i", "s"}
	  ),
	  ["<C-k>"] = cmp.mapping.select_prev_item(),
	  ["<C-j>"] = cmp.mapping.select_next_item(),
	  ["<C-Space>"] = cmp.mapping.complete(),
	  ["<C-e>"] = cmp.mapping.abort(),
	}),
	
	sources = cmp.config.sources({
	  { name = "luasnip" },
	  { name = "buffer" },
	  { name = "path" },
	  { name = "codeium" },
	})
      })

      luasnip.setup({
	keys = function()
	  return {}
	end
      })
    end,
}
