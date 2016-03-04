#lang racket

(require "../Sequences/General.rkt")
(require "../Streams/Streams.rkt")

(provide output-sequence-menue)

(define output-sequence-menue
  (lambda (seq)
    (begin
      (writeln "Folge ausgeben")
      (writeln "<1> Bestimmtes Element ausgeben")
      (writeln "<2> Bestimmte Anzahl von Elementen ausgeben")
      (writeln "<3> Summe einer bestimmten Anzahl von Elementen ausgeben")
      (writeln "<4> Grenzwert suchen")
      (writeln "<5> Partialsummenfolge bilden")
      (writeln "<6> Beenden")
      (write "Auswahl: ")
      (define option (read))
      (newline)
      (define state (perform-action seq option))
      (if (eq? state "Redo")
          (output-sequence-menue seq)
          (void)))))

(define perform-action
  (lambda (seq option)
    (case option
      ((1) (begin
             (output-element seq)
             "Redo"))
      ((2) (begin
             (output-range seq)
             "Redo"))
      ((3) (begin
             (output-sum seq)
             "Redo"))
      ((4) (begin
             (output-limit seq)
             "Redo"))
      ((5) (begin
             (output-partial-sum-sequence seq)
             "Redo"))
      (else "Done"))))

(define output-element
  (lambda (seq)
    (begin
      (write "Elementnummer: ")
      (define element (read))
      (writeln (!! seq element))
      (newline))))

(define output-range
  (lambda (seq)
    (begin
      (write "Anzahl von Elementen: ")
      (define ammount (read))
      (writeln (stream-take ammount seq))
      (newline))))

(define output-sum
  (lambda (seq)
    (begin
      (write "Anzahl von Elementen: ")
      (define ammount (read))
      (writeln (sum-until ammount seq))
      (newline))))

(define output-limit
  (lambda (seq)
    (begin
      (write "Größe der Epsilonumgebung: ")
      (define eps (read))
      (write "Minimale Anzahl von Elementen inerhalb der Epsilonumgebung: ")
      (define nf (read))
      (write "Maximale Anzahl an durchsuchten Elementen: ")
      (define nmax (read))
      (writeln (limit seq eps nf nmax))
      (newline))))

(define output-partial-sum-sequence
  (lambda (seq)
    (begin
      (writeln "Partialsummenfolge: ")
      (output-sequence-menue (partial-sum-sequence seq)))))