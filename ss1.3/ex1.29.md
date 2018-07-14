
- Simpron's Rule
  - more accurate method to calc integral of function

- h = (b - a) / n
- yk = ƒ(a + kh)

```s
(define (cube x) (* x x x))

(define (integral2 f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (fn-y k)
    (f (+ a (* k h))))
  (define (integral-term k)
    (*
      (cond ((or (= k 0) (= k n)) 1)
            ((even? k) 2)
            (else 4))
      (fn-y k)))
  (*
    (/ h 3.0)
    (sum integral-term a inc n)))
```
