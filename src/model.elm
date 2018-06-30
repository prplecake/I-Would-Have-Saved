module Model exposing (..)

import RemoteData exposing (..)
import Http
import List.Zipper exposing (Zipper)
import Date exposing (Date)


type alias Config =
    { ynab_client_id : String
    , ynab_redirect_uri : String
    }


type Page
    = Loading
    | BudgetSelector
    | TransactionViewer
    | LoggedOut
    | Error


type Filter
    = Category String


type Adjustment
    = Adjustment Float


type alias Model =
    { config : Config
    , page : Page
    , token : Maybe AccessToken
    , budgets : RemoteData Http.Error (Zipper Budget)
    , transactions : RemoteData Http.Error (List Transaction)
    , filters : List Filter
    , adjustment : Maybe Adjustment
    }


type alias AccessToken =
    String


type alias BudgetId =
    String


type alias Budget =
    { id : BudgetId
    , name : String
    }


type alias Transaction =
    { id : String
    , amount : Int
    , category : String
    , payee : String
    , date : Date
    }
