(define (fib n) 
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond 
    ((= count 0) b)
    ((even? count) (fib-iter a 
                             b
                             ? ; p' 
                             ? ; q'
                             (/ count 2)))
    (else (fib-iter (+ (* b q) (* a q) (* a p))
                    (+ (* b p) (* a q))
                    p
                    q
                    (- count 1)))))

(#|
T = { 
  a <- a + b
  b <- a  
}

T ^ n = [Fib(n + 1), Fib(n)]

{
  a <- bq + aq + ap
  b <- bp + aq
}

- think calculate step by step, do not distinct counter is even or odd
(fib-iter 1 0 0 1 5)
                      (fib-iter (+ (* 0 1) (* 1 1) (* 1 0)) (+ (* 0 0) (* 1 1)) 0 1 (- 5 1))
                      (fib-iter (+ 0 1 0) (+ 0 1) 0 1 4)
(fib-iter 1 1 0 1 4)
                      (fib-iter (+ (* 1 1) (* 1 1) (* 1 0)) (+ (* 1 0) (* 1 1)) 0 1 (- 4 1))
                      (fib-iter (+ 1 1 0) (+ 0 1) 0 1 3)
(fib-iter 2 1 0 1 3)
                      (fib-iter (+ (* 1 1) (* 2 1) (* 2 0)) (+ (* 1 0) (* 2 1)) 0 1 (- 3 1))
                      (fib-iter (+ 1 2 0) (+ 0 2) 0 1 2)
(fib-iter 3 2 0 1 2)
                      (fib-iter (+ (* 2 1) (* 3 1) (* 3 0)) (+ (* 2 0) (* 3 1)) 0 1 (- 2 1))
                      (fib-iter (+ 2 3 0) (+ 0 3) 0 1 1)
(fib-iter 5 3 0 1 1)
                      (fib-iter (+ (* 3 1) (* 5 1) (* 5 0)) (+ (* 3 0) (* 5 1)) 0 1 (- 1 1))
                      (fib-iter (+ 3 5 0) (+ 0 5) 0 1 0)
(fib-iter 8 5 0 1 0)


- if this procedure has implemented, arguments change like this.
(fib-iter  1  0  0  1 7)
(fib-iter  1  1  0  1 6)
(fib-iter  1  1 p1 q1 3)
(fib-iter  5  3 p1 q1 2)
(fib-iter  5  3 p2 q2 1)
(fib-iter 21 13 p2 q2 0)

- for p1, q1
{
  1 * q1 + 1 * q1 + 1 * p1 = 5 
  1 * q1 + 1 * p1 = 3
}

{
  2q1 + p1 = 5
  p1 = 3 - q1
}

2q1 + 3 - q1 = 5
q1 = 2
p1 = 1 

- for p2, q2
{
  3 * q2 + 5 * q2 + 5 * p2 = 21
  3 * q2 + 5 * p2 = 13
}

{
  8q2 + 5p2 = 21
  p2 = (13 - 3q2) / 5
}

8q2 + 13 - 3q2 = 21
5q2 = 8
q2 = 8 / 5
p2 = (13 - 3 * (8 / 5)) / 5
   = (13 - 24 / 5) / 5
   = ((65 - 24) / 5) / 5
   = 41 / 5 * 1 / 5
   = 41 / 25
#|)
