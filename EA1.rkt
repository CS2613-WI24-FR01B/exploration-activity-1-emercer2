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

#|(define (assessWin boardMatrix)
  ;check for win, tie, or unfinished
  (display 0)
)

(define (placePiece player x ylist)
  ;draw peice at postion x y
  (underlay/xy (rectangle 470 445 "solid" "red") 25 50 board)

)

(define (game player ylist boardMatrix)
  ;draw arrow where cursor hovers
  ;collect x from where is clicked
  (define x 0)
  (animate (placePiece player x ylist));draw set peice
  ;(lst-set!);set ylist at x +1
  (cond
    [(not (equal? (assessWin boardMatrix) "0")) (assessWin boardMatrix)];return winning team "r", "y", or "0"
    [(equal? player "red") (game "yellow" ylist)];switch to other player
    [(equal? player "yellow") (game "yellow" ylist)]
  )
)|#


(animate createBoard)
;(game "red" '(0 0 0 0 0 0 0) '('(0 0 0 0 0 0) '(0 0 0 0 0 0) '(0 0 0 0 0 0) '(0 0 0 0 0 0) '(0 0 0 0 0 0) '(0 0 0 0 0 0)'(0 0 0 0 0 0)))