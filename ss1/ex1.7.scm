(define (sqrt-iter prev guess x)
  (if (good-enough? prev guess)
    guess
    (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; 変化量が 0.001 未満ならOK
(define (good-enough? prev guess)
  (< (abs (- guess prev)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.1 1.0 x))
