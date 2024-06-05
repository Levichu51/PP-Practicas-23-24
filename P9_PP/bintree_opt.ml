
open Bintree;;

let rec in_order = function
	Empty -> []
  	| Node (f, lc, rc) -> in_order lc @ (f :: in_order rc);;


(*funcion para ver si esta ordenada la lista de recorrido inorder*)
  	
let is_ordered ord lst =
	let rec is_ordered_aux = function
		[] | [_] -> true
		| h :: t :: tail -> ord h t && is_ordered_aux (t :: tail)
							  in
							  is_ordered_aux lst;;


let is_bst ord tree =
	let values = in_order tree in
  			is_ordered ord values;;

			
let bfs tree =
	let rec aux_bfs q accum =
		match q with
      		  [] -> List.rev accum
    		  | Empty :: tail -> aux_bfs tail accum
    		  | Node (v, l, r) :: tail ->
        			let queue = tail @ [l; r] in
        						     aux_bfs queue (v :: accum)
  											in
  											aux_bfs [tree] [];;


let bfs' tree =
	let rec aux_bfs q accum =
		match q with
    		  [] -> List.rev accum
    		  | Empty :: tail -> aux_bfs tail accum
    		  | Node (v, l, r) :: tail ->
        		let new_accum = v :: accum in
        			let queue = tail @ [l; r] in
        					             aux_bfs queue new_accum
  										    in
  										      aux_bfs [tree] [];;


(*determinar alturas para ver si es perfecto y casi completo*)

let height tree =
	let rec height_aux = function
		Empty -> 0
    		| Node (_, l, r) -> 1 + max (height_aux l) (height_aux r)
  									   in
  									     height_aux tree;;

let rec perfecto tree =
	let rec perfecto_aux d = function
		Empty -> d = 0
    		| Node (_, l, r) ->
        			height l = height r && perfecto_aux (d - 1) l && perfecto_aux (d - 1) r
  				in
  				  let tree_h = height tree in
  								  perfecto_aux tree_h tree;;



let casi_completo tree =
	let rec casi_completo_aux lvl = function
		Empty -> lvl = 0
		| Node (_, l, r) ->
        	    if lvl = 0 then false
        	    else
          		casi_completo_aux (lvl - 1) l && casi_completo_aux (lvl - 1) r
       in
	let rec casi_completo_aux2 d = function
		Empty -> true
		| Node (_, l, r) ->
        		casi_completo_aux2 (d - 1) r
       in
   	   let tree_h = height tree in
  				casi_completo_aux tree_h tree && casi_completo_aux2 tree_h tree;;











