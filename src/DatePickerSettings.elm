module DatePickerSettings exposing (default)

import DatePicker
import Html.Attributes
import Model
import TransactionReducer


default : List Model.Transaction -> DatePicker.Settings
default transactions =
    let
        defaultSettings =
            DatePicker.defaultSettings
    in
    { defaultSettings
        | placeholder = "Account Inception"
        , isDisabled = TransactionReducer.isBetweenDates transactions
        , inputAttributes =
            [ Html.Attributes.class "form-control form-control-lg"
            , Html.Attributes.style "text-align" "center"
            ]
    }
