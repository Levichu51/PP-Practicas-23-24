
let come (i1, j1) (i2, j2) = 
	i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1);;

let compatible p l = 
	not (List.exists (come p) l);;
	
	
(*let queens n = 
	let rec completa path i j = 
		if i > n then path
		else if j > n then raise Not_found
		else if compatible (i, j) path
			then try completa ((i,j) :: path) (i + 1) 1 with
			     	Not_found -> completa path i (j + 1)
			else completa path i (j + 1)
		in completa [] 1 1;;
		*)
	

(*concatenamos las soluciones de la busqueda de las soluciones, usamos las funciones vistas en clase como referencia*)

let queens n =
  let rec completa path i j =
    if i > n then [path]
    else
      let rec other_path j =
        if j > n then []
        else
          	let candidate = (i, j) in
         	 if compatible candidate path then
		    let next_paths = completa (candidate :: path) (i + 1) 1 in
		    let rest_paths = other_path (j + 1) in
                                  			    next_paths @ rest_paths
                else
                  other_path (j + 1)
      					in
      					  other_path j
  							in
  							  completa [] 1 1;;



(*Vemos si se pueden comer usando las funciones de clase*)

		
let is_queens_sol n sol =
	let come (i1, j1) (i2, j2) =
		i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1)
  in
	let rec compatible p l =
		not (List.exists (come p) l)
  in
	let rec check_queens_sol sol =
		match sol with
    		   [] -> true
                  | q :: r ->  compatible q r && check_queens_sol r
 									 in
  									  List.length sol = n && check_queens_sol sol;;

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
