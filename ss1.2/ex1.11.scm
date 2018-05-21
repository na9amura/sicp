; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ 
        (f (- n 1))
        (* 2 (f (- n 2)))
        (* 3 (f (- n 3)))
      )
  )
)

; iterative process
#|
(f 5)
(+ (* 1 (f 4)) (* 2 (f 3)) (* 3 (f 2)))
(+ 
  (* 1 (+ (* 1 (f 3)) (* 2 (f 2)) (* 3 (f 1)))) 
  (* 2 (+ (* 1 (f 2) (* 2 (f 1) (* 3 f 0))))) 
  (* 3 (f 2))
)
|#


#|
f(10) = f(9) + 2f(8) + 3f(7)

a <= f(9) = f(8) + 2f(7) + 3f(6)
b <= f(8) = f(7) + 2f(6) + 3f(5)
c <= f(7) = f(6) + 2f(5) + 3f(4)

f(9) = b + 2c + 

この結果をf(10)に適用

f(10) = a + 2b + 3c

a = b + 2c + 3f(1) 
|#

#|
f(0) => 0
f(1) => 1
f(2) => 2
f(3) = f(2) + 2f(1) + 3f(0)
     = 2 + 2 * 1 + 3 * 0
     = 4
f(4) = f(3) + 2f(2) + 3f(1)
     = 4 + 2 * 2 + 3 * 1
     = 4 + 4 + 3
     = 11
f(5) = f(4) + 2f(3) + 3f(2)
     = 11 + 2 * 4 + 3 * 2
     = 11 + 8 + 6
     = 25

...
|#

(define (f n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (iter 0 1 2 n)
)

(f 5)
(iter 0 1 2 5)
(iter 1 2 (+ 2 2 0) 4)
(iter 1 2 4 4)
(iter 2 4 (+ 4 4 3) 3)
(iter 2 4 11 3)
(iter 4 11 (+ 11 8 6) 2)
(iter 4 11 25 2)
(iter 11 25 (+ 25 22 12) 1)
(iter 11 25 59 1)
(iter 25 59 (+ 59 50 33) 0)
(iter 25 59 142 0)
(25)

; (iter a b c count)
; a => 回答候補
; b => f(an + 1), 計算用に保持している
; c => f(an + 2), 計算用に保持している

; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)
; n if n < 3
; を以下のように読み換える

; f(x) = f(x + 2) + 2f(x + 1) + 3f(x)
; f(x + 3) if x = 0

(define (f n)
  (define (iter a b c count)
    (cond (< count 3)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (iter 0 1 2 n)
)