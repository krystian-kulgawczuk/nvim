-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

local function get_config(name)
  return string.format("require('config/%s')", name)
end

-- stylua: ignore start
require("packer").startup(function(use)
  -- Package manager
  use "wbthomason/packer.nvim"

  -- Git commands in nvim
  use "tpope/vim-fugitive"

  -- Fugitive-companion to interact with github use "tpope/vim-rhubarb"

  -- Add git related info in the signs columns and popups
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = get_config("gitsigns") })

  -- "gc" to comment visual regions/lines
  use({ "numToStr/Comment.nvim", config = get_config("comment") })

  -- Highlight, edit, and navigate code
  use({ "nvim-treesitter/nvim-treesitter", config = get_config("treesitter") })

  -- Additional textobjects for treesitter
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- LSP
  use("famiu/bufdelete.nvim")
  -- Collection of configurations for built-in LSP client
  use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
  -- Automatically install language servers to stdpath
  use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })
  use "williamboman/nvim-lsp-installer"
  -- END LSP

  -- Autocompletion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = get_config("cmp"),
  })

  use({ "rafamadriz/friendly-snippets" })
  use({
    "L3MON4D3/LuaSnip",
    requires = "saadparwaiz1/cmp_luasnip",
    config = get_config("luasnip"),
  })

  -- Theme inspired by Atom
  use "mjlbach/onedark.nvim"

  -- Fancier statusline
  use({ "nvim-lualine/lualine.nvim", config = get_config("lualine") })

  -- Add indentation guides even on blank lines
  use({ "lukas-reineke/indent-blankline.nvim", config = get_config("indent-blankline") })

  -- Detect tabstop and shiftwidth automatically
  use "tpope/vim-sleuth"

  -- Fuzzy Finder (files, lsp, etc)
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }, config = get_config("telescope") })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }

  use({ "windwp/nvim-autopairs", config = get_config("nvim-autopairs") })

  use({ "folke/which-key.nvim", config = get_config("which-key") })

  use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") })

  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, config = get_config("nvim-tree") })

  use({ "glepnir/dashboard-nvim", config = get_config("dashboard") })

  use {
	"folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
	  require("trouble").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  }
	end
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  use { "RRethy/vim-illuminate" }

  use {
    "simrat39/symbols-outline.nvim",
    config = get_config("symbols")
  }

  use { "Djancyp/cheat-sheet" }

  use {
    "numToStr/Navigator.nvim",
    config = get_config("navigator")
  }

  use {
    "romgrk/barbar.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = get_config("barbar")
  }

  use {
    "crusj/structrue-go.nvim",
    branch = "main",
    config = get_config("go-symbols")
  }

  use {
    "ojroques/nvim-lspfuzzy",
    requires = {
      {"junegunn/fzf"},
      {"junegunn/fzf.vim"},  -- to enable preview (optional)
    },
    config = function()
      require("lspfuzzy").setup({})
    end
  }

  use({ "ray-x/go.nvim", requires = "ray-x/guihua.lua", config = get_config("go"), ft = { "go" } })

  use {
    "gfanto/fzf-lsp.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use({ "f-person/git-blame.nvim", config = get_config("git-blame") })

  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = get_config("lightbulb")
  }

  use { "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") }

  use {"akinsho/toggleterm.nvim", tag = '*', config = get_config("toggleterm")}

  if is_bootstrap then
    require("packer").sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn"t
-- make sense to execute the rest of the init.lua.
--
-- You"ll need to restart nvim, and then it will work.
if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end

-- Automatically source and re-compile packer whenever you save this plugins.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerCompile",
  group = packer_group,
  pattern = vim.fn.expand("$MYVIMRC"),
})
