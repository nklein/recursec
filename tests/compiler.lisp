(in-package #:recursec-tests)

(nst:def-fixtures recursec-tests-package ()
  (*package* #.*package*))

(defun compile-then-call (symbol &rest lines)
  (apply #'recursec:compile-function lines)
  (let ((recursec::*register* 0))
    (funcall (symbol-function symbol))))

(nst:def-test-group recursec-compiler (recursec-tests-package)
  (nst:def-test compile-simplest-function (:all (:equal 'b)
                                                (:predicate fboundp))
    (recursec:compile-function "B"
                               ">"
                               "B"))

  (nst:def-test call-simplest-function (:equal 0)
    (compile-then-call 'b
                       "B"
                       ">"
                       "B"))

  (nst:def-test load-register (:equal 1)
    (compile-then-call 'b
                       "Bv<"
                       ">1."
                       "B.^"))

  (nst:def-test load-register-easterly (:equal 1)
    (compile-then-call 'b
                       "Bv<"
                       ">1."
                       "B2^"))

  (nst:def-test unconditional-turn-south (:equal 2)
    (compile-then-call 'b
                       "Bv<"
                       ">v1"
                       "B2^")))
