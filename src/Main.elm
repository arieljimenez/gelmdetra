module Main exposing (..)

import Html exposing (Html, program)
import Models exposing (Model, defaultModel, Msg(..))
import Views exposing (view)
import Behavior exposing (update)


init : ( Model, Cmd Msg )
init =
    ( defaultModel, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
