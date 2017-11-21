module Pages.UsersAdd exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Models.User exposing (User)
import Msgs exposing (Msg(..))


usersAddRender : User -> Html Msg
usersAddRender currentUser =
    div [] [ text "asdfasdf" ]
