
- implement representation for rectangles
  - implement procedures
    - to calc perimeter
    - to calc area

```s
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)
```

```s
(define make-rect cons)
(define top-rect car)
(define side-rect cdr)

(define (length seg)
  (define (square x) (* x x))
  (let ((st (start-segment seg))
        (ed (end-segment seg)))
    (let ((stx (x-point st))
          (sty (y-point st))
          (edx (x-point ed))
          (edy (y-point ed)))
      (let ((len-x (abs (- stx edx)))
            (len-y (abs (- sty edy))))
        (sqrt (+ (square len-x) (square len-y)))))))

(define (perimeter rect)
  (let ((top (top-rect rect))
        (side (side-rect rect)))
    (* 2 (+ (length top) (length side)))))

(define (area rect)
  (let ((top (top-rect rect))
        (side (side-rect rect)))
    (* (length top) (length side))))

(define (gen-rect ltx lty rtx rty lbx lby)
  (let ((lt (make-point ltx lty))
        (rt (make-point rtx rty))
        (lb (make-point lbx lby)))
    (let ((top (make-segment lt rt))
          (side (make-segment lb lb)))
      (make-rect top sode))))
```
