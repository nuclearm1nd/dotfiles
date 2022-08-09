(module config.plugin.dap
  {autoload {nvim aniseed.nvim
             dap dap
             dap-vt nvim-dap-virtual-text
             dapui dapui}})

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
  {:highlight_new_as_changed true
   :commented true})

(dapui.setup)

(keymap :n :<localleader>dsl ":lua require('osv').launch()<CR>" {:noremap true})
(keymap :n :<localleader>dl ":lua require('osv').run_this()<CR>" {:noremap true})

(keymap :n :<F5>  ":lua require('dap').continue()<CR>" {:noremap true})
(keymap :n :<F17> ":lua require('dap').terminate()<CR>" {:noremap true})
(keymap :n :<F29> ":lua require('dap').pause()<CR>" {:noremap true})
(keymap :n :<F6>  ":lua require('dap').repl.toggle()<CR>" {:noremap true})
(keymap :n :<F8>  ":lua require('dap').toggle_breakpoint()<CR>" {:noremap true})
(keymap :n :<F20> ":lua require('dap').toggle_breakpoint(vim.fn.input '[Condition] > ')<CR>" {:noremap true})
(keymap :n :<F10> ":lua require('dap').step_over()<CR>" {:noremap true})
(keymap :n :<F22> ":lua require('dap').step_back()<CR>" {:noremap true})
(keymap :n :<F11> ":lua require('dap').step_into()<CR>" {:noremap true})
(keymap :n :<F12> ":lua require('dap').step_out()<CR>" {:noremap true})

(keymap :n :<localleader>du ":lua require('dapui').toggle()<CR>" {:noremap true})

