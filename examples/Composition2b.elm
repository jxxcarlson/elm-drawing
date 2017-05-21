{-
   A series of black disks of decreasing radius arranged with centers
   on a horizontal line.  Background is a red rectangle.  The output is
   the same as in `Composition2.elm,' except that the production of
   new circles is accomplished in a few lines of code using the Iterate
   library.
-}


module Main exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Shape exposing (AbstractCircle, move, makeCircle)
import Iterate exposing (orbit)


-- Compute circles:
-- Initial circle


circle1 =
    AbstractCircle 35.0 40.0 31.0



-- Apply the function (S.move 0.8) seven times to circle1


abstractCircles =
    orbit (move 0.7) 7 circle1



-- map the list of seven abstract circles to SVG circles


circles =
    List.map (\c -> makeCircle c) abstractCircles


preamble =
    rect [ fill "#F00000", x "0", y "0", width "198", height "80" ] []


main =
    svg
        [ version "1.1", x "0", y "0", viewBox "-10 -10 300 300" ]
        ([ rect [ fill "#F00000", x "0", y "0", width "208", height "80" ] [] ]
            ++ circles
        )
