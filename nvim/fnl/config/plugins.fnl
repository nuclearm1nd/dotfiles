(module config.plugins
  {autoload {nvim aniseed.nvim
             a aniseed.core
             plug config.phelp}})

(plug.use
  ;; Plugin Manager
  :wbthomason/packer.nvim {}

  ;; Neovim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ;; Clojure
  :Olical/conjure {:branch :master
                   :mod :conjure}

  ;; File searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :branch :master
                                  :mod :telescope}

  ;; Parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;; Neovim API docs
  :folke/neodev.nvim {:mod :neodev}

  ;; Lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ;; Snippet engine
  :L3MON4D3/LuaSnip {:tag "v1.*"
                     :run "make install_jsregexp"}

  ;; Autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path
                                :hrsh7th/cmp-cmdline
                                :PaterJason/cmp-conjure
                                :saadparwaiz1/cmp_luasnip]
                     :mod :cmp}

  ;; Theme
  :morhetz/gruvbox {;:mod :gruvbox
                    }
  :nyngwang/nvimgelion {:mod :nvimgelion}

  ;; Startup optimizations
  :lewis6991/impatient.nvim {}

  ;; Better delete buffer
  :moll/vim-bbye {:mod :bbye}

  ;; S-expression tools
  :guns/vim-sexp {:mod :sexp}

  :sindrets/diffview.nvim {:requires [:nvim-lua/popup.nvim]
                           :mod :diffview}

  ;; Trailing whitespaces
  :zakharykaplan/nvim-retrail {:mod :retrail
                               :branch :main}

  :williamboman/mason.nvim {:mod :mason}

  :mfussenegger/nvim-dap {:requires [:jbyuki/one-small-step-for-vimkind
                                     :theHamsta/nvim-dap-virtual-text
                                     :rcarriga/nvim-dap-ui]
                          :mod :dap}

  :tpope/vim-fugitive {:mod :fugitive}

  :preservim/nerdtree {:mod :nerdtree}

  :vim-airline/vim-airline-themes {:requires [:vim-airline/vim-airline]
                                   :mod :airline}
)

