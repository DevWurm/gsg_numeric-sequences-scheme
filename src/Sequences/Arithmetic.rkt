#lang racket

(require "General.rkt")

(provide rec-ar-sequence)
(provide exp-ar-sequence)

(define rec-ar-sequence
  (lambda (a0 p)
    (rec-sequence a0 (lambda (n) (+ n p)))))

(define exp-ar-sequence
  (lambda (a0 p)
    (exp-sequence (lambda (n) (+ a0 (* p (- n 1)))))))