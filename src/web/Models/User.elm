module Models.User exposing (..)

import Json.Decode as Decode exposing (Decoder, Value, decodeString)
import Json.Decode.Pipeline exposing (decode, optional, required)
import Http exposing (Request, expectJson)
import Http exposing (get, send)


--

import Utils exposing (parsePath, strToInt)


type alias UserID =
    Int


type alias User =
    { id : Int
    , name : String
    , userName : String
    , userPass : String
    , guest : Bool
    , member : Bool
    , admin : Bool
    , valid : Bool
    }


defaultUser : User
defaultUser =
    User 0 "Guest" "guestUser" "" True False True True


fetchUser : String -> (Result Http.Error User -> msg) -> Cmd msg
fetchUser userHref msg =
    let
        userPath =
            parsePath userHref
    in
        get (fetchUserUrl userPath) userDecoder
            |> send msg


fetchUserUrl : String -> String
fetchUserUrl userPath =
    "/users/" ++ userPath


fetchUsers : (Result Http.Error (List User) -> msg) -> Cmd msg
fetchUsers msg =
    get "http://localhost:8000/users" usersDecoder
        |> send msg


fetchUsersUrl : String -> String
fetchUsersUrl baseApiURL =
    baseApiURL ++ "/users/"


usersDecoder : Decoder (List User)
usersDecoder =
    Decode.list userDecoder


userDecoder : Decoder User
userDecoder =
    decode User
        |> required "Id" Decode.int
        |> required "Name" Decode.string
        |> required "Username" Decode.string
        |> required "UserPass" Decode.string
        |> required "Guest" Decode.bool
        |> required "Member" Decode.bool
        |> required "Admin" Decode.bool
        |> required "Valid" Decode.bool
