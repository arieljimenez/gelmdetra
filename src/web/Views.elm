module Views exposing (view)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Models exposing (AppModel)
import Msgs exposing (Msg(..))
import Models exposing (Route(..))
import Pages.Dashboard exposing (dashboardRender)
import Pages.UsersList exposing (usersListRender)
import Pages.UsersAdd exposing (usersAddRender)
import Components.Sidebar exposing (sidebarRender)


view : AppModel -> Html Msg
view model =
    div [ class "app" ]
        [ sidebarRender model.usersModule.currentUser
        , div
            [ class "content" ]
            [ page model ]
        ]


page : AppModel -> Html Msg
page model =
    case model.route of
        NotFoundRoute ->
            notFoundView

        DashboardRoute ->
            dashboardRender model.usersModule.currentUser

        UsersRoute ->
            usersListRender model.usersModule.userList

        UsersAddRoute ->
            usersAddRender model.usersModule.currentUser


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Page Not found" ]
