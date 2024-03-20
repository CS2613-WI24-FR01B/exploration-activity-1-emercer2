#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require lang/posn)

(define-struct text-state [text position color])


(define (draw-state state)
  (place-image
   (text (text-state-text state)
         25
         (text-state-color state))
   (posn-x (text-state-position state))
   (posn-y (text-state-position state))
   bg))

(define bg
  (underlay/xy (rectangle 470 445 "solid" "black") 25 50 board))
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset (underlay/offset (underlay/offset (underlay/offset (underlay/offset
     (underlay/offset
      (rectangle 430 370 "solid" "blue")
      -180 -150 (circle 25 "solid" "black")) -180 -90 (circle 25 "solid" "black")) -180 -30 (circle 25 "solid" "black")) -180 30 (circle 25 "solid" "black")) -180 90 (circle 25 "solid" "black"))  -180 150 (circle 25 "solid" "black"))
      -120 -150 (circle 25 "solid" "black")) -120 -90 (circle 25 "solid" "black")) -120 -30 (circle 25 "solid" "black")) -120 30 (circle 25 "solid" "black")) -120 90 (circle 25 "solid" "black"))  -120 150 (circle 25 "solid" "black"))
      -60 -150 (circle 25 "solid" "black")) -60 -90 (circle 25 "solid" "black")) -60 -30 (circle 25 "solid" "black")) -60 30 (circle 25 "solid" "black")) -60 90 (circle 25 "solid" "black"))  -60 150 (circle 25 "solid" "black"))
      0 -150 (circle 25 "solid" "black")) 0 -90 (circle 25 "solid" "black")) 0 -30 (circle 25 "solid" "black")) 0 30 (circle 25 "solid" "black")) 0 90 (circle 25 "solid" "black"))  0 150 (circle 25 "solid" "black"))
      60 -150 (circle 25 "solid" "black")) 60 -90 (circle 25 "solid" "black")) 60 -30 (circle 25 "solid" "black")) 60 30 (circle 25 "solid" "black")) 60 90 (circle 25 "solid" "black"))  60 150 (circle 25 "solid" "black"))
      120 -150 (circle 25 "solid" "black")) 120 -90 (circle 25 "solid" "black")) 120 -30 (circle 25 "solid" "black")) 120 30 (circle 25 "solid" "black")) 120 90 (circle 25 "solid" "black"))  120 150 (circle 25 "solid" "black"))
      180 -150 (circle 25 "solid" "black")) 180 -90 (circle 25 "solid" "black")) 180 -30 (circle 25 "solid" "black")) 180 30 (circle 25 "solid" "black")) 180 90 (circle 25 "solid" "black"))  180 150 (circle 25 "solid" "black"))
  
)


(define (connect4 text)
  (big-bang (make-text-state text (make-posn 50 50) "yellow")
    [to-draw draw-state]
    [on-mouse mouse-fn]))

(define (mouse-fn state x y event)
  (if (string=? "drag" event)
      (make-text-state
       (text-state-text state)
       (make-posn x y)
       (text-state-color state))
      state))

(connect4 "FooBar")

;https://stackoverflow.com/questions/72290837/how-to-use-on-mouse-function-in-racket