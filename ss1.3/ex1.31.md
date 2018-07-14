## a

- higher order function to product in range
```s
(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))))
```

- factorial
```s
(define (factorial a b)
    (define (inc x) (+ x 1))
    (define (term x) x)
    (product term a inc b))
```

- approximations to pi
```s
(define (approx-pi limit)
    (define (inc x) (+ x 1))
    (define (term x)
        (if (even? x)
            (/ x (+ x 1))
            (/ (+ x 1) x)))
    (* 4.0 (product term 2.0 inc limit)))
```

## b

- change to iterative process

```s
(define (iter-product term a next b)
    (define (iter term a acc)
        (if (> a b)
            acc
            (iter term (next a) (* acc a))))
    (iter term a 1))

(define (factorial a b)
    (define (inc x) (+ x 1))
    (define (term x) x)
    (iter-product term a inc b))
```
