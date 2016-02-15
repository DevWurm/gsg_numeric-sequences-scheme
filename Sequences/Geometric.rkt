#lang racket

(require "General.rkt")

(provide rec-geo-sequence)
(provide exp-geo-sequence)

(define rec-geo-sequence
  (lambda (a0 q)
    (rec-sequence a0 (lambda (n) (* n q)))))

(define exp-geo-sequence
  (lambda (a0 q)
    (exp-sequence (lambda (n) (* a0 (expt q (- n 1)))))))