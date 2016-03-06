#lang racket

(require "Sequence.rkt")
(require "../Sequences/Special.rkt")

(provide special-menue)

(define special-menue
  (lambda ()
    (writeln "Spezielle Zahlenfolgen ausgeben")
    (writeln "<1> Folge gs1")
    (writeln "<2> Folge gs2")
    (writeln "<3> Folge z")
    (writeln "<4> Folge f")
    (writeln "<5> Beenden")
    (write "Auswahl: ")
    (define option (read))
    (newline)
    (define state (handle-option option))
    (if (eq? state "Redo")
        (special-menue)
        (void))))

(define handle-option
  (lambda (option)
    (case option
      ((1) (begin
             (output-sequence-menue gs1)
             "Redo"))
      ((2) (begin
             (output-sequence-menue gs2)
             "Redo"))
      ((3) (begin
             (output-sequence-menue z)
             "Redo"))
      ((4) (begin
             (output-sequence-menue f)
             "Redo"))
      (else "Done"))))
      