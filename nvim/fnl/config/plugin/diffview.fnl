(module config.plugin.diffview
  {autoload {nvim aniseed.nvim
             diffview diffview
             actions diffview.actions}})

((. diffview :setup)
 {:diff_binaries false
  :enhanced_diff_hl false
  :use_icons false
  ;:icons {:folder_closed "+"
  ;        :folder_open "-"}
  :signs {:fold_closed "+" :fold_open "-"}
  :file_panel {:listing_style :tree
               :tree_options {:flatten_dirs true
                              :folder_statuses :only_folded}
               :win_config {:position :left
                            :width 35}}
  :file_history_panel
    {:log_options
      {:git
        {:single_file
          {:max_count 256
           :follow false
           :all false
           :merges false
           :no_merges false
           :reverse false}
         :multi_file
          {:max-count 128}}}
     :win_config
       {:position :bottom
        :height 16}}
  :commit_log_panel {:win_config {}}
  :default_args {:DiffviewOpen {}
                 :DiffviewFileHistory {}}
  :hooks {}
  :keymaps {:disable_defaults false
            :view {:<tab> actions.select_next_entry
                   :<s-tab> actions.select_prev_entry
                   :gf actions.goto_file
                   :<C-w><C-f> actions.goto_file_split
                   :<C-w>gf actions.goto_file_tab
                   :<leader>e actions.focus_files
                   :<leader>b actions.toggle_files}
            :file_panel {:j actions.next_entry
                         :<down> actions.next_entry
                         :k actions.prev_entry
                         :<up> actions.prev_entry
                         :<cr> actions.select_entry
                         :o actions.select_entry
                         :<2-LeftMouse> actions.select_entry
                         :- actions.toggle_stage_entry
                         :S actions.stage_all
                         :U actions.unstage_all
                         :X actions.restore_entry
                         :R actions.refresh_files
                         :L actions.open_commit_log
                         :<c-b> (actions.scroll_view (- 0.25))
                         :<c-f> (actions.scroll_view 0.25)
                         :<tab> actions.select_next_entry
                         :<s-tab> actions.select_prev_entry
                         :gf actions.goto_file
                         :<C-w><C-f> actions.goto_file_split
                         :<C-w>gf actions.goto_file_tab
                         :i actions.listing_style
                         :f actions.toggle_flatten_dirs
                         :<leader>e actions.focus_files
                         :<leader>b actions.toggle_files}
            :file_history_panel {:g! actions.options
                                 :<C-A-d> actions.open_in_diffview
                                 :y actions.copy_hash
                                 :L actions.open_commit_log
                                 :zR actions.open_all_folds
                                 :zM actions.close_all_folds
                                 :j actions.next_entry
                                 :<down> actions.next_entry
                                 :k actions.prev_entry
                                 :<up> actions.prev_entry
                                 :<cr> actions.select_entry
                                 :o actions.select_entry
                                 :<2-LeftMouse> actions.select_entry
                                 :<c-b> (actions.scroll_view (- 0.25))
                                 :<c-f> (actions.scroll_view 0.25)
                                 :<tab> actions.select_next_entry
                                 :<s-tab> actions.select_prev_entry
                                 :gf actions.goto_file
                                 :<C-w><C-f> actions.goto_file_split
                                 :<C-w>gf actions.goto_file_tab
                                 :<leader>e actions.focus_files
                                 :<leader>b actions.toggle_files}
            :option_panel {:<tab> actions.select_entry
                           :q actions.close}}})

(nvim.set_keymap :n :<leader>do ":DiffviewOpen<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dc ":DiffviewClose<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dr ":DiffviewRefresh<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dd ":DiffviewOpen " {:noremap true})

