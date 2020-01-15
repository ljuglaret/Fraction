# Fraction


Allows manipulation of fractions : simplify, add two fractions, create a fraction, access the numerator and denominator.

## Create fraction
createFraction : (Int, Int) -> Maybe Fraction


## Access to the numerator
getNumerator : Fraction -> Int 


## Access to the denominator
getDenominator : Fraction -> Int 

    
## Simplify
simplify :  Fraction  ->  Fraction 

## Add
addition : Fraction ->  Fraction->  Fraction   

## Multiply      
multiplication : Fraction ->  Fraction ->  Fraction  

## Compare
### fraction1 > fraction 2
sup : Fraction -> Fraction -> Bool 

### fraction1 == fraction 2
eq : Fraction -> Fraction -> Bool 

### fraction1 < fraction 2
inf : Fraction -> Fraction -> Bool 
 
