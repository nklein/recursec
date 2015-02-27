(in-package #:recursec-tests)

(nst:def-fixtures recursec-system ()
  (system (asdf:find-system '#:RECURSEC)))

(nst:def-test-group recursec-documentation (recursec-system)
  (nst:def-test readme-exists (:true)
    (some (lambda (file) (asdf:find-component system file))
          '("README.md" "README.txt"))))
