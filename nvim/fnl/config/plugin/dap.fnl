(module config.plugin.dap
  {autoload {nvim aniseed.nvim
             dap dap
             dap-vt nvim-dap-virtual-text}})

(def- keymap nvim.set_keymap)

(let
  [lua-config
     [{:type :nlua
       :request :attach
       :name "Attach to running Neovim instance"
       :host (fn []
               (let [val (vim.fn.input "Host [127.0.0.1]: ")]
                 (if (~= val "") val "127.0.0.1")))
       :port (fn []
               (let [val (tonumber (vim.fn.input "Port: "))]
                 (assert val "Please provide a port number")
                 val))}]
   nlua-adapter
     (fn [callback config]
       (callback {:type :server
                  :host config.host
                  :port config.port}))]
  (set dap.configurations.lua lua-config)
  (set dap.adapters.nlua nlua-adapter))

(dap-vt.setup
  {:enabled true
   :enabled_commands true
   :highlight_changed_variables true
   :highlight_new_as_changed false
   :show_stop_reason true
   :commented true
   :only_first_definition true
   :all_references false
   :filter_references_pattern "<module"
   :virt_text_pos :eol
   :all_frames false
   :virt_lines false
   :virt_text_win_col nil})

(keymap :n :<localleader>dsl ":lua require('osv').launch()<CR>" {:noremap true})
(keymap :n :<localleader>dl ":lua require('osv').run_this()<CR>" {:noremap true})

(keymap :n :<F5> ":lua require('dap').continue()<CR>" {:noremap true})
(keymap :n :<F8> ":lua require('dap').toggle_breakpoint()<CR>" {:noremap true})
(keymap :n :<F9> ":lua require('dap').repl.open()<CR>" {:noremap true})
(keymap :n :<F10> ":lua require('dap').step_over()<CR>" {:noremap true})
(keymap :n :<F11> ":lua require('dap').step_into()<CR>" {:noremap true})

