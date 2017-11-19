module Components.Dashboard exposing (dashboard)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


dashboard : Html msg
dashboard =
    div [ class "dashboard" ]
        [ text "Dashboard" ]
