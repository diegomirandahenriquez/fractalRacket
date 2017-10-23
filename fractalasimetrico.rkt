#lang racket
; algoritmo recursivo de fractal circular asimetrico
(require 2htdp/image)
(define CUT-OFF 5)
(define CIRCLE-MODE "outline")
;funcion recursiva
(define (circle-fractal size colour simetria) ;modificada
  (define full-circle (circle size CIRCLE-MODE colour))
  (cond [(<= size CUT-OFF) full-circle]
        [else
         (define (half-circle o) (circle-fractal (* size o) colour simetria)) ;modificada
         (overlay/align "middle" "middle" 
                        full-circle
                        (beside (half-circle simetria) (half-circle (- 1 simetria))))])) ;modificada
; imprime en consola 3 fractales con distintas simetrias.
(beside 
(circle-fractal 100 "black" 0.7)
(circle-fractal 100 "black" 0.5)
(circle-fractal 100 "black" 0.3))