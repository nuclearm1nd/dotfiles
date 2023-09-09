(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :init (fn []
          (let [{: keymap} (autoload :config.util)]
            (keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>")
            (keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>")
            (keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>")
            (keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>")
            (keymap :n :<leader>fc ":lua require('telescope.builtin').git_commits()<CR>")
            (keymap :n :<leader>fx ":lua require('telescope.builtin').git_bcommits()<CR>")))
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)]
              (telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]
                                           :vimgrep_arguments ["rg"
                                                               "--color=never"
                                                               "--no-heading"
                                                               "--with-filename"
                                                               "--line-number"
                                                               "--column"
                                                               "--smart-case"
                                                               "--iglob"
                                                               "!.git"
                                                               "--hidden"]}
                                :extensions {:ui-select {1 (themes.get_dropdown {})}}
                                :pickers {:find_files {:find_command ["rg"
                                                                      "--files"
                                                                      "--iglob"
                                                                      "!.git"
                                                                      "--hidden"]}}})
              (telescope.load_extension "ui-select")))}]
