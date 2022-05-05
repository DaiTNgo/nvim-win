return {
	cmd = {
		-- Required
		"arduino-language-server",
		"-cli-config",
		"/path/to/arduino-cli.yaml",
		-- Optional
		"-cli",
		"/path/to/arduino-cli",
		"-clangd",
		"/path/to/clangd",
	},
}
