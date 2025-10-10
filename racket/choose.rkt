#lang racket

(define *paths* '())

(define (choose choices)
  (if (null? choices)
      (fail)
      (call/cc
       (lambda (cc)
         (set! *paths*
           (cons (lambda ()
                   (cc (choose (cdr choices))))
                 *paths*
                 ))
         (car choices)))))

(define fail #f)

(call/cc
 (lambda (cc)
   (set! fail
         (lambda ()
           (if (null? *paths*)
               (cc '!!failure!!)
               (let ((p1 (car *paths*)))
                 (set! *paths* (cdr *paths*))
                 (p1)))))))

(define (is-the-sum-of sum)
  (unless (and (>= sum 0)(<= sum 10))
    (error "out of range" sum))
  (let ([x (choose '(0 1 2 3))]
        [y (choose '(0 1 2 3))])
    (if (= (+ x y) sum)
        (list x y)
        (fail))))

(is-the-sum-of 7)
















  