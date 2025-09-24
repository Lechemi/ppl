#lang racket

(define (greet name)
  (displayln (string-append "Hello, " name ".")))

(greet "Mickers")

(define (greet-ada name)
  (if (equal? name "Ada")
      ; then branch
      (displayln "Hello, Ada!")
      ; else branch
      (displayln (string-append "Go away " name ", you're not Ada!"))))

(greet-ada "Mickers")
(greet-ada "Ada")

(define (safe-greet name)
  (if (string? name)
      (greet name)
      (displayln "Name must be a string.")))

(safe-greet "Mickers")
(safe-greet 4)