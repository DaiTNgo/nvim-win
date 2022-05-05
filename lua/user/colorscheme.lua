require("lualine").setup({
	options = {
		-- ... your lualine config
		theme = "tokyonight",
		-- ... your lualine config
	},
})
vim.cmd([[colorscheme tokyonight]])
-- night storm day
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "quickfix", "__vista__", "terminal" }
vim.g.tokyonight_style = "night"
vim.g.tokyonight_colors = { hint = "orange", error = "#ec1313" }
vim.o.background = "dark"
-- night storm day

-- vim.cmd([[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme tokyonight
--     set background=dark
-- endtry
-- ]])
