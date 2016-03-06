#lang racket

(require "Sequence.rkt")
(require "../Sequences/Arithmetic.rkt")
(require "../Sequences/Geometric.rkt")

(define ar-geo-menue
  (lambda ()
    (begin
      (writeln "Arithemtische / Geometrische Folgen")
      (writeln "<1> Arithmetische Folge")
      (writeln "<2> Geometrische Folge")
      (writeln "<3> Beenden")
      (write "Auswahl: ")
      (define option (read))
      (newline)
      (define state (handle-option option))
      (if (eq? state "Redo")
          (ar-geo-menue)
          (void)))))

(define handle-option
  (lambda (option)
    (case option
      ((1) (begin
             (output-ar-sequence)
             "Redo"))
      ((2) (begin
             (output-geo-sequence)
             "Redo"))
      (else "Done"))))

(define output-ar-sequence
  (lambda ()
    (begin
      (writeln "Arithmetische Folge")
      (writeln "<1> Rekursive Definition")
      (writeln "<2> Explizite Definition")
      (writeln "<3> Beenden")
      (write "Auswahl: ")
      (define option (read))
      (newline)
      (case option
        ((1) (output-rec-ar-sequence))
        ((2) (output-exp-ar-sequence))
        (else (void))))))

(define output-rec-ar-sequence
  (lambda ()
    (begin
      (writeln "Rekursive Arithmetische Folge")
      (write "Parameter a0: ")
      (define a0 (read))
      (write "Parameter p: ")
      (define p (read))
      (output-sequence-menue (rec-ar-sequence a0 p))
      (newline))))
      
(define output-exp-ar-sequence
  (lambda ()
    (begin
      (writeln "Rekursive Arithmetische Folge")
      (write "Parameter a0: ")
      (define a0 (read))
      (write "Parameter p: ")
      (define p (read))
      (output-sequence-menue (exp-ar-sequence a0 p))
      (newline))))

(define output-geo-sequence
  (lambda ()
    (begin
      (writeln "Geometrische Folge")
      (writeln "<1> Rekursive Definition")
      (writeln "<2> Explizite Definition")
      (writeln "<3> Beenden")
      (write "Auswahl: ")
      (define option (read))
      (newline)
      (case option
        ((1) (output-rec-geo-sequence))
        ((2) (output-exp-geo-sequence))
        (else (void))))))

(define output-rec-geo-sequence
  (lambda ()
    (begin
      (writeln "Rekursive Geometrische Folge")
      (write "Parameter a0: ")
      (define a0 (read))
      (write "Parameter q: ")
      (define q (read))
      (output-sequence-menue (rec-geo-sequence a0 q))
      (newline))))
      
(define output-exp-geo-sequence
  (lambda ()
    (begin
      (writeln "Rekursive Geometrische Folge")
      (write "Parameter a0: ")
      (define a0 (read))
      (write "Parameter q: ")
      (define q (read))
      (output-sequence-menue (exp-geo-sequence a0 q))
      (newline))))


















      
               