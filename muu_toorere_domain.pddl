(define (domain muu_toorere)
    (:requirements :strips)
    (:predicates
        (at ?piece ?position)
        (position ?pos)
        (piece ?piece)
        (playerpiece ?piece ?player)
        (empty ?position)
        (validmove ?position1 ?position2)
        (turn ?player)
        (player ?player)
        (different ?player1 ?player2)
        (outerpos ?pos)
        (centrepos ?pos)
        
    )

    (:action moveouter
    :parameters (?p ?op ?pc ?from ?to)
    :precondition 
        (and 
            (turn ?p)
            (at ?pc ?from)
            (different ?p ?op)
            (validmove ?from ?to)
            (empty ?to)
            (or(outerpos ?from)(centrepos ?from)))
    :effect
        (and 
            (not(at ?pc ?from))  
            (at ?pc ?to) 
            (not(empty ?to))
            (empty ?from)
            (outerpos ?to)
            (not(turn ?p))
            (different ?p ?op)
            (turn ?op)))


    (:action movecentre 
    :parameters (?p ?op ?pc ?pc2 ?from ?to ?npos)
    :precondition 
        (and 
            (turn ?p) 
            (at ?pc ?from) 
            (validmove ?from ?to)
            (empty ?to)
            (different ?p ?op)
            (centrepos ?to)
            (outerpos ?from)
            (at ?pc2 ?npos)
            (validmove ?from ?npos)
            (playerpiece ?pc ?p)
            (playerpiece ?pc2 ?op)
            
        )
    :effect        
        (and 
            (not(at ?pc ?from))
            (at ?pc ?to)
            (not(empty ?to))
            (empty ?from)
            (centrepos ?to)
            (not(turn ?p))
            (different ?p ?op)
            (turn ?op))
    )
)
