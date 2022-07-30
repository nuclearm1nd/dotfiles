(module config.plugin.retrail
  {autoload {nvim aniseed.nvim
             retrail retrail}})

(retrail.setup
 {:hlgroup :Search
  :pattern "\\v((.*%#)@!|%#)\\s+$"
  :filetype {:strict true
             :include ["clojure" "fennel"]
             :exclude ["" "help"]}
  :trim {:whitespace true
         :blanklines false}})

