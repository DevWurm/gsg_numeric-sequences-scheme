#lang racket

(provide sum)
(provide foldl1)
(provide minimum)
(provide maximum)

(define sum
  (lambda (ls)
    (foldl + 0 ls)))

(define foldl1
  (lambda (f ls)
    (foldl f (car ls) (cdr ls))))

(define minimum
  (lambda (ls)
    (foldl1 (lambda (acc n) (if (n < acc) n acc)) ls)))

(define maximum
  (lambda (ls)
    (foldl1 (lambda (acc n) (if (n > acc) n acc)) ls)))