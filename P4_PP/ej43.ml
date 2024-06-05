let rec num_cifras n = (function true -> 1 | false -> ((function true -> num_cifras(-n) | false -> 1 + num_cifras(n / 10)) (n < 0))) ((n < 10) && (n >= 0));;

let rec exp10 = ((function 0 -> 1 | n -> 10 * (exp10 (n - 1))));; 

let rec reverse x = (function true -> 0 | false -> (x mod 10) * (exp10 (num_cifras x - 1)) + reverse (x / 10)) (x <= 0);;

let rec palindromo s =
  let len = String.length s in
  if len <= 1 then
    true
  else if s.[0] = s.[len - 1] then
    palindromo (String.sub s 1 (len - 2))
  else
    false
;;

let rec mcd (x, y) = (function true -> x | false -> mcd (y, x mod y)) (y = 0);;





















