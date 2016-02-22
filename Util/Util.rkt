#lang racket

(require "../Streams/Streams.rkt")

(provide sum)
(provide foldl1)
(provide minimum)
(provide maximum)
(provide stream-zip-with)
(provide zip-with)

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

(define stream-zip-with
  (lambda (f stm1 stm2)
    (stream-cons
     (f (stream-car stm1) (stream-car stm2))
     (stream-zip-with f (stream-cdr stm1) (stream-cdr stm2)))))