module Main exposing (..)

import Html exposing (Html, program)


--

import Models exposing (AppModel, defaultModel, Msg(..))
import Views exposing (view)
import Behavior exposing (update)


init : ( AppModel, Cmd Msg )
init =
    ( defaultModel, Cmd.none )


main : Program Never AppModel Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
