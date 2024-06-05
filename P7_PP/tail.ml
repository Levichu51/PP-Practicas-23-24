
let to0from n =
  let rec tofrom_aux accum c = 
    if n < 0 then List.rev accum
    else tofrom_aux (c :: accum) (c - 1)
  				      	  in
  				            tofrom_aux [] n;;

	
	
let fromto h s =
  let rec aux_fromto accum c t = 
    if c > t then List.rev accum
      else aux_fromto (c :: accum) (c + 1) t
  						in 
  						  aux_fromto [] h s;;
	

let remove n lst =
  let rec remove_aux accum lst =
    match lst with
      [] -> List.rev accum
      | head :: tail ->
         if n = head then 
            List.rev_append accum tail
         else
            remove_aux (head :: accum) tail
  					     in
  					        remove_aux [] lst;;



let compress lst =
  let rec compress_aux accum lst2 = 
    match lst2 with
      head1 :: head2 :: tail ->
        if head1 = head2 then
          compress_aux accum (head2 :: tail)
        else
          compress_aux (head1 :: accum) (head2 :: tail)
    	   | lst2 -> List.rev_append lst2 accum
  							in
  							  compress_aux [] lst;;



let append' lst1 lst2 =
  let rec append_aux accum list1 list2 =
    match list1 with
      [] -> List.rev_append accum list2
      | head :: tail -> append_aux (head :: accum) tail list2
  							        in
  							          append_aux [] lst1 lst2;;
 
  							   
let map' func lst =
  let rec map_aux accum lst =
    match lst with
      [] -> List.rev accum
      | head :: tail -> map_aux (func head :: accum) tail
 							    in
  								map_aux [] lst;;



let rec fold_right' func lst accum =
  match lst with
    [] -> accum
    | head :: tail -> func head (fold_right' func tail accum);;

  
let incseg lst =
  let rec aux_in accum lst2 n =
    match lst2 with
      [] -> []
      | [head] -> List.rev ((head + n) :: accum)
      | head :: tail -> aux_in ((head + n) :: accum) tail (head + n)
  									in
  									  aux_in [] lst 0;;

  
  
  
  
  
  
  
  
  
  
  
  
