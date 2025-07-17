(define-module (util)
  :export (center-x
           center-y))

(use-modules (chickadee))

;; ==============================================
;; Utility functions
;; ==============================================
(define (center-x window w)
  (- (/ (window-width window) 2.0) (/ w 2.0)))

(define (center-y window h)
  (- (/ (window-height window) 2.0) (/ h 2.0)))
