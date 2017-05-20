module Iterate exposing(..)

{-| Module Iterator giveś an easy way to construct lists like

     [f(f(z)), (f(f(a)))]

-}

{-| iterate n f a

   Example:

      > foo = [1]
      [1] : List number

      > f n = 2*n
      <function> : number -> number

      > g = I.extend f
      <function> : List number -> List number

      > I.iterate 4 g foo
      [16,8,4,2,1] : List number

-}

iterate : Int -> (a -> a) -> a -> a
iterate n f a =
  if n == 0 then
    a
  else
    iterate (n-1) f (f a)


{-| extend f list: Apply the function f to the head of the list and then cons it to the
    head of the list.  Used to contruct lists like [f(f(f(a))), f(f(a)), f(a), a]

    Example:
    > foo = [2,1]
    [2,1] : List number
    > extend (\n -> 2*n) foo
    [4,2,1] : List number

-}
extend : (a -> a) -> List a -> List a
extend f list =
  let h = List.head list
  in case h of
    Nothing -> list
    Just x -> f(x) :: list
