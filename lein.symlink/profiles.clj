{:user {
        :dependencies [
                       [cljfmt "0.1.10"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                       ]
        :plugins [
                  [lein-midje "3.1.3"]
                  [lein-ancient "0.5.5"]
                  [lein-kibit "0.0.8"]
                  [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.1.8"]
                  [slamhound "1.5.5"]
                  [lein-droid "0.4.0-alpha3"]
                  [lein-ubersource "0.1.1"]
                  ]
        :android {
                  :sdk-path "/Users/lsenta/dev/android-sdk-macosx"
                  }
        :aliases {
                  "slamhound" ["run" "-m" "slam.hound"]
                  }}}


