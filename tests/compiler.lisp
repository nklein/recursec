(in-package #:recursec-tests)

(nst:def-fixtures recursec-tests-package ()
  (*package* #.*package*))

(nst:def-test-group recursec-exports (recursec-tests-package)
  (nst:def-test compile-simplest-function (:all (:equal 'b)
                                                (:predicate fboundp))
    (recursec:compile-function "B"
                               ">"
                               "B"))

  (nst:def-test load-register (:equal 1)
    (funcall (symbol-function (recursec:compile-function "Bv<"
                                                         ">1#"
                                                         "B^#")))))
