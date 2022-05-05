local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local lspconfig = require("lspconfig")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "emmet_ls" then
		local emmet_opts = require("user.lsp.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_opts, opts)
	end

	if server.name == "tsserver" then
		local tsserver_opts = require("user.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end
	if server.name == "html" then
		local html_opts = require("user.lsp.settings.html")
		opts = vim.tbl_deep_extend("force", html_opts, opts)
	end
	if server.name == "cssls" then
		local css_opts = require("user.lsp.settings.cssls")
		opts = vim.tbl_deep_extend("force", css_opts, opts)
	end

	if server.name == "cssmodules_ls" then
		local cssmd_opts = require("user.lsp.settings.cssmd")
		opts = vim.tbl_deep_extend("force", cssmd_opts, opts)
	end

	if server.name == "eslint" then
		local eslint_opts = require("user.lsp.settings.html")
		opts = vim.tbl_deep_extend("force", eslint_opts, opts)
	end

	if server.name == "quick_lint_js" then
		local js_opts = require("user.lsp.settings.quick_lint_js")
		opts = vim.tbl_deep_extend("force", js_opts, opts)
	end

	if server.name == "arduino_language_server" then
		local arduino_opts = require("user.lsp.settings.arduino")
		opts = vim.tbl_deep_extend("force", arduino_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end
