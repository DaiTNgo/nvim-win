local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml", "solidity" },
			extra_args = { "--single-quote", "--jsx-single-quote" },
			-- "--no-semi",
		}),
		formatting.stylua,
		-- diagnostics.tsc,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
			         augroup LspFormatting
			             autocmd! * <buffer>
                   " autocmd BufWritePre <buffer> ed ++ff=dos %
                   autocmd BufWritePre <buffer> set ff=unix
			             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			         augroup END
			         ]])
		end
	end,
})
