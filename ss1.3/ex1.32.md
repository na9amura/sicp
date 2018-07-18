## a

- implement `accumulate` which abstract sum and product

```s
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner
            a
            (accumulate combiner null-value term (next a) next b))))

(define (sum-ints a b)
    (define (term x) x)
    (define (next x) (+ x 1))
    (define (combiner x y) (+ x y))
    (accumulate combiner 0 term a next b))

(define (factorial a b)
    (define (term x) x)
    (define (next x) (+ x 1))
    (define (combiner x y) (* x y))
    (accumulate combiner 1 term a next b))
```

## b

- implement `accumulate` with iteracive process

```s
(define (iter-accumulate combiner null-value term a next b)
    (define (iter a current)
        (if (> a b)
            current
            (iter (next a) (combiner a current))))
    (iter a null-value))

(define (iter-sum-ints a b)
    (define (term x) x)
    (define (next x) (+ x 1))
    (define (combiner x y) (+ x y))
    (iter-accumulate combiner 0 term a next b))
```
