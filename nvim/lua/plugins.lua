local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tanvirtin/monokai.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "nvim-treesitter/nvim-treesitter",
        build = function(_)
          vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "lua", "python", "javascript", "pkl" },
                highlight = {
                    enable = true,
                    disable = {},
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
    {
      "https://github.com/apple/pkl-neovim",
      lazy = true,
      event = {
        "BufReadPre *.pkl",
        "BufReadPre *.pcf",
        "BufReadPre PklProject",
      },
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      build = function()
        vim.cmd("TSInstall! pkl")
      end,
    },
    {
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
})

