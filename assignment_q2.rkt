#lang racket


;A
(define (ins_beg el lst)
;  (cons el lst))
  (append (list el) lst))

(display "A: \n")
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d)) 

;B
(define (ins_end el lst)
  (append lst (list el)))

(display "\nB: \n")
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

;C
(define (count_top_level lst)
  (if (empty? lst)
      0
      (+ 1 (count_top_level (cdr lst)))
      ))

(display "\nC: ")
(count_top_level '(1 2 (3 4) 5 6 (7 8))) 

;D
(define (count_instances item lst)
  (if (empty? lst)
      0
      (if (equal? item (car lst))
          (+ 1 (count_instances item (cdr lst)))
          (count_instances item (cdr lst))
  )))

(display "\nD: ")
(count_instances 1 '(1 2 1 3 4 5 1 6))

;E
(define (count_instances_tr item lst)
  (count_instances_tr_helper item lst 0))

(define (count_instances_tr_helper item lst total)
  (cond
    [(empty? lst) total]
    [(equal? item (car lst)) (count_instances_tr_helper item (cdr lst) (+ 1 total))]
    [else (count_instances_tr_helper item (cdr lst) total)]
    ))

(display "\nE: ")
(count_instances_tr 1 '(1 2 1 3 4 5 1 6))

;F
(define (count_instances_deep item lst)
  (cond
    [(empty? lst) 0]
    [(list? (car lst))
          (+ (count_instances_deep item (car lst)) (count_instances_deep item (cdr lst)))]
    [(equal? item (car lst))
          (+ 1 (count_instances_deep item (cdr lst)))]
    [else (count_instances_deep item (cdr lst))]
    ))

(display "\nF: ")
(count_instances_deep 1 '(1 2 1 (1 3 4)))
















