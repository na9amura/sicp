- more general version of `accumulate`
  - with `filter`

```s
(define (filtered-accumulate null-value combiner term a next filter b)
  (cond ((> a b) null-value)
        ((filter a)
          (combiner
            (term a)
            (filtered-accumulate null-value combiner term (next a) next filter b)))
        (else (filtered-accumulate null-value combiner term (next a) next filter b))))
```

### a: sum of squares of the prime numbers

```s
(define (sum-of-prime a b)
  (define (add x y) (+ x y))
  (define (term x) x)
  (define (next x) (+ x 1))
  (filtered-accumulate 0 add term a next prime? b))

; prime check
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))
```

### b: product

```s
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))

(define (product-of-relative-prime n)
  (define (combiner x y) (* x y))
  (define (term x) x)
  (define (next x) (+ x 1))
  (define (filter x) (= 1 (gcd x n)))
  (filtered-accumulate 1 combiner term 1 next filter n))
```
