{:user {
        :dependencies [
                       [cljfmt "0.1.10"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                       ]
        :test-refresh {:notify-command ["reattach-to-user-namespace" "terminal-notifier" "-title" "Tests" "-message"]}
        :plugins [
                  [lein-midje "3.1.3"]
                  [lein-ancient "0.5.5"]
                  [lein-kibit "0.0.8"]
                  [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.1.8"]
                  [slamhound "1.5.5"]
                  [lein-ubersource "0.1.1"]
                  [com.jakemccrary/lein-test-refresh "0.13.0"]
                  [pjstadig/humane-test-output "0.7.1"]
                  [venantius/ultra "0.4.0"]
                  ]
        :ultra {:color-scheme :solarized_dark}
        :android {:sdk-path "/Users/lsenta/dev/android-sdk-macosx"}
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
