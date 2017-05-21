module Geometry exposing (transform, translate, scale, scaleAt)

{-| module Geometry provides utilities for translating
and scaling SVG shapes, as well as chaining such transformations
together.

@docs transform commandList -- construct an SVG commmand from a given list
of commmands, e.g., [G.translate 60.0 120.0, G.scale 1.3 2.5, G.translate -60.0 -130.0]

@docs translate 3.0 -2.0 -- translate 3.0 to the right and -2.0 down

@docs scaleAt 20.0 -20.0 1.5 0.8 -- scale by 1.5 in the x-direction,
0.8 in the y-direction using (20.0, -20.0) as center

@docs scale 1.5 0.8 -- scald as above, but with the origin as center

-}

import Svg exposing (..)
import Svg.Attributes as S exposing (..)


{-| transform commandList

Example:

yellowEllipse = circle [
fill "rgba(240,240,10,0.5)",
cx "60", cy "120", r "30",
G.transform commandList] []

commandList = [G.translate 60.0 120.0, G.scale 1.3 2.5, G.translate -60.0 -130.0]

-}
transform : List String -> Svg.Attribute msg
transform =
    S.transform << join


{-| translate 22.0 -15.0

  Example:
    redCircle2 = circle [
      fill "rgba(240,0,10,0.8)",
      cx "0", cy "0", r "30",
      transform(G.scaleAt 240 240 1.1 0.9)] []

-}
translate : Float -> Float -> String
translate x y =
    "translate(" ++ (toString x) ++ ", " ++ (toString y) ++ ")"


{-| scale 1.1 0.9

  Example:
    redCircle2 = circle [
      fill "rgba(240,0,10,0.8)",
      cx "0", cy "0", r "30",
      transform(G.scale 1.1 0.9)] []
-}
scale : Float -> Float -> String
scale kx ky =
    "scale(" ++ (toString kx) ++ ", " ++ (toString ky) ++ ")"


{-| scaleAt 240 240 1.1 0.9

  Example:
    redCircle2 = circle [
      fill "rgba(240,0,10,0.8)",
      cx "0", cy "0", r "30",
      transform(G.scaleAt 240 240 1.1 0.9)] []
-}
scaleAt : Float -> Float -> Float -> Float -> String
scaleAt cx cy kx ky =
    let
        commands =
            [ translate cx cy, scale kx ky, translate -cx -cy ]
    in
        join commands



-- PRIVATE
-- join ["a", "b", "c"] = "a, b, c"


join =
    String.join ", "
