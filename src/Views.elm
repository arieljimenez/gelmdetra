module Views exposing (view)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)
import Models exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    div [ class "fa fa-id-card" ]
        [ text model.userName ]
