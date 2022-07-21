(module config.plugin.retrail
  {autoload {nvim aniseed.nvim}})

((. (require :retrail) :setup)
 {:hlgroup :Search
  :pattern "\\v((.*%#)@!|%#)\\s+$"
  :filetype {:strict false
             :include []
             :exclude ["" "help"]}
  :trim {:whitespace true
         :blanklines false}})

