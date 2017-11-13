module Pages.Sidebar.Behavior exposing (update, Msg(..))

import Pages.Sidebar.Model exposing (Model)


type Msg
    = NoOp
    | Redirect


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Redirect ->
            let
                log =
                    Debug.log "Redirect to something" model
            in
                ( model, Cmd.none )
