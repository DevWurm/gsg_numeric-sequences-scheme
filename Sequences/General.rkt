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

(define partial-sum-sequence
  (lambda (seq)
    (let
        ; Creating an infinite list of functions which sum the first n elements of a sequence,
        ; with n starting by 1.
        ((sum-functions (stream-map
                         (lambda (n) (lambda (s) (sum-until n s)))
                         natural-numbers)))
      
      ; Creating the infinite list of results of the sum-functions functions applied to the
      ; provided sequence. This list is equivalent to the partial sum sequence of the provided
      ; sequence.
      (stream-map (lambda (f) (f seq)) sum-functions))))