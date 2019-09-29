## Elm Combinatoire

Permet de manipuler les fractions


### Exemples 

simplification

```elm 
a = simplifier (Fra { den = 20, num = 15 })
-- Fra { den = 4, num = 3 }
```

addition 
```elm
a = addition
        (Fra { den = 4, num = 3 })
        (Fra { den = 14, num = 9 })
-- Fra { den = 28, num = 39 } 
```

multiplication
```elm
a = multiplication
        (Fra { den = 4, num = 3 })
        (Fra { den = 14, num = 9 })
-- Fra { den = 56, num = 27 } 
```