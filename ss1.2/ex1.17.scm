(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))

(#|
This takes linear grows of steps.
Implement multiplication procedure which uses a logarithmic number of steps.

(* a b)
(+ a (* a (- b 1)))
(+ a (+ a (* a (- b 2))))
(+ a (+ a (+ a (* a (- b 3)))))
...
(+ a (+ a (+ a (+ a ... (+ a (+ 0))...))))

(* 3 5)
(+ 3 (* 3 4))
(+ 3 (+ 3 (* 3 3)))
(+ 3 (+ 3 (+ 3 (* 3 2))))
(+ 3 (+ 3 (+ 3 (+ 3 (* 3 1)))))
(+ 3 (+ 3 (+ 3 (+ 3 (+ 3 (* 3 0))))))
(+ 3 (+ 3 (+ 3 (+ 3 (+ 3 0)))))
(+ 3 (+ 3 (+ 3 (+ 3 3))))
(+ 3 (+ 3 (+ 3 6)))
(+ 3 (+ 3 9))
(+ 3 12)
(15)

(* 3 8)
(* (double 3) (halve 8))
(* 6 4)
(* (double 6) (halve 4))
(* 12 2)
(* (double 12 (halve 2)))
(* 24 1)
(+ 24 (* 24 0))
(+ 24 0)
(24)
#|)

(define (double a)
  (* a 2))

(define (halve a)
  (if (= (modulo a 2) 0)
    (/ a 2)
    a))

(define (multi a b)
  (cond 
    ((= b 0) 0)
    ((= (modulo b 2) 0) (multi (double a) (halve b)))
    (else (+ a (multi a (- b 1))))))
