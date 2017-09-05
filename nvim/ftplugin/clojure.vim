setlocal iskeyword-=.
setlocal iskeyword-=/

let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["deftest"],
    \ 'clojureFunc': ["string/join"]
    \ }

let g:clojure_align_multiline_strings = 1
let g:clojure_special_indent_words = 'deftest'

