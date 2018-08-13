- f: numerical function
- n: positive integer
- returns the procedure that computes the n-th application of f

```s
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (display "x in square: ")(display x)(newline)
  (* x x))

(define (repeated f n)
  (define (iter f n)
    (display "n in iter: ")(display n)(newline)
    (if (= n 1)
        f
        (iter (compose f f) (- n 1))))
  (lambda (x) ((iter f n) x)))
((repeated square 2) 5)
```