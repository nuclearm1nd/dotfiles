[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed [:bash
                                                    :c
                                                    :clojure
                                                    :cmake
                                                    :css
                                                    :dockerfile
                                                    :fennel
                                                    :git_config
                                                    :git_rebase
                                                    :gitcommit
                                                    :gitignore
                                                    :html
                                                    :java
                                                    :javascript
                                                    :json
                                                    :latex
                                                    :lua
                                                    :markdown
                                                    :query
                                                    :sql
                                                    :vim
                                                    :vimdoc
                                                    :yaml]})))}]

