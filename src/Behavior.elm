module Behavior exposing (..)

import Models exposing (AppModel)
import Pages.Dashboard.Behavior as Dashboard
import Pages.Sidebar.Behavior as Sidebar


type Msg
    = DashboardMsg Dashboard.Msg
    | SidebarMsg Sidebar.Msg


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        DashboardMsg subMsg ->
            let
                ( updatedDashboardModel, dashboardCmd ) =
                    Dashboard.update subMsg model.dashboardModel
            in
                ( { model | dashboardModel = updatedDashboardModel }
                , Cmd.map DashboardMsg dashboardCmd
                )

        SidebarMsg subMsg ->
            let
                ( updatedSidebarModel, sidebarCmd ) =
                    Sidebar.update subMsg model.sidebarModel
            in
                ( { model | sidebarModel = updatedSidebarModel }
                , Cmd.map SidebarMsg sidebarCmd
                )
