let is_prime n =
let rec aux i =
		i >= n || (n mod i <> 0 && aux (i + 1))
							in aux 2;;

let rec next_prime n =
  if n <= 1 then
    next_prime 2
  else if is_prime (n + 1) then
    n + 1
  else
    next_prime (n + 1);;
    
let rec last_prime_to n =
  if n <= 1 then
    next_prime 2
  else if is_prime (n) then
    n
  else
    last_prime_to (n - 1);;
    

let is_prime2 n =
  let rec aux i =
    (i * i > n) || (n mod i <> 0 && aux (i + 1)) in
    						   n > 1 && aux 2;;
	
    




























