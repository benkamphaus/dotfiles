{:user {
        :plugins ;[[venantius/ultra "0.2.1"]]
                 [[cider/cider-nrepl "0.8.2"]]
;        :ultra {:color-scheme :solarized_dark}
        :repl-options {:prompt (fn [ns] (str "\033[1;32m"
                                         "<clj> [" ns "]$ " "\033[0m "))}}}
