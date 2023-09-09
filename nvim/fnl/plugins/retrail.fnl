(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :zakharykaplan/nvim-retrail
  :branch :main
  :config (fn []
            (let [retrail (autoload :retrail)]
              (retrail.setup
                {:hlgroup :Search
                 :pattern "\\v((.*%#)@!|%#)\\s+$"
                 :filetype {:strict true
                            :include ["clojure" "fennel"]
                            :exclude ["" "help"]}
                 :trim {:whitespace true
                        :blanklines false}})))}]

