module Models exposing (..)

import Pages.Dashboard.Model as Dashboard
import Pages.Sidebar.Model as Sidebar


type alias AppModel =
    { sidebarModel : Sidebar.Model
    , dashboardModel : Dashboard.Model
    }


defaultModel : AppModel
defaultModel =
    { sidebarModel = Sidebar.defaultModel
    , dashboardModel = Dashboard.defaultModel
    }
