(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+  (cc amount
                     (- kinds-of-coins 1))
                  (cc (- amount (first-denomination kinds-of-coins))
                      kinds-of-coins)))))

(define (first-denomination kinds-of-conins)
  (cond ((= kinds-of-conins 1) 1)
        ((= kinds-of-conins 2) 5)
        ((= kinds-of-conins 3) 10)
        ((= kinds-of-conins 4) 25)
        ((= kinds-of-conins 5) 50)))

; tree
#|
(count-change 11)

                                                      (cc 11 5)


                                                  (cc 11 4) | (cc -39 5)
                                                                  0

                                        (cc 11 3) | (cc -14 4)
                                                        0

                                  (cc 11 2) | (cc 1 3)


                      (cc 11 1) | (cc 6 2)    (cc 1 2) | (cc -9 3)
                                                            0

      (cc 11 0) | (cc 10 1)   (cc 6 1) | (cc 1 2)  (cc 1 1) | (cc -4 2)
          0                                                        0

  (cc 10 0) | (cc 9 1)    (cc 6 0) | (cc 5 1)  (cc 1 1) | (cc -4 1)   (cc 1 0) | (cc 0 1)
      0                       0                               0           0          1

      (cc 9 0) | (cc 8 1)    (cc 5 0) | (cc 4 1)    (cc 1 0) | (cc 0 1)
          0                       0                     0           1

            (cc 8 0) | (cc 7 1)     (cc 4 0) | (cc 3 1)
                0                       0

                  (cc 7 0) | (cc 6 1)     (cc 3 0) | (cc 2 1)
                      0                       0

                      (cc 6 0) | (cc 5 1)         (cc 2 0) | (cc 1 1)
                          0                           0

                          (cc 5 0) | (cc 4 1)         (cc 1 0) | (cc 0 1)
                              0                           0           1

                              (cc 4 0) | (cc 3 1)
                                  0

                                  (cc 3 0) | (cc 2 1)
                                      0

                                      (cc 2 0) | (cc 1 1)
                                          0

                                          (cc 1 0) | (cc 0 1)
                                              0         1
|#

; orders of growth

; number of spaces
;   depends on max depth
;   => kind of coins decrease 5 to 1
;   => after kind of coins became 1, amount decreases n to 1
;   => n + 4
;   => orders of growth = O(n)


; number of processes
;   http://www.billthelizard.com/2009/12/sicp-exercise-114-counting-change.html

; 1. think with `(cc n 1)`

;             (cc (- n 1) 1)  < (cc (- n 2) 1)  < (cc (- n 3) 1)       (cc 0 1)
; (cc n 1)  <                                                     ... 
;             (cc n 0)          (cc (- n 1) 0)    (cc (- n 2) 0)       (cc 1 0)

;   (cc n 1) requires 2n + 1 processes


; 2. think with `(cc n 2)`

; when see only one side of tree, it requires n / 5 process, as n decreases 5 cent for each process.
; (cc n 2) - (cc (- n 5) 2) - (cc (- n 10) 2) ... (cc (- n 5 * k) 2)


; and see the other side, it is (cc n 1) subtree.

;                               (cc (- n 10) 2) ...
;             (cc (- n 5) 2) <  
; (cc n 2) <                    (cc (- n 5) 1) < ...
;             (cc n 1) < ...

; So, (cc n 1) subtree made (n / 5) times.
; This leads (n / 5) * (2n + 1) = 2/5n^2 + 1/5n.
; Then, order of growth is O(n^2)


; 3. think with  `(cc n 3)`

;                                                   ... (cc (- n 10 * k) 3)
;                                 (cc (- n 20) 3) < 
;             (cc (- n 10) 3) <  
; (cc n 3) <                      (cc (- n 10) 2) < ...
;             (cc n 2) < ...

; This process makes (cc n 2) subtree (n / 10) times
; => (n / 10) * (n / 5) * (2n + 1)
; => O(n^3)

; 4. think with  (cc n 4), (cc n 5) 
; (cc n 4) makes (cc n 3) subtree (n / 25) times, and (cc n 5) (cc n 4) subtree (n / 50) times.
; => (n / 50) * (n / 25) * (n / 10) * (n / 5) * (2n + 1)
; => O(n^5)
