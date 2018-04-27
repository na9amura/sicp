(define (improve-cube guess x)
  (/ 
    (+ 
      (/ x (square guess))
      (* 2 guess))
    3))


(define (cube-root-iter guess x)
  (display guess) (newline) (display x) (newline)
  (if good-enough-cube? guess x)
    guess
    (cube-root-iter (improve-cube guess x) x))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x) (* x x x))

(define (cube-root x) (cube-root-iter 1.0 x))