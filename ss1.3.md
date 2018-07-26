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

### 1.3.2 Constructing Procedures Using lambda

```s
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
      dx))
```

#### Using `let` to create local variables

```
f(x, y) = x(1 + xy) ^ 2 + y(1 - y) + (1 + xy)(1 - y)
```

```s
(define (f x y)
  (let ((a (+ 1 (* x y)))
         (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
```

- definition of let

```
(let `var1` have the value `exp1` and
     `var2` have the value `exp2` and
     ...
     `var n` have the value `exp n`
  in `body`)
```

- let is syntax sugar of lambda

```
((lambda (`var1` ... `var n`)
  `body`)
  `exp1`
  ...
  `exp n`)
```

### 1.3.3 Procedures as General Methods

#### half-interval method

- example
  - find x where f(x) = 0
  - given points a, b
    - f(a) < 0 < f(b)
    - n = (average a b)
      - if f(n) > 0
        - f(k) = 0
        - a < k < n
      - if f(n) < 0
        - f(k) = 0
        - n < k < b

```s
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                  (search f neg-point midpoint))
                ((negative? test-value)
                  (search f midpoint pos-point))
                (else midpoint))))))

(define (average x y) (/ (+ x y) 2.0))
(define (close-enough? x y) (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
            (search f a b))
          ((and (negative? b-value) (positive? a-value))
            (search f b a))
          (else
            (error "Values are not opposite sign" a b)))))
```

#### finding fixed points of functions
- fixed point of a function
  - f(x) = x
  - find applying repeatedly
    - if f(x) ≒ f(f(x)) ≒ f(f(f(x)))
    - x is the fixed point

```s
(define torelance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) torelance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)
```

```s
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
```

