module Pages.Dashboard.Views exposing (..)

import Html exposing (Html, text, h3)


--

import Pages.Dashboard.Model exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    h3 [] [ text "Dashboard" ]
