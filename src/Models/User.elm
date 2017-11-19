module Models.User exposing (User, defaultUser)


type alias User =
    { name : String
    , userName : String
    , rols : List Rol
    }


defaultUser : User
defaultUser =
    { name = "Guest"
    , userName = ""
    , rols = [ Guest ]
    }


type Rol
    = Guest
    | Admin
