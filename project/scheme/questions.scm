(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
    (define (helper s i) 
        (cond ((= (length s) 0) (List))
              ((= (length s) 1) (List (List i (car s))))
              (else (append (List (List i (car s))) (helper (cdr s) (+ i 1))))))
    (helper s 0)
)
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
    (cond ((= (length list1) 0) list2)
          ((= (length list2) 0) list1)
          (else (append (if (comp (car list1) (car list2)) 
                            (begin (define rest1 (cdr list1)) (define rest2 list2) (List (car list1)))
                            (begin (define rest2 (cdr list2)) (define rest1 list1) (List (car list2))))
                    (merge comp rest1 rest2))))
)
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    (cond ((= (length s) 0) (List s))
          ((= (length s) 1) (List s))
          ((> (car s) (car (cdr s))) (append (List (List (car s))) (nondecreaselist (cdr s))))
          (else (append (List (append (List (car s)) (car (nondecreaselist (cdr s))))) (cdr (nondecreaselist (cdr s))))))
    ;(append (List (helper s (car s))))
)
; END PROBLEM 17


