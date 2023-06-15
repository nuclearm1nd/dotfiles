(module config.util
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn nnoremap [from to opts]
  (let [map-opts {:noremap true}
        to (.. ":" to "<cr>")]
    (if (a.get opts :local?)
      (nvim.buf_set_keymap 0 :n from to map-opts)
      (nvim.set_keymap :n from to map-opts))))

(defn lnnoremap [from to]
  (nnoremap (.. "<leader>" from) to))

(defn merge [t1 ?t2]
  (let [t2 (or ?t2 {})]
    (each [k v (pairs t2)]
      (tset t1 k v)))
  t1)

(defn keymap [mode from to ?opts]
  (nvim.set_keymap mode from to
                   (merge {:noremap true} ?opts)))

