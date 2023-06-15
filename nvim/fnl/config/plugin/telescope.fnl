(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             util config.util}})

(def- keymap util.keymap)

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>")
(keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>")
(keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>")
(keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>")
(keymap :n :<leader>fc ":lua require('telescope.builtin').git_commits()<CR>")
(keymap :n :<leader>fx ":lua require('telescope.builtin').git_bcommits()<CR>")

(keymap :n :<leader>fn ":Telescope find_files cwd=~/docs/notes/<CR>")
(keymap :n :<leader>fi ":Telescope live_grep cwd=~/docs/notes/<CR>")

