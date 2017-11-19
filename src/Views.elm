module Views exposing (view)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Models exposing (AppModel)
import Behavior exposing (Msg(..))
import Components.Sidebar exposing (sidebar)
import Components.Dashboard exposing (dashboard)


view : AppModel -> Html Msg
view model =
    div [ class "app" ]
        [ sidebar model.user
        , dashboard
        ]
