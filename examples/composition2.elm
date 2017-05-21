
{-
  A series of black disks of decreasing radius arranged with centers
  on a horizontal line.  Background is a red rectangle.
-}

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Shape as S exposing(AbstractCircle, makeCircle, move)

circle1 = AbstractCircle 35.0 40.0 31.0
step = move 0.7

main =
  svg
    [   version "1.1", x "0", y "0", viewBox "-10 -10 300 300" ]
    [
      rect [ fill "#F00000", x "0", y "0", width "198", height "80"] [ ]
      ,  linearGradient
          [ id "Gradient", x1 "0.0", y1 "0.0", x2 "200.0", y2 "100.0" ]
          [ stop [ offset "0%", stopColor "rgba(253, 0, 0, 1.0)" ] []
          , stop [ offset "50%", stopColor "rgba(253, 0, 255, 1.0)", stopOpacity "0.5" ] []
          , stop [ offset "100%", stopColor "rgba(0, 0, 255, 1.0)" ] []
          ]
      , circle1 |> makeCircle
      , circle1 |> step |> makeCircle
      , circle1 |> step |> step |> makeCircle
      , circle1 |> step |> step |> step |> makeCircle
      , circle1 |> step |> step |> step |> step |> makeCircle
      , circle1 |> step |> step |> step |> step |> step |> makeCircle
      , circle1 |> step |> step |> step |> step |> step |> step |> makeCircle
    ]
