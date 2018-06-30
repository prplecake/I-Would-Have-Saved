module Router exposing (..)

import UrlParser exposing ((</>), s, int, string, parseHash, oneOf, map, (<?>), stringParam, Parser, parsePath)
import Navigation


type Route
    = LoggedOut
    | Loading (Maybe String)


routeTable : Parser (Route -> a) a
routeTable =
    oneOf
        [ map Loading (s "home" <?> stringParam "access_token")
        , map LoggedOut (s "sign_in")
        ]


parseLocation : Navigation.Location -> Maybe Route
parseLocation =
    parsePath routeTable
