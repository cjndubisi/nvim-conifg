call plug#begin()

Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'

" Completion
Plug 'L3MON4D3/LuaSnip' "Code Snippet
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip' " VSCode LSP snipt
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
" Language Server Protocol (LSP)
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'yggdroot/indentline'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } "Syntax Highlighting

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"JS / TS / JSX
Plug 'peitalin/vim-jsx-typescript' " Indent, Highlighting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'jxnblk/vim-mdx-js'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" CSS
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
Plug 'udalov/kotlin-vim'
Plug 'Neevash/awesome-flutter-snippets'

" Degugger
Plug 'puremourning/vimspector' "Debugger
Plug 'vim-test/vim-test'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'

" File Management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/popup.nvim'
Plug 'folke/trouble.nvim'

" Status Line
Plug 'hoob3rt/lualine.nvim' " Status line

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'kassio/neoterm' " terminal replacement
Plug 'sbdchd/neoformat'

if has('nvim')
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' } "Code Reference Finder
  Plug 'folke/lsp-colors.nvim'
  Plug 'onsails/lspkind-nvim'
  Plug 'windwp/nvim-autopairs'
endif

call plug#end()
