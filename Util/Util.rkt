#lang racket

(provide sum)

(define sum
  (lambda (ls)
    (foldl + 0 ls)))