```s
(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a (* x x)) (* b x) c)))
(newton-method (cubic 10 3 2) 1)
(newton-method (cubic 1 2 1) 1)
```