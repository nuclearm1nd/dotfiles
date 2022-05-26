(module config.plugin.bbye
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>q ":Bd<CR>" {:noremap true})

