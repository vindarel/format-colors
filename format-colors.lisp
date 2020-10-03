(defpackage format-colors
  (:use :cl)
  (:export :blue
           :red
           :yellow
           :green
           :cyan
           :black
           :magenta
           :white))

(in-package :format-colors)

;; Here's how a custom format function looks like:
;; (defun red (stream arg colon-p at-sign-p &rest params)
;;   (declare (ignorable colon-p at-sign-p params))
;;   (let ((effect (if at-sign-p :bright :unset)))
;;     (format stream "~a" (cl-ansi-text:red
;;                          arg
;;                          :effect effect))))

(defmacro define-format-controls ()
  `(progn
     ,@(map 'list
            (lambda (color)
              `(defun ,(intern (symbol-name color)) (stream arg colon-p at-sign-p &rest params)
                 ,(format nil "Print the argument in ~a. Use with ~~/~a/." color color)
                 (declare (ignorable colon-p at-sign-p params))
                 (let ((effect (cond
                                 (at-sign-p :bright)
                                 (colon-p :italic)
                                 (t :unset)))
                       (style (cond
                                (params :background)
                                (t :foreground))))
                   (print params)
                   (format stream "~a"
                           (,(find-symbol (symbol-name color) 'cl-ansi-text)
                             arg
                             :effect effect
                             :style style)))))
            cl-ansi-text::+term-colors+)))

;; define them.
(define-format-controls)

;; We can probably add features (style) by using colon-p and at-sign-p.
