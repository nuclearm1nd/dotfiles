(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :preservim/nerdtree
  :config (fn []
            (nvim.set_keymap :n :<leader>nt ":NERDTreeToggle<CR>" {:noremap true}))}]

