; Lab 14: Final Review

(define (compose-all funcs)
  (define (get-first f a) (if (eq? f nil) a (get-first (cdr f) ((car f) a))))
  (lambda (x) (get-first funcs x))
)
