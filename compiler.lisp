(in-package #:recursec)

(defun compile-function (&rest lines)
  (let ((name (intern (subseq (first lines) 0 1))))
    (setf (symbol-function name)
          (lambda ()
            1))
    name))
