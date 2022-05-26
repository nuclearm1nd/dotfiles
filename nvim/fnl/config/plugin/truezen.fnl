(module config.plugin.bbye
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>zm ":TZMinimalist<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>zf ":TZFocus<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>za ":TZAtaraxis<CR>" {:noremap true})

