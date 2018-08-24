## define a better version of make-rat
- normalize the sign
  - n < 0 && d < 0
    - both n and d are positive
  - (n < 0 && d >= 0) || (n >= 0 && d < 0)
    - only numerator is negative

```s
(define (make-rat n d)
  (if (< (* n d) 0)
      (cons (* -1 (abs n)) (abs d))
      (cons (abs n) (abs d))))
```
