#lang racket

(define *exit-store* '())

(define (break v)
  ((car *exit-store*) v))

(define-syntax For
  (syntax-rules (from to do)
    ((_ var from min to max do body ...)
     (let* ((min1 min)
            (max1 max)
            (inc (if (< min1 max1) + -)))
       (let ((v (call/cc
                 (lambda (k)
                   (set! *exit-store*
                         (cons k *exit-store*))
                   (let loop ((var min1))
                     body ...
                     (unless (= var max1)
                       (loop (inc var 1))))))))
         (set! *exit-store* (cdr *exit-store*))
         v)))))

(For i from 1 to 10
     do
     (displayln i)
     (when (= i 5)
       (break #t)))

