local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- autocompletion
	use("windwp/nvim-autopairs")
	
	-- lualine
	use("nvim-lualine/lualine.nvim")
	use("nvim-tree/nvim-web-devicons")

	-- tree
	use("nvim-tree/nvim-tree.lua")

	-- treesitter configuration
	use({
	  "nvim-treesitter/nvim-treesitter",
	  run = function()
	    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
	    ts_update()
	  end,
	})

	-- rainbow delimiter
	-- use("HiPhish/nvim-ts-rainbow2")

	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- colorscheme
	use("olimorris/onedarkpro.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)