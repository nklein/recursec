(in-package #:recursec)

(defvar *register* 0
  "The register in the Recurse virtual machine.")

(defun find-easterly-entry-point (lines)
  (loop :for line :in lines
     :for line-number :from 0
     :when (char= (elt line 0) #\>)
     :do (return line-number)))

(defun get-form-for-char (ch)
  (anaphora:awhen (digit-char-p ch)
    `(setf *register* ,anaphora:it)))

(defun extract-forms-starting-at (lines line-number position-number)
  (loop :with line = (elt lines line-number)
     :for position :from position-number :below (length line)
     :for ch = (elt line position)
     :for form = (get-form-for-char ch)
     :when form
     :collect form))

(defun function-forms (lines)
  (anaphora:awhen (find-easterly-entry-point lines)
    (extract-forms-starting-at lines anaphora:it 1)))

(defun compile-function (&rest lines)
  (let ((name (intern (subseq (first lines) 0 1))))
    (setf (symbol-function name)
          (compile nil `(lambda ()
                          ,@(function-forms lines)
                          *register*)))
    name))
