{:user {:plugins [[venantius/ultra "0.5.1"]
                  [cider/cider-nrepl "0.14.0"]
                  [lein-kibit "0.1.5"]
                  [jonase/eastwood "0.2.4"]]
        :dependencies [[cljfmt "0.5.6"]]
        :ultra {:color-scheme :solarized_dark}
        :repl-options {:prompt (fn [ns]
                                 (str "\033[1;32m"
                                      "<clj> [" ns "]$ " "\033[0m "))}}}
