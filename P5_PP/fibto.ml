let rec fib n = 
    if n <= 1 then n 
    else fib(n-1) + fib(n-2);;

let rec fibto n =
  if n = 0 then "0"
  else
    let rec aux a b =
      if a <= n then
        string_of_int(a) ^ "\n" ^ aux b (a + b)  
      else
        ""
    in
    aux 0 1;;
	

let rec prompt = 
    if (Array.length Sys.argv) = 2
    	then (fibto (int_of_string(Sys.argv.(1))))
    		else ("Error") in
    print_endline prompt;;




























