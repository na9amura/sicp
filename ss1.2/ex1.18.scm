(define (double a)
  (* a 2))

(define (halve a)
  (if (= (modulo a 2) 0)
    (/ a 2)
    a))

(define (multi-iter a count acc)
  (cond
    ((= count 0) acc)
    ((even? count) (multi-iter (double a) (halve count) acc))
    (else (multi-iter a (- count 1) (+ acc a)))))

(define (multi a b) (multi-iter a b 0))
