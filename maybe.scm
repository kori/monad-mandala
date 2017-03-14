(define Maybe:>>=
  (lambda (f a)
    (cond
      ((Nothing? a) (Nothing))
      ((Just? a) (f (Unwrap a)))
      (else (error ">>=" "Tried to bind a non-Maybe value")))))

(define Just
  (lambda (a)
    (list 'Just a)))

(define Just?
  (lambda (a)
    (and (list? a)
         (equal? 'Just (car a)))))

(define Nothing
  (lambda ()
    'Nothing))

(define Nothing?
  (lambda (a)
    (equal? 'Nothing a)))

(define Unwrap
  (lambda (a)
    (cond
      ((Just? a) (cadr a))
      ((Nothing? a) (error "Unwrap" "Tried to unwrap Nothing"))
      (else (error "Unwrap" "Tried to unwrap a non-Maybe value")))))

(define filter-Nothing
  (lambda (l)
    (filter (lambda (a)
              (not (Nothing? a)))
            l)))
