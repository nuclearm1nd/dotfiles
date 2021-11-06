(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;plugins managed by packer
(use
  ;; Plugin Manager
  :wbthomason/packer.nvim {}

  ;; Neovim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ;; Clojure
  :Olical/conjure {:branch :master :mod :conjure}

  ;; File searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}

  ;; Parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;; Lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ;; Autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :PaterJason/cmp-conjure]
                     :mod :cmp}

  ;; Theme
  :morhetz/gruvbox {:mod :theme}

  ;; Zest
  :tsbohc/zest.nvim {:mod :zest}

  ;;; Startup optimizations
  :lewis6991/impatient.nvim {}
  :nathom/filetype.nvim {:mod :filetype}
)

