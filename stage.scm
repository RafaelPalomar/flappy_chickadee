(define-module (stage)
  #:export (<stage>
            stage-load
            stage-draw
            stage-update
            stage-key-press
            stage-scripts))

(use-modules (chickadee)
             (oop goops))

;; =========================================
;; Class stage -----------------------------
;; =========================================

;; Define a stage class with callbacks stored in slots.
(define-class <stage> ()
  (load         #:accessor stage-load         #:init-keyword #:load         #:init-value (lambda () #f))
  (draw         #:accessor stage-draw         #:init-keyword #:draw         #:init-value (lambda (alpha) #f))
  (update       #:accessor stage-update       #:init-keyword #:update       #:init-value (lambda (dt) #f))
  (key-press    #:accessor stage-key-press    #:init-keyword #:key-press    #:init-value (lambda (k m r) #t))
  (scripts      #:accessor stage-scripts      #:init-keyword #:scripts      #:init-value '()))
