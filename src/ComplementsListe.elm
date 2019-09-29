module ComplementsListe exposing (intersection,listDiviseurs)

{-|-}
intersection : List a -> List a -> List a 
intersection l1 l2  = List.concatMap
                        (\elt1 -> List.filter (\elt2 -> elt1 == elt2)l2 )
                        l1

{-|-}
listDiviseurs :  Int  -> List Int
listDiviseurs l0=  List.filter
                        (\elt -> modBy elt l0 == 0 )
                        (List.range 1 l0)
