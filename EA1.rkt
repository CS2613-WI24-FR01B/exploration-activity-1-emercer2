#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (createBoard time)
  (displayln time)
  (underlay/xy (rectangle 470 445 "solid" "black") 25 50 board))
 
(define board
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
 
(animate createBoard)