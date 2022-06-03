(module config.plugin.iced
  {autoload {nvim aniseed.nvim}})

(set nvim.g.iced_enable_default_key_mappings false)

(nvim.set_keymap :n :<leader>iei "<Plug>(iced_eval)<Plug>(sexp_inner_element)``" {:noremap true})
(nvim.set_keymap :n :<leader>iee "<Plug>(iced_eval)<Plug>(sexp_outer_list)``" {:noremap true})
(nvim.set_keymap :n :<leader>iet "<Plug>(iced_eval_outer_top_list)" {:noremap true})

