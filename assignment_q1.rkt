#lang racket

;A cons pair of two numbers
(cons 2 3)

;A list of 3 numbers, using only the cons function
(cons 3 (cons 2 (cons 1 '())))

;A list containing a string, a number and a nested list of three numbers, using only the
;cons function
(cons "hello" (cons 1 (cons (cons 1 (cons 2 (cons 3 empty))) empty)))

;A list containing a string, a number and a nested list of three numbers, using only the
;list function
(list "hello" 1 '(1 2 3))

;A list containing a string, a number and a nested list of three numbers, using only the
;append function
(append '("hello" 1) '((1 2 3)))
