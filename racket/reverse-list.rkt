#lang racket

(define numbers '(1 2 3 4 5 6 7 8))

; Reverse a list recursively.
; acc stores the reversed list.
; At each call, if x is not empty, we prepend its first element to acc.
(define (reverse-list lst)
  (define (reverse-list-helper x acc)
    (if (null? x)
        acc
        (let ([head (car x)]
              [rest (cdr x)])
          (reverse-list-helper rest (cons head acc)))))
  (reverse-list-helper lst '()))

(reverse-list numbers)