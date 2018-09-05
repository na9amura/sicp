
- representing line segments in a plane
  - segment is represented as a pair of points
  - define a constructor `make-segment`
  - define selectors `start-segment`, `end-segment`
- a point can be represent as x, y coordinate
  - define a constructor `make-point`
  - define selectors `x-point`, `y-point`
  - define a procedure `midpoint-segment`
    - takes a line segment
    - returns its midpoint as point
  - use `print-points`
    ```s
    (define (print-point p)
      (newline)
      (display "(")
      (display (x-point p))
      (display ", ")
      (display (y-point p))
      (display ")"))
    ```

```s
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define (avg a b) (/ (+ a b) 2))

(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point
      (abs (avg (x-point start) (x-point end)))
      (abs (avg (y-point start) (y-point end))))))

(define (test sx sy ex ey)
  (let ((st (make-point sx sy))
        (ed (make-point ex ey)))
    (print-point (midpoint-segment (make-segment st ed)))))

(define (test sx sy ex ey)
  (let ((st (make-point sx sy))
        (ed (make-point ex ey)))
    (let ((seg (make-segment st ed)))
      (print-point (midpoint-segment seg)))))
```
