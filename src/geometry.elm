module Geometry exposing(transform, translate, scale, scaleAt)

import Svg.Attributes as S exposing (..)

transform = S.transform << join

translate : Float -> Float -> String
translate x y =  "translate(" ++ (toString x) ++ ", " ++ (toString y) ++ ")"

scale : Float -> Float -> String
scale kx ky = "scale(" ++ (toString kx) ++ ", " ++ (toString ky) ++ ")"

scaleAt : Float -> Float -> Float -> Float -> String
scaleAt cx cy kx ky =
  let commands = [translate cx cy, scale kx ky, translate -cx -cy]
  in join commands


-- PRIVATE
-- join ["a", "b", "c"] = "a, b, c"
join = String.join ", "

