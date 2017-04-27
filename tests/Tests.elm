module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (bool, list, int, intRange, tuple, string)
import String
import GameOfLife exposing (Cell(..), nextState)


-- 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
-- 2. Any live cell with two or three live neighbours lives on to the next generation.
-- 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
-- 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


all : Test
all =
    describe "GameOfLife"
        [ describe "ultimateAnswer"
            [ test "+1 is 43" <|
                \() ->
                    Expect.equal
                        (GameOfLife.ultimateAnswer 1)
                        43
            , test "+10 is 52" <|
                \() ->
                    Expect.equal
                        (GameOfLife.ultimateAnswer 10)
                        52
            , fuzz int "+fuzzArg is 42 + fuzzArg" <|
                \fuzzArg ->
                    Expect.equal
                        (GameOfLife.ultimateAnswer fuzzArg)
                        (42 + fuzzArg)
            ]
        , describe "nextState"
            -- 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
            [ fuzz (intRange 0 1) "1" <|
                \neighbors ->
                    Expect.equal
                        (nextState Alive neighbors)
                        Dead

            -- 2. Any live cell with two or three live neighbours lives on to the next generation.
            , test "2" <|
                \() ->
                    Expect.equal
                        (nextState Alive 2)
                        Alive

            -- 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
            , fuzz (intRange 4 8) "3" <|
                \neighbors ->
                    Expect.equal
                        (nextState Alive neighbors)
                        Dead

            -- 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
            , test "Dead is still dead" <|
                \() ->
                    Expect.equal (nextState Dead 2)
                        Dead
            ]
        ]



-- , fuzz int "+arg is 42 + arg" <|
--     \arg ->
--         GameOfLife.ultimateAnswer arg |> Expect.equal (42 + 1)
-- , fuzz2 int int "+ arg (ignoring arg2) is 42 + arg" <|
--     \arg arg2 ->
--         GameOfLife.ultimateAnswer arg |> Expect.equal (42 + arg2)
