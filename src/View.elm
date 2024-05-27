module View exposing (view)

import Bootstrap.Grid as Grid
import Bootstrap.Utilities.Spacing as Spacing
import Html exposing (Html)
import Model exposing (Model(..))
import Page.BudgetSelector
import Page.ErrorView
import Page.Loading
import Page.LoggedOut
import Page.PrivacyPolicy
import Page.TransactionViewer
import Update exposing (Msg)


view : Model -> Html Msg
view model =
    Grid.containerFluid [ Spacing.mt4 ]
        [ pageView model
        ]


pageView : Model -> Html Msg
pageView model =
    case model of
        LoggedOut config ->
            Page.LoggedOut.view config

        Loading pageData ->
            Page.Loading.view pageData

        BudgetSelector pageData ->
            Page.BudgetSelector.view pageData

        TransactionViewer pageData ->
            Page.TransactionViewer.view pageData

        Error pageData ->
            Page.ErrorView.view pageData

        PrivacyPolicy ->
            Page.PrivacyPolicy.view
