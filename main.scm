(use-modules (chickadee)
             (chickadee graphics sprite)
             (ice-9 pretty-print)
             (ice-9 match)
             (intro)
             (common)
             (util)
             (stage)
             )


(define stages (list intro-stage))

(define (load)
  ((stage-load (car stages))))

(define (draw alpha)
  ((stage-draw (car stages)) alpha))

(define (update dt)
  ((stage-update (car stages)) dt))

(define (key-press key modifiers repeat?)
  ((stage-key-press (car stages)) key modifiers repeat?))

(set-window-fullscreen! (current-window) #t)
(load)
