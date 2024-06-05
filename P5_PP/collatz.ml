let f n =
    if n mod 2 = 0 then n / 2
    else 3 * n + 1;;

let rec orbit n =
  if n = 1 then
    "1"
  else
    (string_of_int n) ^ ", " ^ orbit (f n);;


let rec length n=
    if n = 1 then 0
    else 1 + length(f n);;


let rec top n=
    if n = 1 then 0
    else max n (top(f n));;
    

let rec length'n'top n =
    if n = 1  then (0,1)
    else let p, t = length'n'top (f n)
    in (p + 1, max n t);;

let rec longest_in m n=
    let rec aux i=
        if i <= m then (m, length m)
        else let (j, k) = 
        	aux (i - 1) in
        		let l = length i in
        			if k >= l then (j, k) else (i, l)
    							in (aux n);;


let rec highest_in m n=
    let rec aux i=
        if i <= m then (m, top m)
        else let (j, k) = 
        	aux (i - 1) in
        		let t = top i in
        			if t > k then (i, t) else (j, k)
      							in  (aux n);;
