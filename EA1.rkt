#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require lang/posn)

(define-struct indicator [position])
(define-struct peice [position])

(define (draw-state state)
  (place-image
   (isosceles-triangle 30 300 "solid" "White")
   (posn-x (indicator-position state))
   (posn-y (indicator-position state))
   bg))

(define bg
  (underlay/xy (rectangle 470 445 "solid" "black") 25 50
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
      (rectangle 430 370 "solid" "blue")
      -180 -150 (circle 25 "solid" "black")) -180 -90 (circle 25 "solid" "black")) -180 -30 (circle 25 "solid" "black")) -180 30 (circle 25 "solid" "black")) -180 90 (circle 25 "solid" "black"))  -180 150 (circle 25 "solid" "black"))
      -120 -150 (circle 25 "solid" "black")) -120 -90 (circle 25 "solid" "black")) -120 -30 (circle 25 "solid" "black")) -120 30 (circle 25 "solid" "black")) -120 90 (circle 25 "solid" "black"))  -120 150 (circle 25 "solid" "black"))
      -60 -150 (circle 25 "solid" "black")) -60 -90 (circle 25 "solid" "black")) -60 -30 (circle 25 "solid" "black")) -60 30 (circle 25 "solid" "black")) -60 90 (circle 25 "solid" "black"))  -60 150 (circle 25 "solid" "black"))
      0 -150 (circle 25 "solid" "black")) 0 -90 (circle 25 "solid" "black")) 0 -30 (circle 25 "solid" "black")) 0 30 (circle 25 "solid" "black")) 0 90 (circle 25 "solid" "black"))  0 150 (circle 25 "solid" "black"))
      60 -150 (circle 25 "solid" "black")) 60 -90 (circle 25 "solid" "black")) 60 -30 (circle 25 "solid" "black")) 60 30 (circle 25 "solid" "black")) 60 90 (circle 25 "solid" "black"))  60 150 (circle 25 "solid" "black"))
      120 -150 (circle 25 "solid" "black")) 120 -90 (circle 25 "solid" "black")) 120 -30 (circle 25 "solid" "black")) 120 30 (circle 25 "solid" "black")) 120 90 (circle 25 "solid" "black"))  120 150 (circle 25 "solid" "black"))
      180 -150 (circle 25 "solid" "black")) 180 -90 (circle 25 "solid" "black")) 180 -30 (circle 25 "solid" "black")) 180 30 (circle 25 "solid" "black")) 180 90 (circle 25 "solid" "black"))  180 150 (circle 25 "solid" "black"))
  )
)


(define (connect4)
  (big-bang (make-indicator (make-posn 60 20))
    [to-draw draw-state]
    [on-mouse mouse-fn]))

(define (mouse-fn state x y event)
  ;left 0 right 500
  (define setx x)
  (cond
    [(< x 90) (set! setx 60)]
    [(and (< x 150) (> x 90)) (set! setx 120)]
    [(and (< x 210) (> x 150)) (set! setx 180)]
    [(and (< x 270) (> x 210)) (set! setx 240)]
    [(and (< x 330) (> x 270)) (set! setx 300)]
    [(and (< x 390) (> x 330)) (set! setx 360)]
    [(> x 390) (set! setx 420)]
  )
  
  (if (string=? "move" event)
      (make-indicator (make-posn setx 20)) ;True
      state ; False
  )
)

(connect4)

;https://stackoverflow.com/questions/72290837/how-to-use-on-mouse-function-in-racket