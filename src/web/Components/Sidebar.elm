module Components.Sidebar exposing (sidebarRender)

import Html exposing (Html, text, h4, label, p, a, input, div, a)
import Html.Attributes exposing (id, class, type_, for, href, name)


--

import Msgs exposing (Msg(..))
import Models.User exposing (User)


sidebarRender : User -> Html Msg
sidebarRender user =
    div [ class "sidebar text-center" ]
        [ h4
            [ class "sys-name" ]
            [ a
                [ href "/#" ]
                [ text "GELMDETRA" ]
            ]
        , viewMenu
        , userSidebarView user
        , text "gELMdetra v0.0.5"
        ]


viewMenu : Html msg
viewMenu =
    div [ class "sidebar-menu" ]
        [ viewAccordion "Users"
            [ ( "List", "#users" )
            , ( "Create", "#users-add" )
            ]
        , viewAccordion "Universities"
            [ ( "List", "#universities" )
            , ( "Create", "#universities-add" )
            ]
        , viewAccordion "Students"
            [ ( "List", "#students" )
            , ( "Create", "#students/add" )
            ]
        ]


viewAccordion : String -> List ( String, String ) -> Html msg
viewAccordion menuName listOptions =
    div [ class "tab blue" ]
        [ input
            [ id menuName
            , type_ "radio"
            , name "sidebar-menu"
            ]
            []
        , label [ for menuName ] [ text menuName ]
        , List.map viewOption listOptions
            |> div [ class "tab-content" ]
        ]


viewOption : ( String, String ) -> Html msg
viewOption ( option, link ) =
    p []
        [ a
            [ href link ]
            [ text option ]
        ]


userSidebarView : User -> Html msg
userSidebarView user =
    div [ class "user-" ]
        [ text user.name ]
