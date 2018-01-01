{
 :repl {:plugins []
        :dependencies []}
 :user {
        :signing {:gpg-key "D1F408F014969F7198E1A905398D455D0B986A07"}
        :dependencies []

        :test-refresh {:notify-command ["reattach-to-user-namespace" "terminal-notifier" "-title" "Tests" "-message"]}

        :plugins [
                  ;; june 2017
                  [lein-create-template "0.2.0"]
                  ;; 20 may 2017
                  [lein-pprint "1.1.2"]
                  ;; 29 april 2017
                  [cider/cider-nrepl "0.14.0"]
                  [lein-ancient "0.6.10"]]
;                  [venantius/ultra "0.5.1"]
;                  [lein-kibit "0.1.3"]
;                  [jonase/eastwood "0.2.3"]]
        :android {:sdk-path "/Users/laurent/dev/android-sdk-macosx"}}}


