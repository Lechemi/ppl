#lang racket

(define l1 '(1 (2) (3 4) ((5) 6 7) 8))

; Flatten a list.
; Example '(1 (2) (3 4) ((5) 6 7) 8) -> '(1 2 3 4 5 6 7 8)
(define (flatten-list lst)
  (cond
    [(null? lst) lst]
    [(not (list? lst)) (list lst)]
    [else (append
           (flatten-list (car lst))
           (flatten-list (cdr lst)))]))

; Each pair of square brackets is a branch of cond.
; 1) If lst is '(), then return it.
; 2) If lst is not a list (it's an element), then return the list containing only it.
; 3) In any other case, return the list made of the first element + the rest of the list.

(flatten-list l1)
  