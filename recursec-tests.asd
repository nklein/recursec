(asdf:defsystem #:recursec-tests
  :description "Compiler for the esoteric language Recurse."
  :author "Patrick Stein <pat@nklein.com>"
  :version "0.1.20150227"
  :license "Free"
  :depends-on (:recursec :nst)
  :components ((:module "tests"
                :components ((:file "package")
                             (:file "run" :depends-on ("package"))))))
