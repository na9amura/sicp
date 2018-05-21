#|
            (1, 1)
         (2, 1) (2, 2)
      (3, 1) (3, 2) (3, 3)
   (4, 1) (4, 2) (4, 3) (4, 4)  
(5, 1) (5, 2) (5, 3) (5, 4) (5, 5)
|#

(define (pascal row col)
  ; (print (format "row = ~a, col = ~a" row col))(newline)
  (cond
    ((or (= row 1) (= col 1) (= col row)) 1)
    (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))
  )
)
