module Models exposing (Model, defaultModel, Msg(..))


type alias Model =
    { userName : String
    , userPosition : String
    }


defaultModel : Model
defaultModel =
    { userName = "Ariel Jimenez"
    , userPosition = "Developer"
    }


type Msg
    = NoOp
