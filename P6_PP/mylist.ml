let hd = function
  [] -> raise (Failure "hd")
  | h::_ -> h;;

let tl = function
  [] -> raise (Failure "tl")
  | _::t -> t;;

(*let rec length l = 
	if l = [] then 0
	else 1 + length (tl l);;*)
	
let length ll =
	let rec aux (l, i) =
		if l = [] then i
		else aux (tl l, i + 1)
			in aux (ll, 0);;	(*funcion recursiva terminal*)
	

let rec compare_lengths l1 l2 = match l1, l2 with
  	[], [] -> 0
  	| [], h::t -> (-1)
  	| h :: t, [] -> 1
 	 | _ :: t1, _ :: t2 -> compare_lengths t1 t2;;
  
  
let compare_length_with l n =
  	let rec compare_length_with_aux l n =
   	 if n = 0 then
    		  if length l = 0 then 0
    			  else 1
   		 else
     		 match l with
     		 [] -> -1
     		 | _::t -> compare_length_with_aux t (n - 1)
  			in
  			    if n < 0 then
    				raise (Failure "error")
  					else
   					 compare_length_with_aux l n;;
 
 
let rec init n f =
 	 if n <= 0 then []
  		else f (n - 1) :: init (n - 1) f;;
  		

let rec nth l1 n = 
	if (n < 0) then raise (Failure "n not valid")
	   else let aux = function
	   	[] -> raise (Failure "Nth not possible")
	   	| h :: t -> (function 0 -> hd l1 | n -> (nth t (n - 1)))
	   		in aux l1 n;;
	   	
	

let rec append l1 l2 = match l1 with 
	[] -> l2
	| h :: t -> h :: append t l2;;
	

let rec rev_append l1 l2 = match l1 with
	[] -> l2
	| h :: t -> rev_append t (h :: l2);;
	
	
let rev l = rev_append l [];;

let rec concat = function 
	[] -> []
	| h :: t -> append h (concat t);;

	
let flatten = concat;;
	

let rec split l =
  	match l with
  	| [] -> ([], [])
  	| (x, y) :: t -> let x2, y2 = split t in
    					(x :: x2, y :: y2);;
    					
let rec combine l1 l2 =
       match (l1, l2) with
  	| [], [] -> []
  	| x :: x2, y :: y2 -> (x, y) :: combine x2 y2
  	| _, _ -> raise (Failure "combine");;
   
	    					

let rec map f l = 
	match l with
	[] -> []
	| h :: t -> f(h) :: map f t;;
	
	
let rec map2 f l1 l2 =
 	 match (l1, l2) with
  	 ([], []) -> []
  	 | (h1 :: t1, h2 :: t2) -> (f h1 h2) :: map2 f t1 t2
     	 | (_, _) -> raise (Failure "diferentes longitudes");;

	
let rev_map f l =
  	let rec rev_map_accumulator f l acc =
   		 match l with
    		 | [] -> acc
    		 | h :: t ->
     			 let result = f h in
      					rev_map_accumulator f t (result :: acc)
  							in
  							rev_map_accumulator f l [];;
	

let rec for_all f l =
  match l with
  [] -> true
  | h :: t -> if f h then for_all f t 
  				else false;;



let rec exists f l =
 	 match l with
  	[] -> false
  	| h :: t -> if f h then true 
  				else exists f t;;
	
let rec mem n l = 
	match l with
	[] -> false
	| h :: t -> if n = h then true
				else mem n t;;

let rec find n l =	
	match l with
	[] -> raise (Failure "not found")
	| h :: t -> if n h then h
				else find n t;;	
				
(*let rec filter f l =
 	 match l with
  	| [] -> []
  	| h :: t ->
   	 if f h then h :: filter f t
   				 else filter f t;;*)
   				 
let rec filter f l =
  	let rec filter_aux f2 acc = function
    	| [] -> rev acc
    	| h :: t -> if f h then filter_aux f (h :: acc) t
      				else filter_aux f acc t
 					 in
  					    filter_aux f [] l;;
  					    
 
(*let rec find_all f l =
  	match l with
  	| [] -> []
  	| h :: t ->
   	 if pred h then h :: find_all f t
   				 else find_all f t;;*)
   				 
   				 
let find_all f l =
  	let rec find_all_accumulator f l acc =
    		match l with
    		| [] -> rev acc
    		| h :: t ->
      			if f h then
       		 find_all_accumulator f t (h :: acc)
     			 else
       		 find_all_accumulator f t acc
  				in
  				find_all_accumulator f l [];;
  				
  				
let partition f l =
  	let rec partition_aux f l acc1 acc2 =
   		 match l with
    		 [] -> (rev acc1, rev acc2)
   		 | h :: t ->
    			  if f h then
       			 partition_aux f t (h :: acc1) acc2
      					else
      					  partition_aux f t acc1 (h :: acc2)
 						 in
  						   partition_aux f l [] [];;


let rec fold_left f n l = 
	match l with
	[] -> n
	| h :: t -> fold_left f (f n h) t;;
	
	
let rec fold_right f l n=				
  	match l with
	[] -> n
	| h :: t -> f h (fold_right f t n);;	
	
	
let rec assoc key l =
 	match l with
  	[] -> raise (Failure "no se encontro")
 	| (x, y) :: t ->
   		 if key = x then y
  			 	 else assoc key t;;

let rec mem_assoc key l =
  	match l with
  	[] -> false
  	| (x, _) :: t ->
    		if key = x then true
    			  	 else mem_assoc key t;;
    			  
let rec remove_assoc key l =
  	match l with
  	[] -> []
  	| (x, y) :: t ->
   		 if key = x then t
   				 else (x, y) :: remove_assoc key t;;
     				        
     				        
     				      
     
		     
		
