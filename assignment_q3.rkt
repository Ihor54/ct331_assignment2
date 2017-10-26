#lang racket

;A
(define (tree_display tree)
  (begin
    (cond
      [(empty? (car tree)) (display " ")]
      [else (tree_display (car tree))]
      )
    (display (car (cdr tree)))
    (cond
      [(empty? (caddr tree)) (display " ")]
      [else (tree_display (car (cdr (cdr tree))))]
      )
    ))
(display "A: ")(tree_display '((() 1 ()) 3 ((() 4 ()) 6 (() 7 ()))))

;B
(define (search_tree item lst)
  (cond
    [(empty? lst) #f]
    [(equal? item (car (cdr lst))) #t]
    [(< item (car (cdr lst))) (search_tree item (car lst))]
    [else (search_tree item (car (cdr (cdr lst))))]
    ))

(display "\nB: ")
(search_tree 4 '((() 1 ()) 3 ((() 4 ()) 6 (() 7 ()))))

;C
(define (insert_el_into_tree item lst)
  (cond
    [(empty? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst)) "item found"]
    [(< item (cadr lst)) (list (insert_el_into_tree item (car lst)) (cadr lst) (caddr lst))]
    [else (list (car lst) (cadr lst) (insert_el_into_tree item (caddr lst)))]
))

(display "C: \n  before insertion:")
(define tree '((() 1 ()) 3 ((() 4 ()) 6 (() 7 ()))))
(tree_display tree)
(display "\n  after insertion: ")
(define tree4 (insert_el_into_tree 8 tree))
(tree_display tree4)

;D
(define (insert_list_into_tree lst tree)
  (cond
   [(empty? lst) tree]
   [else (insert_list_into_tree (cdr lst) (insert_el_into_tree (car lst) tree))]
  ))

(display "\nD: ")
(insert_list_into_tree '(8 10 14 13 3 6 1 4 7) '())

;E
(define (tree-sort lst)
  (tree_display (insert_list_into_tree lst '()))
  )

(display "E: ")
(tree-sort '(8 10 14 13 3 6 1 4 7))

;F
(define (higher_tree_sort lst fn)
  (tree_display (list_into_tree lst '() fn))
  )

(define (list_into_tree lst tree fn)
  (cond
   [(empty? lst) tree]
   [else (list_into_tree (cdr lst) (el_into_tree (car lst) tree fn) fn)]
  ))

(define (el_into_tree item lst fn)
  (cond
    [(empty? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst)) "item found"]
    [(fn item (cadr lst)) (list (el_into_tree item (car lst) fn) (cadr lst) (caddr lst))]
    [else (list (car lst) (cadr lst) (el_into_tree item (caddr lst) fn))]
))

(display "\nF: \n  ascending: ")
(higher_tree_sort '(8 10 14 13 3 6 1 4 7) <)
(display "\n  descending: ")
(higher_tree_sort '(8 10 14 13 3 6 1 4 7) >)
(display "\n  ascending based on last digit: ")


(define (last_digit num1 num2)
  (< (modulo num1 10) (modulo num2 10)))

(higher_tree_sort '(8 10 14 13 3 6 1 4 7) last_digit)