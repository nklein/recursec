(in-package #:recursec)

(defvar *register* 0
  "The register in the Recurse virtual machine.")

(defun function-forms (lines)
  (loop :for line :in lines
     :appending (loop :for ch :in (coerce line 'list)
                   :for digit = (digit-char-p ch)
                   :when digit
                   :collect `(setf *register* ,digit))))

(defun compile-function (&rest lines)
  (let ((name (intern (subseq (first lines) 0 1))))
    (setf (symbol-function name)
          (compile nil `(lambda ()
                          ,@(function-forms lines)
                          *register*)))
    name))
