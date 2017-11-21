module Pages.UsersList exposing (usersListRender)

import Html exposing (Html, text, div, hr, h3, table, thead, tbody, th, tr, td, i)
import Html.Attributes exposing (class, href)


--

import Models.User exposing (User)
import Msgs exposing (Msg(..))


usersListRender : List User -> Html Msg
usersListRender users =
    div [ class "app user-list" ]
        [ div [ class "content" ]
            [ h3 [] [ text "User List" ]
            , hr [] []
            , listUsers users
            ]
        ]


listUsers : List User -> Html Msg
listUsers users =
    table [ class "mdl-data-table mdl-shadow--2dp" ]
        [ thead []
            [ tr []
                [ tableRow th "Name"
                , tableRow th "Username"
                , tableRow th "Rights"
                , tableRow th ""
                ]
            ]
        , List.map viewUser users
            |> tbody []
        ]


viewUser : User -> Html Msg
viewUser user =
    tr []
        [ tableRow td user.name
        , tableRow td user.userName
        , userRights user |> tableRow td
        , td [ class "group-icons" ]
            [ i [ class "material-icons blue" ] [ text "build" ]
            , i [ class "material-icons red " ] [ text "warning" ]
            ]
        ]


tableRow : (List (Html.Attribute msg) -> List (Html msg1) -> a) -> String -> a
tableRow tag string =
    tag [ class "mdl-data-table__cell--non-numeric" ] [ text string ]


userRights : User -> String
userRights user =
    [ ( user.guest, "Guest" )
    , ( user.member, "Member" )
    , ( user.admin, "Admin" )
    ]
        |> List.map
            (\r ->
                if Tuple.first r then
                    Tuple.second r
                else
                    ""
            )
        |> String.join " "
        |> String.trim
