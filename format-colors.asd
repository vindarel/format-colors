(asdf:defsystem "format-colors"
  :version "0.1"
  :author "vindarel"
  :license "LLGPL"
  :depends-on (:cl-ansi-text)
  :components ((:file "format-colors"))

  :description "Custom format functions for colorful output: use as (format t \"~/blue/\" arg)"
  ;; :long-description
  ;; #.(read-file-string
  ;;    (subpathname *load-pathname* "README.md"))
  )
