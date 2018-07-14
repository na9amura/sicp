# Formulating Abstractions with Higher-Order Procedures

- build abstruction
  - to express the concept of something
  - assigning names to common patterns
  - procedures that can accept procedures
    = **higher-order procedures**

## 1.3.1 Procedures as Arguments

- sigma notation
  - enable summation not only particular sums
    => similar to higher-order procedures

```s
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; sum of cubes
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

; sum of integers
(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))

; sum of pi
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

; integral of function f between a and b
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
```



