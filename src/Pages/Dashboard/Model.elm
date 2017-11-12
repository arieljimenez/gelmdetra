module Pages.Dashboard.Model exposing (..)


type alias Model =
    { userName : String
    }


defaultModel : Model
defaultModel =
    { userName = "Ariel Jiménez" }


type Msg
    = NoOp
