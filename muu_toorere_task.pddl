(define (problem muu_toorere_task)
  (:domain muu_toorere)
  (:objects 
    green white
    g1 g2 g3 g4 w1 w2 w3 w4 
    pos0 pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8)

  (:init
    ;Define players are different
    (different green white)
    (different white green)
    ;Define player colors
    (player green) (player white)
    ; Initial positions of the pieces.
    (at g1 pos1) (at g2 pos2) (at g3 pos3) (at g4 pos4)
    (at w1 pos5) (at w2 pos6) (at w3 pos7) (at w4 pos8) (empty pos0)

    ; Define all positions as either centre or outer.
    (centrepos pos0)  
    (outerpos pos1) (outerpos pos2) (outerpos pos3) (outerpos pos4) 
    (outerpos pos5) (outerpos pos6) (outerpos pos7) (outerpos pos8)
    
    ; Define all pieces
    (piece g1) (piece g2) (piece g3) (piece g4)
    (piece w1) (piece w2) (piece w3) (piece w4)
    ; Define which pieces belong to which player.
    (playerpiece g1 green) (playerpiece g2 green) (playerpiece g3 green) (playerpiece g4 green)
    (playerpiece w1 white) (playerpiece w2 white) (playerpiece w3 white) (playerpiece w4 white)

    ; The initial turn for the green player.
    (turn green)

    ; Define all positions and pieces.
    (position pos0) (position pos1) (position pos2) (position pos3) (position pos4)
    (position pos5) (position pos6) (position pos7) (position pos8)

    ; Valid moves for the player.
    (validmove pos0 pos1)(validmove pos0 pos2)(validmove pos0 pos3)(validmove pos0 pos4)
    (validmove pos0 pos5)(validmove pos0 pos6)(validmove pos0 pos7)(validmove pos0 pos8)

    (validmove pos1 pos0)(validmove pos1 pos2)(validmove pos1 pos8)
    (validmove pos2 pos0)(validmove pos2 pos1)(validmove pos2 pos3)
    (validmove pos3 pos0)(validmove pos3 pos2)(validmove pos3 pos4)
    (validmove pos4 pos0)(validmove pos4 pos3)(validmove pos4 pos5)
    (validmove pos5 pos0)(validmove pos5 pos4)(validmove pos5 pos6)
    (validmove pos6 pos0)(validmove pos6 pos5)(validmove pos6 pos7)
    (validmove pos7 pos0)(validmove pos7 pos6)(validmove pos7 pos8)
    (validmove pos8 pos0)(validmove pos8 pos7)(validmove pos8 pos1)
  )

  (:goal (and 
      (at g2 pos0) 
      (at g1 pos8) 
      (at g3 pos2)
      (at g4 pos4)
      (at w1 pos5) 
      (at w2 pos6) 
      (at w3 pos7) 
      (at w4 pos1) 
      (empty pos3))
  )
)
