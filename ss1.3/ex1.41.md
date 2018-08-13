```s
(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)

(double (double (f (f x))))
(double (f (f (f (f x))))
(f (f (f (f (f (f (f (f (f (f (f (f (f (f (f (f x))))))))))))))))
```