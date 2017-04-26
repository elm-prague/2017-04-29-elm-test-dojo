module Main exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Time exposing (Time, millisecond)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { generation : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { generation = 0
      }
    , Cmd.none
    )


type Msg
    = Tick Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( { model
                | generation = model.generation + 1
              }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (1000 * millisecond) Tick


view : Model -> Html Msg
view model =
    Html.div [ style [ ( "margin", "20px" ), ( "font-family", "Helvetica, Arial, sans" ) ] ]
        [ Html.h1 [] [ Html.text "Game of Life" ]
        , Html.div [] [ Html.text (toString model.generation) ]
        ]
