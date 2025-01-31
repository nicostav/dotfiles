require("plugins")
require("nvim-cmp")
require("autopairs")


--disable netrw at 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

require("lualine").setup()
require("treesitter")

-- colorscheme
vim.cmd("colorscheme onedark_vivid")

-- show line numbers
vim.cmd("set relativenumber")