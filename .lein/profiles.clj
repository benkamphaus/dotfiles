{:user {:plugins [ [lein-iclojure "1.2"] ]
        :repl-options {:prompt (fn [ns] (str "\033[1;32m"
                                         "<clj> [" ns "]$ " "\033[0m "))}}}
