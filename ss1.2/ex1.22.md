
- given procedure

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

- procedure checks the primality of consecutive odd integers in a specified range

```s
(define (search-for-primes-iter current end)
    (if (odd? current)
        (cond ((< current end)
            (timed-prime-test current)
            (search-for-primes-iter (+ current 1) end)))
        (search-for-primes-iter (+ current 1) end)))

(define (search-for-primes start end)
    (search-for-primes-iter start end))
```

three smallest primes and the time elapsed

- larger than 1000
    - 1009 *** 6
    - 1013 *** 6
    - 1019 *** 6
- larger than 10_000
    - 10007 *** 16
    - 10009 *** 16
    - 10037 *** 16
- larger than 100_000
    - 100003 *** 91
    - 100019 *** 56
    - 100043 *** 55
- larger than 1_000_000
    - 1000003 *** 174
    - 1000033 *** 174
    - 1000037 *** 175

√10 ≒ 3.162277660168379

6 * 3.16 = 18.96

16 * 3.16 = 50.56

55 * 3.16 = 173.8

=> it takes √10 times longer when `n` increase 10 times
