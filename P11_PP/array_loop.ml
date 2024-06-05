let append v1 v2 =
	let length1 = Array.length v1 in
	let length2 = Array.length v2 in
	let res = Array.init (length1 + length2) (fun i ->
    		   if i < length1 then 
    		      v1.(i)
    		   else v2.(i - length1)
  	) 
  	in
  	res;;
  
  
  
let sub v j length =
  Array.init length (fun i -> v.(j + i));;

let copy v =
  Array.init (Array.length v) (fun i -> v.(i));;
  
  
  
let fill v j length x =
	let v_length = Array.length v in
	  if (length < 0  || j < 0 || j + length > v_length) then
	     failwith "Invalid arg"
  	  else
    	     for i = j to j + length - 1 do
      		v.(i) <- x
    	done;;
    
    
    
let blit s sp d dp length =
	let sl = Array.length s in
  	let dl = Array.length d in
  	
  	   if (sp < 0 || dp < 0 || length < 0 || sp + length > sl || dp + length > dl) then
    	      failwith "Blit not a valid argument"
  	   else
    		for i = 0 to length - 1 do
      		   d.(dp + i) <- s.(sp + i)
    	done;;
  
  
  
let to_list v =
	let v_length = Array.length v in
  	let res = ref [] in
  	let i = ref (v_length - 1) in
  	   while !i >= 0 do
    	      res := v.(!i) :: !res;
    	   i := !i - 1
  	done;
  	!res;;
  
  
let iter f v =
	let length = Array.length v in
  	  for i = 0 to length - 1 do
    	     f v.(i)
  	done;;


let fold_left f aux v =
	let length = Array.length v in
  	let res = ref aux in
  	  for i = 0 to length - 1 do
    	    res := f !res v.(i)
  	done;
  	!res;;
  
  
let for_all f v =
	let length = Array.length v in
  	let res = ref true in

  	for i = 0 to length - 1 do
    	   res := !res && f v.(i)
  	done;
	!res;;
  
  
let exists f v =
	let length = Array.length v in
  	let res = ref false in

  	for i = 0 to length - 1 do
    	   res := f v.(i);
    	   if !res then
      	   raise Exit
      	   
  	done;
	!res;;


let find_opt f v =
	let length = Array.length v in
	let res = ref None in

	for i = 0 to length - 1 do
    	if f v.(i) then (
           res := Some v.(i);
	   raise Exit
        )
	done;

	!res;;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
