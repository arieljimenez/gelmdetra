module Behavior exposing (..)

import Models exposing (AppModel)


type Msg
    = NoOp
    | Redirect


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        Redirect ->
            model ! []
