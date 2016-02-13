#lang racket

(require "../Streams/Streams.rkt")
(require "../Util/Util.rkt")

(provide rec-sequence)
(provide exp-sequence)
(provide sum-until)

(define rec-sequence
  (lambda (a0 f)
    (stream-cons a0 (f (rec-sequence a0 f)))))

(define exp-sequence
  (lambda (f)
    (stream-map f natural-numbers)))

(define sum-until
  (lambda (n stm)
    (sum (stream-take n stm))))