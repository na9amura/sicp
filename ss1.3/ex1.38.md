

```s
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1)
```

- D_i rule

k   | 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ..., n
D_k | 1, 2, 1, 1, 4, 1, 1, 6, 1,  1,  8, ...

-> ((k + 1) % 3) != 0 ? 1 : ((k + 1) / 3) * 2

```s
(define (d i)
  (if (= (modulo (+ i 1) 3) 0)
      (* 2 (/ (+ i 1) 3))
      1))
(define e
  (+
    2
    (cont-frac (lambda (i) 1.0) d 10.0)))
```
