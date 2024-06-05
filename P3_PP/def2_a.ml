
(*let p = function x -> 2. *. pi *. x;;*)
let p x = 2. *. ( 2. *. asin 1.) *. x;; 

(*let area = function x -> pi *. x *. x;;*)
let area x = ( 2. *. asin 1.) *. x *. x;;

(*let even x = (function true -> true | false -> false) (x mod 2 = 0);;*)
let even x = if (x mod 2 = 0) then true else false;;

(*let absf = function x -> if (x < 0.) then ((x *.(-2.)) +. x) else x;;*)
let absf x = if (x < 0.) then -.x else x;; 

(*let next3 x = (function 0 -> x | 1 -> x + 2 | 2 -> x + 1) (x mod 3);;*)
let next3 x = if (x mod 3 = 0) then x else if (x mod 3 = 1) then x + 2 else x + 1;; 

(*let is_a_letter n = (function true -> true | false -> false) ((n >= 'A' && n <= 'Z') || (n <= 'z' && n >= 'a'));;*)
let is_a_letter n = if ((n>= 'A' && n <= 'Z') || (n <= 'z' && n >= 'a')) then true else false;;

(*let string_of_bool = function true -> "true" | false -> "false";;*)
let string_of_bool s = if (s = true) then "true" else "false";;

