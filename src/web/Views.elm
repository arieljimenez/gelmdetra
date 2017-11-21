module Views exposing (view)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Models exposing (AppModel)
import Msgs exposing (Msg(..))
import Models exposing (Route(..))
import Pages.UsersList exposing (usersListRender)
import Components.Sidebar exposing (sidebarRender)


view : AppModel -> Html Msg
view model =
    div [ class "app" ]
        [ sidebarRender model.usersModule.currentUser
        , page model
        ]


page : AppModel -> Html Msg
page model =
    case model.route of
        NotFoundRoute ->
            notFoundView

        UsersRoute ->
            usersListRender model.usersModule.userList


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Page Not found" ]
