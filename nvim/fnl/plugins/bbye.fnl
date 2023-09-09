(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :moll/vim-bbye
  :lazy false
  :init (fn []
          (nvim.set_keymap :n :<leader>q ":Bd<CR>" {:noremap true}))}]

