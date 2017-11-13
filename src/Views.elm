module Views exposing (view)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)


--

import Models exposing (AppModel, Msg(..))
import Pages.Dashboard.Views as Dashboard


view : AppModel -> Html Msg
view model =
    div [ class "dashboard" ]
        [ Html.map DashboardMsg (Dashboard.view model.dashboardModel) ]
