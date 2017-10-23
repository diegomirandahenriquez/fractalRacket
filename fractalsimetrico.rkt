#lang racket
; algoritmo recursivo de fractal circular simetrico
(require 2htdp/image)
(define CUT-OFF 5)
(define CIRCLE-MODE "outline")
;funcion recursiva
(define (circle-fractal size colour)
  (define full-circle (circle size CIRCLE-MODE colour))
  (cond [(<= size CUT-OFF) full-circle]
        [else (define half-circle (circle-fractal (/ size 2) colour)) 
         (overlay/align "middle" "middle" 
                        full-circle
                        (beside half-circle half-circle))]))
; imprime 2 fractales uno negro y otro verde
(circle-fractal 100 "black")
(circle-fractal 140 "green")