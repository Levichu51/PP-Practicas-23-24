let rec sumto n = (function true -> 0 | false -> n + (sumto (n-1))) (n <= 0);;

let rec exp10 = ((function 0 -> 1 | n -> 10 * (exp10 (n - 1))));; 

let rec num_cifras n = (function true -> 1 | false -> ((function true -> num_cifras(-n) | false -> 1 + num_cifras(n / 10)) (n < 0))) ((n < 10) && (n >= 0));;

(*let rec sum_cifras n = (function true -> n | false -> (n mod 10) + sum_cifras(n / 10)) (n < 10);;*)

let rec sum_cifras n = (function true -> n | false -> ((function true -> sum_cifras(-n) | false -> (n mod 10) + sum_cifras(n / 10)) (n < 0))) ((n < 10) && (n >= 0));;










