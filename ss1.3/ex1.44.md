- smoothing in signal processing
- f: function
- dx: some small number
- smoothed verion of f
  - average of f(x - dx), f(x), f(x + dx)
- Q1: write procedure `smooth`
  - returns: procedure computes the smoothed f
  - Q2: show how to generate the n-fold smoothed function with `smooth` and `repeated`

```s
(define (smooth f dx)
  (lambda (x)
    (/ (+ f(x - dx) f(x) f(x + dx)) 3)))
```