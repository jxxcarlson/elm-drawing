module Shape exposing (AbstractCircle, move, transformCircle, makeCircle)

{-| Module Shape defines the AbstractCircle type as record containing
the coordinates of the center (cx, cy) and the radius.  Such
records can be operated on mathematically, e.g. by transformCircle
and move, defined below.

@docs AbstractCircle: a record representing a circle. An AbstractCircle
is defined by the coordinates of its center and by its radius,
as in this example:

    circle1 = AbstractCircle 35.0 40.0 31.0

@docs transformCircle dx dy k: transforms one abstact circle to another.
In the case at hand, the transformed circle is translated by dx, dy the
right and rescaled by the facctor k

@docs move k: return an AbstractCircle tangent to the given circle.

@docs makeCircle c: return an SVG circle given an AbstractCircle


-}

import Svg exposing (..)
import Svg.Attributes exposing (..)


{-| An Circle is the SVG representation of a circle.
-}
type alias Circle msg =
    List (Svg msg) -> Svg msg


{-| An Abstract circle is defined by the coordinates of its
center and by its radius.
-}
type alias AbstractCircle =
    { cx : Float, cy : Float, radius : Float }


{-| Translate and rescale
-}
transformCircle : Float -> Float -> Float -> AbstractCircle -> AbstractCircle
transformCircle dx dy k abstractCircle =
    { abstractCircle | cx = abstractCircle.cx + dx, cy = abstractCircle.cy + dy, radius = k * abstractCircle.radius }


{-| move k: Rescale a circle by a factor of k and move it to the right
    so that it just touches the given circle.
-}
move : Float -> AbstractCircle -> AbstractCircle
move k circleData =
    transformCircle ((1 + k) * circleData.radius) 0.0 k circleData


{-| makeCircle: convert an AbstractCircle into a Circle.
-}
makeCircle : AbstractCircle -> Svg msg
makeCircle circleData =
    circle [ cx (toString circleData.cx), cy (toString circleData.cy), r (toString circleData.radius) ] []
