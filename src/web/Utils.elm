module Utils exposing (..)


strToInt : String -> Int
strToInt number =
    Result.withDefault 0 (String.toInt number)


parsePath : String -> String
parsePath longPath =
    String.split "/" longPath
        |> List.reverse
        |> List.head
        |> Maybe.withDefault ""
