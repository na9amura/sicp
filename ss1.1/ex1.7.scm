(define (sqrt-iter prev guess x)
  (if (good-enough? prev guess)
    guess
    (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; 変化量のが 0.001 未満ならOK
(define (good-enough? prev guess)
  (write
    (format
      "prev: ~a, guess: ~a, diff: ~a, degree: ~a" 
      prev
      guess
      (~r (- guess prev) #:precision 10)
      (~r (/ (abs (- guess prev)) guess) #:precision 10)))
  (newline)
  (< (/ (abs (- guess prev)) guess) 0.0001))

(define (sqrt x)
  (sqrt-iter 10.0 1.0 x))
