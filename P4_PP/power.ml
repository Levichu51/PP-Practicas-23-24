let rec power x y = (function true -> 1 | false -> x * power x (y -1)) (y <= 0);;

let rec power' x y = (function true -> 1 | false -> x * power x (y - 1)) (y <= 0);;

let es_par y = if (y mod 2) = 0 then true else false;;

let rec power' x y =
  if y = 0 then
    1
  else if es_par y then
    power' (x * x) (y / 2)
  else
    x * power' (x * x) (y / 2)
;;

let rec powerf x y =
  if y = 0 then
    1.
  else if es_par y then
    powerf (x *. x) (y / 2)
  else
    x *. powerf (x *. x) (y / 2)
;;












