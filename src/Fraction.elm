module Fraction exposing (Fraction,createFraction,getNumerator,getDenominator,addition,multiplication,simplify, sup,eq,inf)

{-|
# Definition
@docs Fraction
# Fonctions
@docs addition , multiplication , simplify,createFraction, getNumerator, getDenominator, sup, eq,inf
-}

{-|-}
type  Fraction =  Fraction {numerator : Int , denominator : Int }


{-| Create a Fraction -}
createFraction : (Int, Int) -> Maybe Fraction
createFraction (x,y) = 
    if (y == 0)
    then Nothing 
    else Just(Fraction{numerator = x, denominator = y})

{-| Access to the numerator-}
getNumerator : Fraction -> Int 
getNumerator (Fraction fraction) = fraction.numerator

{-| Access to the denominator -}
getDenominator : Fraction -> Int 
getDenominator (Fraction fraction)  = fraction.denominator

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
simplify :  Fraction  ->  Fraction 
simplify (Fraction jf1)  = 
                let
                    numerator1 = jf1.numerator 
                    denominator1 = jf1.denominator
                    numAbs = abs numerator1
                    denAbs = abs denominator1
                in
                    let 
                        pgcd =  pgcdF numAbs denAbs        
                        numReduce = numAbs // pgcd
                        denReduce = denAbs // pgcd
                        sign      = if (numerator1*denominator1>=0)
                                     then 1
                                     else -1
                    in Fraction{numerator = sign * numReduce, denominator  = denReduce }

{-|  fraction1+fraction2  -}
addition : Fraction ->  Fraction->  Fraction   
addition (Fraction x) (Fraction y) =  
     (simplify (Fraction{numerator = y.denominator*x.numerator + x.denominator*y.numerator,
                        denominator = x.denominator * y.denominator }))

{-| fraction1*fraction2  -}      
multiplication : Fraction ->  Fraction ->  Fraction  
multiplication (Fraction x) (Fraction y) = 
    (simplify (Fraction {numerator = y.numerator*x.numerator,
                        denominator = x.denominator*y.denominator}))

type Ord = 
    EQ
    |LT 
    |GT

{-|   1/fraction1 -}
inverse :  Fraction ->  Fraction 
inverse (Fraction fr1) = Fraction{numerator = fr1.denominator, denominator = fr1.numerator} 


{-|-}
comp : Fraction -> Fraction -> Ord
comp  fraction1  fraction2 = 
    let 
        quotient =  multiplication fraction1 (inverse fraction2)
        n = getNumerator quotient 
        d = getDenominator quotient 
    in 
        if (n == d )
        then EQ 
        else 
            if (n > d) 
            then GT 
            else LT 

{-| fraction1 > fraction 2 -}
sup : Fraction -> Fraction -> Bool 
sup f1 f2 = (comp f1 f2 ) == GT 

{-| fraction1 == fraction 2 -}
eq : Fraction -> Fraction -> Bool 
eq f1 f2 = (comp f1 f2 ) == EQ 

{-| fraction1 < fraction 2 -}
inf : Fraction -> Fraction -> Bool 
inf f1 f2 = (comp f1 f2 ) == LT 