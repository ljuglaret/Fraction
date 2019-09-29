module Fract exposing (Fra,addition,multiplication,simplifier,a)
{-|
# Definition
@docs Fra
-}
{-|-}
type  Fra =  Fra {num : Int , den : Int }



pgcdF : Int -> Int -> Int  
pgcdF x y =
    if (x>=y)
    then 
        if (modBy y x == 0)
        then y
        else 
            pgcdF y (modBy y x)
    else pgcdF y x 


{-|-}

simplifier :  Fra  ->  Fra 
simplifier (Fra jf1)  = 
                let
                    numerateur = jf1.num 
                    denominateur = jf1.den
                    numAbs = abs numerateur
                    denAbs = abs denominateur
                in
                    let 
                        pgcd =  pgcdF numAbs denAbs        
                        numReduit = numAbs // pgcd
                        denReduit = denAbs // pgcd
                        signe      = if (numerateur*denominateur>=0)
                                     then 1
                                     else -1
                    in Fra{num = signe * numReduit, den  = denReduit }

{-|-}
addition : Fra ->  Fra ->  Fra   
addition (Fra x) (Fra y) =  
     (simplifier (Fra{num = y.den*x.num + x.den*y.num, den = x.den * y.den}))

{-|-}      
multiplication : Fra ->  Fra ->  Fra  
multiplication (Fra x) (Fra y) = 
    (simplifier (Fra {num = y.num*x.num , den = x.den*y.den}))

a = multiplication
        (Fra { den = 4, num = 3 })
        (Fra { den = 14, num = 9 })