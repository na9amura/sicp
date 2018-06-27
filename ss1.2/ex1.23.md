
- smallest divisor procedure

```s
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))
```

-

```s
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (next n)
    (if (= n 2) 3
                (+ n 1)))
```

- larger than 1_000_000
    1000003 *** 170
    1000033 *** 194
    1000037 *** 169
    1000039 *** 187

=> By skipping even numbers except 2, the procesure has O(√n / 2) growth.
    Although order became half, 1/2 has small effect enough to ignore.
