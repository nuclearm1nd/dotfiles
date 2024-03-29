(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :guns/vim-sexp
  ;:dependencies [:tpope/vim-sexp-mappings-for-regular-people]
  :lazy true
  :ft [:clojure :scheme :lisp :timl :fennel :janet]
  :init (fn []
          (set nvim.g.sexp_enable_insert_mode_mappings 0)
          (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))}]

