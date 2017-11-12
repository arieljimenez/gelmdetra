module Models exposing (..)

import Pages.Dashboard.Model as Dashboard


type alias AppModel =
    { dashboardModel : Dashboard.Model
    }


defaultModel : AppModel
defaultModel =
    { dashboardModel = Dashboard.defaultModel
    }


type Msg
    = DashboardMsg Dashboard.Msg
