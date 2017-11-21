module Msgs exposing (Msg(..))

import Http
import Navigation exposing (Location)


--

import Models.User exposing (User)


type Msg
    = NoOp
    | Redirect
    | OnLocationChange Location
    | OnFetchUsers (Result Http.Error (List User))
