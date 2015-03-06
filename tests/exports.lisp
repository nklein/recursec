(in-package #:recursec-tests)

(defun exported-from-package-p (sym)
  (multiple-value-bind (symbol status)
      (find-symbol (symbol-name sym) "RECURSEC")
    (and symbol
         (eql status :external))))

(defun function-in-package-p (sym)
  (fboundp (find-symbol (symbol-name sym) "RECURSEC")))

(nst:def-test-group recursec-exports ()
  (nst:def-test compiler-exists (:all (:predicate exported-from-package-p)
                                      (:predicate function-in-package-p))
    :compile-function))
