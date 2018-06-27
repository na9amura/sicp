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

(define (charmicael-test a)
  (charmicael-test-iter a (- a 1)))
(define (charmicael-test-iter a n)
  (newline) (display a) (display " ") (display n)
  (cond ((= n 0) #t)
        ((= (expmod a n n) a)
            (charmicael-test-iter a (- n 1)))
        (else #f)))
```
