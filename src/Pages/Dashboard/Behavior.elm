module Pages.Dashboard.Behavior exposing (update, Msg(..))

import Pages.Dashboard.Model exposing (Model)


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
