local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set("n", keys, func, { buffer = bufnr })
  end

  bufmap("<leader>r", vim.lsp.buf.rename)
  bufmap("<leader>a", vim.lsp.buf.code_action)

  bufmap("gd", vim.lsp.buf.definition)
  bufmap("gD", vim.lsp.buf.declaration)
  bufmap("gI", vim.lsp.buf.implementation)
  bufmap("<leader>D", vim.lsp.buf.type_definition)

  bufmap("K", vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, {})
end

-- before cmp_nvim_lsp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities())

require("mason").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,

	["lua_ls"] = function()
		require("neodev").setup()
		require("lspconfig").lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			Lua = {
				workspace = { checkThridParty = false },
				telemetry = { enable = false },
			},
		}
	end
})
