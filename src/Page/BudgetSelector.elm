module Page.BudgetSelector exposing (view)

import Bootstrap.Button as Button
import Bootstrap.Utilities.Size as Size
import Bootstrap.Utilities.Spacing as Spacing
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model
import Styling
import Update


view : Model.BudgetSelectorData -> Html Update.Msg
view { budgets } =
    div []
        [ Styling.titleWithText "Select Your Budget"
        , viewBudgets budgets
        ]


viewBudgets : List Model.Budget -> Html Update.Msg
viewBudgets budgets =
    budgets
        |> List.sortBy .name
        |> List.indexedMap viewBudget
        |> List.map List.singleton
        |> List.map Styling.row
        |> div []


viewBudget : Int -> Model.Budget -> Html Update.Msg
viewBudget index budget =
    Button.linkButton
        [ Button.info
        , Button.large
        , Button.attrs
            [ onClick (Update.SelectBudget budget)
            , tabindex index
            , Spacing.mt4
            , Size.w50
            ]
        ]
        [ text budget.name ]
