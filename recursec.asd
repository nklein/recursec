(asdf:defsystem #:recursec
  :description "Compiler for the esoteric language Recurse."
  :author "Patrick Stein <pat@nklein.com>"
  :version "0.1.20150227"
  :license "Free"
  :depends-on (#:anaphora)
  :in-order-to ((asdf:test-op (asdf:load-op :recursec-tests)))
  :perform (asdf:test-op (o c) (uiop:symbol-call :recursec-tests :run-tests))
  :components ((:static-file "README.md")
               (:file "package")
               (:file "compiler" :depends-on ("package"))))
