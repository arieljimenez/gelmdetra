module Pages.Sidebar.Views exposing (..)

import Html exposing (Html, text, div, input, p, label, a, h4)
import Html.Attributes exposing (id, class, type_, name, for, href)
import Html.Events exposing (onClick)


--

import Pages.Sidebar.Model exposing (Model)
import Pages.Sidebar.Behavior exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "sidebar text-center" ]
        [ h4 [] [ text "GELMDETRA" ]
        , viewMenu model
        ]


viewMenu : Model -> Html Msg
viewMenu model =
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
