module GameOfLife exposing (..)


type Cell
    = Alive
    | Dead


ultimateAnswer : Int -> Int
ultimateAnswer arg =
    42 + arg


nextState : Cell -> Int -> Cell
nextState cell neighbors =
    if neighbors < 2 || neighbors > 3 then
        Dead
    else
        Alive
