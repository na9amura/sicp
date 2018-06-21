

```s
(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))
```


```s
(define (search-for-primes-iter current end)
    (cond ((< current end)
        (timed-prime-test current)
        (search-for-primes-iter (+ current 1) end))))

(define (search-for-primes start end)
    (search-for-primes-iter start end))
```
