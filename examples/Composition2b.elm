
{-
  A series of black disks of decreasing radius arranged with centers
  on a horizontal line.  Background is a red rectangle.  The output is
  the same as in `Composition2.elm,' except that the production of
  new circles is accomplished in a few lines of code using the Iterate
  library.
-}

import Svg exposing (..)

import Svg.Attributes exposing (..)

import Shape exposing(..)
import Iterate as I exposing(..)

-- Initial circle
circle1 = AbstractCircle 35.0 40.0 31.0

--Transform: step circle is a
step = move 0.7
f = \c -> step c
g = I.extend f

abstractCircles =  I.iterate 7 g [circle1]
circles = List.map (\c -> makeCircle c) abstractCircles

preamble = rect [ fill "#F00000", x "0", y "0", width "198", height "80"] [ ]

main =
  svg
    [   version "1.1", x "0", y "0", viewBox "-10 -10 300 300" ]
    ([rect [ fill "#F00000", x "0", y "0", width "208", height "80"] [ ]]
    ++ circles)
