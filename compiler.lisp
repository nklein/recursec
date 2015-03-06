(in-package #:recursec)

(defvar *register* 0
  "The register in the Recurse virtual machine.")

(defun make-position (x y)
  (list x y))

(defun x (position)
  (first position))

(defun y (position)
  (second position))

(defun make-direction (dx dy)
  (list dx dy))

(defun dx (direction)
  (first direction))

(defun dy (direction)
  (second direction))

(defun find-easterly-entry-point (lines)
  (loop :for line :in lines
     :for line-number :from 0
     :when (char= (elt line 0) #\>)
     :do (return line-number)))

(defun get-form-for-char (ch)
  (anaphora:awhen (digit-char-p ch)
    `(setf *register* ,anaphora:it)))

(defun get-form-direction (ch)
  (case ch
    (#\>       (make-direction 1 0))
    (#\<       (make-direction -1 0))
    ((#\v #\V) (make-direction 0 1))
    (#\^       (make-direction 0 -1))))

(defun extract-forms-starting-at (lines row column)
  (labels ((in-bounds (position bounds)
             (and (<= 0 (x position) (x bounds))
                  (<= 0 (y position) (y bounds))))

           (increment-position (position direction)
             (make-position (+ (x position) (dx direction))
                            (+ (y position) (dy direction)))))

    (loop :with bounds = (make-position (1- (length (first lines)))
                                        (1- (length lines)))
       :for direction = (make-direction 1 0)
         :then (or (get-form-direction ch)
                   direction)
       :for position = (make-position column row)
         :then (increment-position position direction)
       :while (in-bounds position bounds)
       :for line = (elt lines (y position))
       :for ch = (elt line (x position))
       :for form = (get-form-for-char ch)
       :when form
       :collect form)))

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
