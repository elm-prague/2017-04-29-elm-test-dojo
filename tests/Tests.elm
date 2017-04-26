module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (bool, list, int, intRange, tuple, string)
import String
import GameOfLife


all : Test
all =
    describe "GameOfLife"
        [ describe "ultimateAnswer"
            [ test "+1 is 43" <|
                \() ->
                    Expect.equal (GameOfLife.ultimateAnswer 1) 43

            -- , fuzz int "+arg is 42 + arg" <|
            --     \arg ->
            --         GameOfLife.ultimateAnswer arg |> Expect.equal (42 + 1)
            -- , fuzz2 int int "+ arg (ignoring arg2) is 42 + arg" <|
            --     \arg arg2 ->
            --         GameOfLife.ultimateAnswer arg |> Expect.equal (42 + arg2)
            ]
        ]
