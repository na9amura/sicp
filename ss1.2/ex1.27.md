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

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fast-prime? n a)
  (newline) (display n) (display " ") (display a)
    (cond ((= a 0) #t)
          ((fermat-test n a) (fast-prime? n (- a 1)))
          (else #f)))

(define (charmicael-test n)
  (fast-prime? n (- n 1)))
```
