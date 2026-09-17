#lang racket

(let ((a 1))
    (let ((f (lambda () (display a))))
        (let ((a 2))
            (f))
    )
)