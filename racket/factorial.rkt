#lang racket

; non-tail-recursive implementation
(define (factorial n)
  (if (zero? n)
      1
      (* n (factorial (- n 1)))))

; tail-recursive implementation
(define (factorial-tail n acc)
  (if (zero? n)
      acc
      (factorial-tail (- n 1) (* acc n))))

; To visualize the stack trace.
;(require racket/trace)
;(trace factorial)
;(trace factorial-tail)
;(factorial 5)
;(factorial-tail 5 1)

; Of course, it makes more sense to give the user something like:
(define (fact n) (factorial-tail n 1))

(fact 5)