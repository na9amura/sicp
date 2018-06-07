
### implement p' and q` in this procedure

```s
(define (fib n) 
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond 
    ((= count 0) b)
    ((even? count) (fib-iter a 
                             b
                             ? ; p' 
                             ? ; q'
                             (/ count 2)))
    (else (fib-iter (+ (* b q) (* a q) (* a p))
                    (+ (* b p) (* a q))
                    p
                    q
                    (- count 1)))))
```

### asumption

```
T = { 
  a <- a + b
  b <- a  
}

T ^ n = [Fib(n + 1), Fib(n)]
```

when apply T **twice**, a and b transform like this

```
{
  a' = bq + aq + ap
  b' = bp + aq
}

{
  a'' = b'q + a'q + a'p
  b'' = b'p + a'q
}
```

rewrite equation by filling a' and b'

```
b'' = (bp + aq) * p + (bq + aq + ap) * q
    = bpp + apq + bqq + aqq + apq
    = a(pq + qq + pq) + b(pp + qq)
    = a(2pq + qq) + b(pp + qq)
```

to fill `b'' = bp' + aq'`

```
p' = p ^ 2 + q ^ 2
q' = 2pq + p ^ 2
```

```
a'' = (bp + aq) * q + (bq + aq + ap) * q + (bq + aq + ap) * p
    = bpq + aqq + bqq + aqq + apq + bpq + apq + app
    = bpq + bqq + bpq + aqq + aqq + apq + apq + app
```

as form of p' and q' already revealed,

```
    = 2bpq + bqq + (app + aqq) + (aqq + apq + apq)
    = b(2pq + qq) + a(pp + qq) + a(2pq + qq)
```

verified p' and q' is the same form as resolved from b''

then, p' and q' in scheme,

```s
; p'
(+ (* p p) (* q q))

; q'
(+ (* 2 p q) (* q q))
```

complete definition

```s
(define (fib n) 
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond 
    ((= count 0) b)
    ((even? count) (fib-iter a 
                             b
                             (+ (* p p) (* q q)) 
                             (+ (* 2 p q) (* q q))
                             (/ count 2)))
    (else (fib-iter (+ (* b q) (* a q) (* a p))
                    (+ (* b p) (* a q))
                    p
                    q
                    (- count 1)))))
```