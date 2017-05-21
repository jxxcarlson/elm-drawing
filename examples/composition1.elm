{-

   A piece of "abstract art" composed in Elm using SVG and module Geometry.
   Run in Elm-reactor/

-}


module Main exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Geometry as G


main =
    svg
        [ viewBox "0 0 400 400" ]
        [ square
        , redCircle
        , blueCircle
        , yellowEllipse
        , redCircle2
        , verticalRectangle
        , horizontalRectangle
        ]


square =
    rect
        [ x "10"
        , y "10"
        , width "150"
        , height "165"
        , fill "rgba(200,200,255,0.6)"
        ]
        []


redCircle =
    circle [ fill "#FF0000", cx "60", cy "60", r "30", opacity "0.5" ] []


blueCircle =
    circle
        [ fill "#5050FF"
        , cx "113"
        , cy "60"
        , r "45"
        , transform (G.translate 28.1 0.1)
        , opacity "0.7"
        ]
        []


yellowEllipse =
    circle
        [ fill "rgba(240,240,10,0.5)"
        , cx "60"
        , cy "120"
        , r "30"
        , G.transform commands
        ]
        []


commands =
    [ G.translate 60.0 120.0, G.scale 1.3 2.5, G.translate -60.0 -130.0 ]


redCircle2 =
    circle
        [ fill "rgba(240,0,10,0.8)"
        , cx "120"
        , cy "120"
        , r "30"
        , transform (G.scaleAt 120 120 1.1 0.9)
        ]
        []


verticalRectangle =
    rect
        [ x "40"
        , y "50"
        , height "140"
        , width "20"
        , stroke "black"
        , fill "rgba(240,0,10,0.1)"
        ]
        []


horizontalRectangle =
    rect
        [ x "30"
        , y "130"
        , height "20"
        , width "180"
        , stroke "black"
        , fill "rgba(240,0,10,0.1)"
        ]
        []
