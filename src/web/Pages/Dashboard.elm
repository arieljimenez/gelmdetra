module Pages.Dashboard exposing (dashboardRender)

import Html exposing (Html, text, div, h3)
import Html.Attributes exposing (class)


--

import Models.User exposing (User)


dashboardRender : User -> Html msg
dashboardRender user =
    div [ class "dashboard" ]
        [ text ("Welcome to gELMdetra " ++ user.name) ]
