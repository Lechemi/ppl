#lang racket

(+ 3
   (call/cc
    (lambda (exit)
      (for-each (lambda (x)
                  (when (negative? x)
                    (exit x)))
                '(54 0 37 -3 245 19))
      10)))