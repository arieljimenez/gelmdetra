module Models exposing (..)

import Models.User exposing (User, defaultUser)


type alias AppModel =
    { user : User }


defaultModel : AppModel
defaultModel =
    { user = defaultUser }
