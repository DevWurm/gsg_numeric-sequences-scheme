#lang racket

(require "../Streams/Streams.rkt")
(require "../Util/Util.rkt")

(provide recSequence)
(provide expSequence)

(define recSequence
  (lambda (a0 f)
    (stream-cons a0 (f (recSequence a0 f)))))

(define expSequence
  (lambda (f)
    (stream-map f natural-numbers)))

(define sum-until
  (lambda (n stm)
    (sum (stream-take n stm))))