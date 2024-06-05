let next (x, y) =
  if (x + y) mod 2 = 0 then  
    if x = 1 then (x, y + 1)  
    else (x - 1, y + 1)  
  else 
    if x = 1 then (x + 1, y - 1) 
    else if y = 1 then (x + 1, y)
    else (x + 1, y - 1);;
  
  
    
let rec steps_from (x, y) n =
  if n = 0 || n < 0 then (x, y)
  else if x < 0 || y < 0 then (0,0) (* no valido *)
  else steps_from (next (x, y)) (n - 1);;


let rec pair n =
  if n = 1 then (1, 1) 
  else if n <= 0 then (0,0) (* no valido *) 
  else next (pair (n - 1));;



let pair_i p =
	let rec find i =
	if pair i = p then i
		else find (i+1)
			in find 1;;
			
			
(*let crono f x = let t = Sys.time () in let _ = f x in Sys.time () -. t;;*)
	
	
(* pair_i (12, 130) tardó - : float = 2.51042399999999954 segundos *)
(* pair_i (100, 101) tardó - : float = 10.257192 segundos *)	
	
(* La razón principal de los tiempos de ejecución más largos para pares más grandes podría ser el enfoque de búsqueda lineal utilizado en pair_i.

La complejidad de tiempo de una búsqueda secuencial es lineal, lo que significa que el tiempo de ejecución aumenta linealmente con el tamaño de la entrada. Dado que pair_i busca desde el índice 1 y continúa hasta encontrar el par deseado, el tiempo de ejecución puede crecer significativamente con pares más grandes.

Para el caso de pair_i (12, 130), se podría decir que el tiempo es menor porque se encuentra relativamente temprano en la secuencia generada por pair. Mientras que para pair_i (100, 101), el índice es más alto, lo que implica que la función debe realizar más iteraciones antes de encontrar el par deseado, lo que lleva a un tiempo de ejecución más largo. *)
	

 let pair_i' p =
  let rec find i last_pair =
    if last_pair = p then i
    else find (i + 1) (next last_pair)
  in
  find 1 (pair 1);;  (*funcion mejorada*)
  
(* pair_i (12, 130) tardó - : float = 0.00075099999999928 segundos *)
(* pair_i (100, 101) tardó - : float = 0.00148899999999940746 segundos *)	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
