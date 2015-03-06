(in-package #:recursec)

(defun compile-function (&rest lines)
  (values (intern (subseq (first lines) 0 1))))
