vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)

    local local_use = function(first, second, opts)
      opts = opts or {}

      local plug_path, home
      if second == nil then
        plug_path = first
        home = "adalessa"
      else
        plug_path = second
        home = first
      end

      if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
        opts[1] = "~/plugins/" .. plug_path
      else
        opts[1] = string.format("%s/%s", home, plug_path)
      end

      use(opts)
    end

    use 'wbthomason/packer.nvim'
    use "lewis6991/impatient.nvim"

    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    }

    use {
        'ThePrimeagen/harpoon',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
    }

    use 'tpope/vim-dispatch'

    -- Completition
    use {
        "hrsh7th/nvim-cmp",
        requires = {
             "hrsh7th/cmp-buffer",
             "hrsh7th/cmp-path",
             "hrsh7th/cmp-nvim-lua",
             "hrsh7th/cmp-nvim-lsp",
             "saadparwaiz1/cmp_luasnip",
             "onsails/lspkind-nvim",
            "L3MON4D3/LuaSnip",
        }
    }

    use "windwp/nvim-autopairs"

    use "tjdevries/colorbuddy.nvim"

    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'ray-x/lsp_signature.nvim'
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim'},
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-telescope/telescope-file-browser.nvim' }
        }
    }

    use {
      "ThePrimeagen/git-worktree.nvim",
      config = function()
        require("git-worktree").setup {}
      end,
    }

    use "nvim-telescope/telescope-dap.nvim"
    use "rcarriga/nvim-notify"
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'leoluz/nvim-dap-go',
        requires = {
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap',
            "Pocco81/DAPInstall.nvim",
            'leoluz/nvim-dap-go',
        }
    }

    use 'szw/vim-maximizer'

    use 'vim-test/vim-test'

    -- use 'fatih/vim-go'

    use {
        'noahfrederick/vim-laravel',
        requires = {
            { 'tpope/vim-projectionist' },
            { 'noahfrederick/vim-composer' }
        }
    }

    use 'jwalton512/vim-blade'

    use 'dracula/vim'

    use 'Raimondi/delimitMate'
    use 'tpope/vim-surround'
    use 'tpope/vim-dotenv'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-obsession'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-commentary'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use 'tpope/vim-tbone'

    use {
        'tpope/vim-dadbod',
        requires = {
           'kristijanhusak/vim-dadbod-ui',
        }
    }

    use { 'nicwest/vim-http', opt = true, cmd = {'Http'}}
    use { 'vimwiki/vimwiki', opt = true, cmd = {'VimwikiIndex'}}

    -- Local plugins can be included
    local_use 'telescope-projectionist.nvim'
    local_use 'telescope-laravel.nvim'
end)