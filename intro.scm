(define-module (intro)
  :export (intro-stage)
  )

(use-modules (oop goops)
             (stage)
             (chickadee)
             (chickadee graphics color)
             (chickadee graphics texture)
             (chickadee graphics sprite)
             (chickadee graphics text)
             (chickadee math vector)
             (chickadee scripting)
             (common)
             (util)
             (ice-9 match))

;; ==============================================
;; Resources -----------------------------------
;; ==============================================
(define intro-text-color (make-color 1.0 1.0 1.0))

;; ==============================================
;; Functions-----------------------------------
;; ==============================================
(define (intro-text-update-alpha x)
  (set! intro-text-color (make-color
                            (color-r intro-text-color)
                            (color-g intro-text-color)
                            (color-b intro-text-color)
                            x)))

;; ==============================================
;; intro-stage object
;; ==============================================
(define intro-stage
  (make <stage>
    #:load
    (lambda ()
      (set! chickadee-sprite (load-image "img/chickadee.png"))
      (set! intro-text-color (make-color 1.0 1.0 1.0 1.0)))

    ;; ==========================================
    ;; draw ------------------------------------
    ;; ==========================================
    #:draw
    (lambda (alpha)
      (draw-sprite chickadee-sprite
        (vec2 (center-x (current-window) (texture-width chickadee-sprite))
              (center-y (current-window) (texture-height chickadee-sprite))))
      (draw-text "- Press ENTER key to play -"
        (vec2 (center-x (current-window) 400)
              (center-y (current-window) 300))
        #:scale (vec2 2 2)
        #:color intro-text-color))

    ;; ==========================================
    ;; update ------------------------------------
    ;; ==========================================
    #:update
    (lambda (dt)
      (update-agenda dt))

    ;; ==========================================
    ;; key-press --------------------------------
    ;; ==========================================
    #:key-press
    (lambda (key modifiers repeat?)
      (match key
        ('return
         ;; Possibly switch to “game” stage by setting some variable or
         ;; pushing a new stage.  For now just prints:
         (format #t "Switching to game stage...\n")
         #t)
        ('q (abort-game))
        (_ #t)))

    ;; ==========================================
    ;; scripts ----------------------------------
    ;; ==========================================
    #:scripts
    (list
     (let ((start     0.0)
           (end       1.0)
           (duration  1.0))
       (script
        (while #t
          (tween duration start end   intro-text-update-alpha)
          (tween duration end   start intro-text-update-alpha)))))))
