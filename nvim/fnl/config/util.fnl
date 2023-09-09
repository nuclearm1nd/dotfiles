(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

(fn merge [t1 ?t2]
  (let [t2 (or ?t2 {})]
    (each [k v (pairs t2)]
      (tset t1 k v)))
  t1)

(fn keymap [mode from to ?opts]
  (nvim.set_keymap mode from to
                   (merge {:noremap true} ?opts)))

{: merge
 : keymap
 }

