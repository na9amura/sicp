(#|

  - when n is even
    b ^ n
    = (b ^ 2) ^ (n / 2) 
    = c ^ (n / 2)
    = (c ^ 2) ^ (n / 4)
    = d ^ (n / 4)
    = (d ^ 2) ^ (n / 8)
    ...

  - when n is odd
    b ^ n 
    = b * b ^ (n - 1)
    = b * (b ^ 2) ^ ((n - 1) / 2)
    = b * c ^ ((n - 1) / 2) ... suppose (n - 1) / 2 is odd
    = b * c * c ^ (((n - 1) / 2) - 1)

  - when b = 3, n = 8
    3 ^ 8
    = (3 ^ 2) ^ (8 / 2)
    = 9 ^ 4
    = (9 ^ 2) ^ (4 / 2)
    = 81 ^ 2
    = (81 ^ 2) ^ (2 / 2)
    = 6561 ^ 1
    = 6561 * 6561 ^ 0
  
  - when b = 3, n = 7
    3 ^ 7
    = 3 * 3 ^ 6
    = 3 * (3 ^ 2) ^ (6 / 2)
    = 3 * 9 ^ 3
    = 3 * 9 * 9 ^ 2
    = 27 * 9 * 2
    = 27 * (9 ^ 2) ^ (2 / 2)
    = 27 * 81 ^ 1
    ...
|#)


(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (* b b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* a b)))))

(define (expt b n) (expt-iter b n 1))
