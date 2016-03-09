#lang racket

(require "General.rkt")
(require "../Streams/Streams.rkt")
(require "../Util/Util.rkt")

(provide gs1)
(provide gs2)
(provide z)
(provide f)

(define gs1 (rec-sequence 1 (lambda (n0) (/ 1 (+ 1 n0)))))

(define gs2 (rec-sequence (/ 1 (sqrt 2)) (lambda (n0) (/ 1 (sqrt (+ 2 n0))))))

(define fac
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((> n 0) (* n (fac (- n 1))))
      (else (error "fac is only defined for Integers bigger than 0")))))

(define z (exp-sequence (lambda (n) (/ 1 (fac n)))))

(define fibs (stream-cons 1 (stream-cons 1 (stream-zip-with + fibs (stream-cdr fibs)))))

(define f (exp-sequence (lambda (n) (let ((zero-based-n (- n 1)))
                                      (/ (!! fibs zero-based-n) (!! fibs n))))))