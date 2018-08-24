## Preface: Building Abstractions with Data

```s
(define (linear-combination a b x y)
  (+ (* a x) (* b y)))
```

this procedure only supports numbers

```s
(define (linear-combination a b x y)
  (add (mul a x) (mul b y)))
```

- change + -> add, * -> mul to suppoer more complex pattern
  - keep plain interface
  - `add` and `mul` knows how to manipulate

## Introduction to Data Abstruction

### 2.1.1 Arithemtic Operations for Rational Numbers

```s
(define (make-rat n, d) ...)
(define (numer x) ...)
(define (denom x) ...)
```

```s
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
```

#### Pairs
- `cons`: construct
- `car`: reference address of construct
- `cdr`: reference decrement of construct

#### Representing rational numbers
```s
(define make-rat cons)
(define numer car)
(define denom cdr)
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
```

```s
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-thirs one-third))
```

## 2.1.2 Abstruction Barriers

- abstruction barriers: isolate each 'levels'
  - rational-number package does not need to know how pairs are implementedw



