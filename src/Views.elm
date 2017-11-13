module Views exposing (view)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Models exposing (AppModel)
import Behavior exposing (Msg(..))
import Pages.Dashboard.Views as Dashboard
import Pages.Sidebar.Views as Sidebar


view : AppModel -> Html Msg
view model =
    div [ class "app" ]
        [ Html.map SidebarMsg (Sidebar.view model.sidebarModel)
        , Html.map DashboardMsg (Dashboard.view model.dashboardModel)
        ]
