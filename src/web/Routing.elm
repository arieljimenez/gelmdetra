module Routing exposing (..)

import Models exposing (Route(..))
import Models.User exposing (UserID)
import Navigation exposing (Location)
import UrlParser exposing (Parser, s, map, oneOf, parseHash, top)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map DashboardRoute top
        , map UsersRoute (s "users")
        , map UsersAddRoute (s "users-add")
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
