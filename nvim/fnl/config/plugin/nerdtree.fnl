(module config.plugin.nerdtree
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap  :n :<leader>nt ":NERDTreeToggle<CR>" {:noremap true})

