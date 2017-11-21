module Models exposing (..)

import Models.User exposing (User, defaultUser)


type alias AppModel =
    { usersModule : UsersModule
    , route : Route
    , error : String
    }


defaultModel : Route -> AppModel
defaultModel route =
    { usersModule = usersModuleDefault
    , route = route
    , error = ""
    }


type alias UsersModule =
    { currentUser : User
    , userList : List User
    }


usersModuleDefault : UsersModule
usersModuleDefault =
    { currentUser = defaultUser
    , userList = []
    }


type Route
    = NotFoundRoute
    | UsersRoute
