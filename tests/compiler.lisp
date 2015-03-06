(in-package #:recursec-tests)

(nst:def-fixtures recursec-tests-package ()
  (*package* #.*package*))

(nst:def-test-group recursec-exports (recursec-tests-package)
  (nst:def-test compile-simplest-function (:all (:equal 'b)
                                                (:predicate fboundp))
    (recursec:compile-function "B"
                               ">"
                               "B")))
