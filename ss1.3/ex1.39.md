## continued function to calc tangent

```s
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1)

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1.0)
```

```s
(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  (define (d i)
    (- (* i 2) 1))
  (cont-frac n d k))
```