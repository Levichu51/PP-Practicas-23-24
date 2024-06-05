
  
let length l =
	let c = ref 0 in
	let l_2 = ref l in
	  while !l_2 <> [] do
    	    c := !c + 1;
    	    l_2 := List.tl !l_2
  	done;
  	!c;;



let last l =
	match l with
	  [] -> failwith "Last Fail"
	  | _ ->
    		let last_element = ref (List.hd l) in
    		let num = ref (List.tl l) in
    	while !num <> [] do
         last_element := List.hd !num;
         num := List.tl !num
    done;
    !last_element;;



let nth l n =
	if n < 0 then
    	  failwith "Nth: negative value"
  	else
    	   let aux = ref 0 in
    	   let res = ref None in
    	   let l_ref = ref l in
    	while !aux <= n && !l_ref <> [] do
      	  if !aux = n then
            res := Some (List.hd !l_ref);
            aux := !aux + 1;
            l_ref := List.tl !l_ref
    done;
    	match !res with
    	 Some a -> a
    	 | None -> failwith "Nth";;
    
 
 
 
let rev l =
	let res = ref [] in
  	let l_ref = ref l in
  		while !l_ref <> [] do
    		  res := List.hd !l_ref :: !res;
    	 	  l_ref := List.tl !l_ref
  	done;
  	!res;;
 
 
let append l1 l2 =
	let res = ref l1 in
	let l2_ref = ref l2 in
		  while !l2_ref <> [] do
    		    res := List.hd !l2_ref :: !res;
    		    l2_ref := List.tl !l2_ref
  	done;
  	!res;;
  
  
let concat l =
	let res = ref [] in
	let l_ref = ref l in
		while !l_ref <> [] do
	          res := append !res (List.hd !l_ref);
    	      	  l_ref := List.tl !l_ref
  	done;
  	!res;;
  
  
let for_all f l =
	let res = ref true in
	let l_ref = ref l in
		while !res && !l_ref <> [] do
	         res := f (List.hd !l_ref);
    		 l_ref := List.tl !l_ref
  	done;
  	!res;;


let exists f l =
	let res = ref false in
	let l_ref = ref l in
		while not !res && !l_ref <> [] do
	         res := f (List.hd !l_ref);
    	 	 l_ref := List.tl !l_ref
  	done;
  	!res;;
  
  
  
let find_opt f l =
	let res = ref None in
	let l_ref = ref l in
		while !res = None && !l_ref <> [] do
    			if f (List.hd !l_ref) then
      			  res := Some (List.hd !l_ref);
    			  l_ref := List.tl !l_ref
  	done;
  	!res;;

  
  
  
let iter f l =
	let l_ref = ref l in
  	  while !l_ref <> [] do
    	    f (List.hd !l_ref);
    	    l_ref := List.tl !l_ref
  done;;
  
  
let fold_left f aux l =
	let res = ref aux in
	let l_ref = ref l in
		while !l_ref <> [] do
    		  res := f !res (List.hd !l_ref);
    		  l_ref := List.tl !l_ref
  	done;
  	!res;;
  
  
  
  
  
  
  

