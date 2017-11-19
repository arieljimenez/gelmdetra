module Components.Sidebar exposing (sidebar)

import Html exposing (Html, text, h4, label, p, a, input, div)
import Html.Attributes exposing (id, class, type_, for, href, name)
import Html.Events exposing (onClick)


--

import Behavior exposing (Msg(..))
import Models.User exposing (User)


sidebar : User -> Html Msg
sidebar user =
    div [ class "sidebar text-center" ]
        [ h4 [] [ text "GELMDETRA" ]
        , viewMenu
        , userSidebarView user
        , text "gELMdetra v0.0.5"
        ]


viewMenu : Html Msg
viewMenu =
    div [ class "sidebar-menu" ]
        [ viewAccordion "Users"
            [ ( "List", Redirect )
            , ( "Create", Redirect )
            ]
        , viewAccordion "Universities"
            [ ( "List", Redirect )
            , ( "Create", Redirect )
            ]
        , viewAccordion "Students"
            [ ( "List", Redirect )
            , ( "Create", Redirect )
            ]
        ]


viewAccordion : String -> List ( String, Msg ) -> Html Msg
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


viewOption : ( String, Msg ) -> Html Msg
viewOption ( option, msg ) =
    p []
        [ a [ href "#", onClick msg ] [ text option ]
        ]


userSidebarView : User -> Html msg
userSidebarView user =
    div [ class "user-" ]
        [ text user.name ]
