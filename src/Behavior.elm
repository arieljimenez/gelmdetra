module Behavior exposing (..)

import Models exposing (AppModel, Msg(..))
import Pages.Dashboard.Behavior as Dashboard


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
