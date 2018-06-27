```s
(define (square n) (* n n))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
            (remainder
              (square (expmod base (/ exp 2) m))
              m))
          (else
            (remainder
              (* base (expmod base (- exp 1) m))
              m))))

(define (charmicael-test n)
  (charmicael-test-iter n (- n 1)))
(define (charmicael-test-iter n a)
  (newline) (display n) (display " ") (display a)
  (cond ((= a 0) #t)
        ((= (expmod a n n) a)
            (charmicael-test-iter n (- a 1)))
        (else #f)))
```
