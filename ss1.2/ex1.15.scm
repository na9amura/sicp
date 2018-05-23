(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; how many times `p` applied?
#|
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45)))
(p (p (p (p (sine 0.15)))
(p (p (p (p (p (sine 0.05))))

=> 5 times
|#

; what is the order of growth?
; 1. spaces 
;   Requires O(1) as this procedure is tail recursive.

; 2. steps
;   This procedure repeats (a * (1/3  ^ k)) times for 'k' fills this condition
;   a / (3 ^ k) <= 0.1 < a / (3 ^ (k - 1))

;   log(3) (a / (3 ^ k))      <= log(3) 0.1 < log(3) (a / (3 ^ (k - 1)))
;   log(3) a - log(3) (3 ^ k) <= log(3) 0.1 < log(3) a - log(3) (3 ^ (k - 1))
;   log(3) a - k * log(3) 3   <= log(3) 0.1 < log(3) a - (k - 1) * log(3) 3
;   log(3) a - k              <= log(3) 0.1 < log(3) a - k + 1
;   log(3) a <= log(3) 0.1 + k < log(3) a + 1
;   log(3) a - log(3) 0.1 <= k < log(3) a - log(3) 0.1 + 1
;   log(3) a - log(3) 0.1 <= k < log(3) a - log(3) 0.1 + 1

;   k ≈ log(3) a  log(3) 0.1
;   => O(log n)
