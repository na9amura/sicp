; other implemention for square
(define (double x) (+ x x))
(define (square x) (exp (double (log x))))

#| internal definfitions and block structure |#

(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
    (define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x) (average guess (/ x guess)))
    (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))
    (sqrt-iter 1.0 x))

#| 
### lexical scoping

x is bound in whole `sqrt` scope.

x is a free variable in this definition.
| #

(define (sqrt x)
    (define (good-enough? guess) (< (abs (- (square guess) x)) 0.001))
    (define (improve guess) (average guess (/ x guess)))
    (define (sqrt-iter guess)
        (if (good-enough? guess)
            guess
            (sqrt-iter (improve guess))))
    (sqrt-iter 1.0))
