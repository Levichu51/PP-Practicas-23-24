
type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree;;


let rec in_order = function
	Empty -> []
  	| Node (f, lc, rc) -> 
  		in_order lc @ (f :: in_order rc);;



let rec insert ord tree x =
	match tree with
	Empty -> Node (x, Empty, Empty)
	| Node (v, l, r) ->
	    	if ord x v then
	      	   Node (v, insert ord l x, r)
    		else
      	 	   Node (v, l, insert ord r x);;




let rec bst ord lst =
	let rec insert_list tree = function
	 [] -> tree
	 | h :: t -> insert_list (insert ord tree h) t
  							in
 							insert_list Empty lst;;
 		


let bst ord lst = List.fold_left (insert ord) Empty lst;;


let qsort ord lst =
	let bst_tree = bst ord lst in
 		 in_order bst_tree;;



	



	







































