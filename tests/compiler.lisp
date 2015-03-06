(in-package #:recursec-tests)

(nst:def-test-group recursec-exports ()
  (nst:def-test compile-simplest-function (:equal 'b)
    (let ((*package* (find-package '#:recursec-tests)))
      (recursec:compile-function "B"
                                 ">"
                                 "B"))))
