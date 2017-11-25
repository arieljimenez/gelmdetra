module Main exposing (..)

import Navigation exposing (Location)


--

import Models exposing (AppModel, defaultModel)
import Views exposing (view)
import Behavior exposing (update)
import Msgs exposing (Msg(OnLocationChange))
import Routing exposing (parseLocation)


init : Location -> ( AppModel, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( defaultModel currentRoute, Cmd.none )


main : Program Never AppModel Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
