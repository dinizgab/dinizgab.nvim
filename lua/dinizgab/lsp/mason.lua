local servers = {
    "lua_ls",
    "gopls",
    "sqls",
    --"java_language_server",
    "pylsp",
    "denols",
    "tailwindcss",
}

local settings = {
    ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}


require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
	automatic_installation = true,
})
