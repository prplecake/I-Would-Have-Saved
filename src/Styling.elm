module Styling exposing (..)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Text as Text
import Bootstrap.Utilities.Flex as Flex
import Bootstrap.Utilities.Spacing as Spacing
import Html exposing (..)
import Update exposing (Msg)


rowWithColOptions : List (Col.Option msg) -> List (Html msg) -> Html msg
rowWithColOptions colOptions children =
    Grid.row
        [ Row.centerMd, Row.centerSm, Row.attrs [ Flex.alignItemsCenter ] ]
        [ Grid.col ([ Col.lg6, Col.sm10, Col.textAlign Text.alignXsCenter ] ++ colOptions)
            children
        ]


row : List (Html Msg) -> Html Msg
row =
    rowWithColOptions []


titleWithText : String -> Html Msg
titleWithText str =
    rowWithColOptions
        [ Col.lg12, Col.sm12 ]
        [ h1 [ Spacing.mb4 ] [ text str ] ]


title : Html Msg
title =
    titleWithText "I Would Have Saved..."
