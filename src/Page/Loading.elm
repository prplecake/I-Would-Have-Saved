module Page.Loading exposing (..)

import Bootstrap.Progress as Progress
import Bootstrap.Utilities.Spacing as Spacing
import Html exposing (..)
import Model exposing (LoadingType(..))
import Styling
import Update


view : LoadingType -> Html Update.Msg
view loadingType =
    div []
        [ Styling.title
        , Styling.row [ h5 [ Spacing.mb2 ] [ text (message loadingType) ] ]
        , Styling.row
            [ Progress.progress
                [ Progress.animated
                , Progress.value 100
                ]
            ]
        ]


message : LoadingType -> String
message loadingType =
    case loadingType of
        LoadingTransactions ->
            "Loading Transactions..."

        LoadingBudgets ->
            "Loading Budgets..."
