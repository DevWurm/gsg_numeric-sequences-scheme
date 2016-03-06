#lang racket

(require "ArGeo.rkt")
(require "Special.rkt")

(provide top-menue)

(define top-menue
  (lambda ()
    (begin
      (writeln "Zahlenfolgen")
      (writeln "<1> Operationen mit arithmetischen und geometrischen Zahlenfolgen")
      (writeln "<2> Operationen mit speziellen Zahlenfolgen")
      (writeln "<3> Beenden")
      (write "Auswahl: ")
      (define option (read))
      (newline)
      (define state (handle-option option))
      (if (eq? state "Redo")
          (top-menue)
          (void)))))

(define handle-option
  (lambda (option)
    (case option
      ((1) (begin
             (ar-geo-menue)
             "Redo"))
      ((2) (begin
             (special-menue)
             "Redo"))
      (else "Done"))))