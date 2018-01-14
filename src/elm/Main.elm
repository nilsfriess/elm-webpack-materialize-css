module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
import Components.Hello exposing ( hello )


-- APP
main : Program Never Model Msg
main =
  Html.program 
      { init = (model, Cmd.none )
      , view = view
      , subscriptions = always Sub.none
      , update = update
      }

-- TYPES

type alias Task = 
  { name : String }

-- MODEL
type alias Model = 
  { tasks: List Task
  }

model : Model
model =
  { tasks = [] 
  }


-- UPDATE
type Msg
  = AddItem String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    AddItem name ->
      if String.length name /= 0 then
        { model | tasks = model.tasks ++ [ { name = name } ] } ! []
      else
        model ! []


view : Model -> Html Msg
view model =
  nav []
    [ div [ class "nav-wrapper" ]
        [ a [ href "#", class "brand-logo" ] [ text "Day Planner" ]

        ]
    ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
