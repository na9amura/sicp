(define (square x) (* x x))

(define (cube x) (* x x x))

(define (improve-cube guess x)
  (/ 
    (+ 
      (/ x (square guess))
      (* 2 guess))
    3))

(define (cube-root-iter prev guess x)
  (if (good-enough-cube? prev guess)
    guess
    (cube-root-iter guess (improve-cube guess x) x)))

(define (good-enough-cube? prev guess)
  (write
    (format
      "prev: ~a, guess: ~a, diff: ~a, degree: ~a" 
      prev
      guess
      (~r (- guess prev) #:precision 10)
      (~r (/ (abs (- prev guess)) guess) #:precision 10)))
  (newline)
  (< (/ (abs (- prev guess)) guess) 0.0001))

(define (cube-root x) (cube-root-iter 10.0 1.0 x))
