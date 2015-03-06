(in-package #:recursec)

(defvar *register* 0
  "The register in the Recurse virtual machine.")

(defun compile-function (&rest lines)
  (let ((name (intern (subseq (first lines) 0 1))))
    (setf (symbol-function name)
          (lambda ()
            *register*))
    name))
