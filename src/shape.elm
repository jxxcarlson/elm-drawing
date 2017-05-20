module Shape exposing(CircleData, move, transformCircle, makeCircle)

import Svg exposing (..)
import Svg.Attributes exposing (..)

type alias Circle msg = List (Svg msg) -> Svg msg
type alias CircleData = { cx: Float, cy: Float, radius: Float }

transformCircle : Float -> Float -> Float -> CircleData -> CircleData
transformCircle dx dy k circleData =
   { circleData | cx =circleData.cx + dx, cy = circleData.cy + dy, radius = k*circleData.radius }

move : Float -> CircleData -> CircleData
move k circleData =
  transformCircle ((1 + k)*circleData.radius) 0.0 k circleData

makeCircle : CircleData -> Svg msg
makeCircle circleData =
  circle [ cx (toString circleData.cx), cy (toString circleData.cy), r (toString circleData.radius) ] []
