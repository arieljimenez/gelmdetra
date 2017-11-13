module Pages.Dashboard.Views exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Pages.Dashboard.Model exposing (Model)
import Pages.Dashboard.Behavior exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "dashboard" ]
        [ text "Dashboard" ]
