module Pages.Sidebar.Model exposing (..)


type alias Model =
    { userName : String
    }


defaultModel : Model
defaultModel =
    { userName = "Ariel Jiménez" }
