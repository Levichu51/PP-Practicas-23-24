let pi = 2. *. asin 1.;;
let p = function x -> 2. *. pi *. x;; 

let area = function x -> pi *. x *. x;;

let even x = (function true -> true | false -> false) (x mod 2 = 0);;

let absf = function x -> if (x < 0.) then ((x *.(-2.)) +. x) else x;;

let next3 x = (function 0 -> x | 1 -> x + 2 | 2 -> x + 1) (x mod 3);;

let is_a_letter n = (function true -> true | false -> false) ((n >= 'A' && n <= 'Z') || (n <= 'z' && n >= 'a'));;

let string_of_bool = function true -> "true" | false -> "false";;















