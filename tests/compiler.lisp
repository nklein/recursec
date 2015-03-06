(in-package #:recursec-tests)

(nst:def-fixtures recursec-tests-package ()
  (*package* #.*package*))

(defun compile-then-call (symbol &rest lines)
  (apply #'recursec:compile-function lines)
  (funcall (symbol-function symbol)))

(nst:def-test-group recursec-exports (recursec-tests-package)
  (nst:def-test compile-simplest-function (:all (:equal 'b)
                                                (:predicate fboundp))
    (recursec:compile-function "B"
                               ">"
                               "B"))

  (nst:def-test load-register (:equal 1)
    (compile-then-call 'b
                       "Bv<"
                       ">1#"
                       "B#^")))
