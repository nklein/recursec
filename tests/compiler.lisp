(in-package #:recursec-tests)

(nst:def-test-group recursec-exports ()
  (nst:def-test compile-simplest-function (:true)
    (recursec:compile-function "B"
                               ">"
                               "B")))
