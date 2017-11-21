module Routing exposing (..)

import Models exposing (Route(..))
import Models.User exposing (UserID)
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ --map DashboardRoute top
          map UsersRoute (s "users")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


usersPath : String
usersPath =
    "#users"


userPath : UserID -> String
userPath id =
    "#users/" ++ toString id
