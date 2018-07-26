## a: continued fraction

```s
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1)
```


## b: recursive <=> iterative

```s
(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (= i k)
        acc
        (iter (+ i 1) (/ (n 1) (+ (d i) acc)))))
  (iter 0 0))

(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10.0)
```
