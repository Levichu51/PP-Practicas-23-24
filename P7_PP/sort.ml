
let rec insert x = function
    [] -> [x]
    | h :: t -> if x <= h then x :: h :: t
    else h :: insert x t;;


let rec isort = function
    [] -> []
    | h :: t -> insert h (isort t) ;;


let crono f x =
    let t = Sys.time () in
    let _ = f x in
    Sys.time () -. t;;


let bigl = List.init 1_000_000 (function x -> x + 1);;



let insert_t x l =
  let rec insert_acc lst_aux lst =
    match lst with
     [] -> List.rev (x :: lst_aux)
     | h :: t ->
     	 if x <= h then List.rev_append lst_aux (x :: h :: t)
     	 else insert_acc (h :: lst_aux) t
  								in
  								insert_acc [] l;;
  
  

let isort_t l =
  let rec isort_aux lst_aux lst =
    match lst with
     [] -> lst_aux
     | h :: t -> isort_aux (insert_t h lst_aux) t
  						   in
  						     isort_aux [] l;;

(*funcion de clase*)

let rlist n =
	let r = 4 * n in
	List.init n (fun _ -> Random.int r);;
		
		
let lc1 = List.init 10_000 (function x -> x + 1);;

let lc2 = List.init 20_000 (function x -> x + 1);;

let ld1 = List.init 10_000 (function x -> 10_000 - x);;

let ld2 = List.init 20_000 (function x -> 20_000 - x);;

let lr1 =
	let r = 4 * 10_000 in
	List.init 10_000 (fun _ -> Random.int r);;

let lr2 =
	let r = 4 * 20_000 in
	List.init 20_000 (fun _ -> Random.int r);;
	
(* 

crono isort lc1;;
- : float = 0.00126700000000001811

crono isort_t lc1;;
- : float = 3.409502

-----------------------------------

crono isort lc2;;  
- : float = 0.00360899999999997334

crono isort_t lc2;;
- : float = 17.0888070000000027

-----------------------------------

crono isort ld1;;  
- : float = 2.76761300000000077

crono isort_t ld1;;
- : float = 0.00431799999999782358

-----------------------------------

crono isort ld2;;  
- : float = 12.7195880000000052

crono isort_t ld2;;
- : float = 0.0041829999999976053

-----------------------------------

crono isort lr1;;  
- : float = 1.32845200000000574

crono isort_t lr1;;
- : float = 1.58506400000000269

-----------------------------------

crono isort lr2;;  
- : float = 5.933667

crono isort_t lr2;;
- : float = 7.58878099999999733


lc1, lc2):

Ambas listas están ordenadas de manera ascendente. En este caso, la función isort utiliza una estrategia de inserción simple que puede ser eficiente en listas ya parcialmente ordenadas. Por otro lado, la función isort_t utiliza una estrategia que implica reversión, lo cual puede ser menos eficiente para listas ordenadas.

ld1, ld2):

La función isort_t podría ser más eficiente en listas ordenadas de manera descendente. Dado que utiliza la inserción con reversión, en listas ordenadas de manera descendente, la inserción generalmente se realiza al final de la lista, lo cual es más eficiente.


lr1, lr2):

En este caso, la eficiencia de ambas funciones puede depender en gran medida de la aleatoriedad de la lista. La reversión en isort_t puede influir negativamente en el rendimiento, especialmente si la lista contiene segmentos ordenados.

lc2, ld2, lr2):

En general, el rendimiento de isort_t se ve más afectado por el número de inserciones y operaciones de reversión. En listas más largas y/o desordenadas, estas operaciones adicionales pueden acumularse, lo que lleva a un mayor tiempo de ejecución.

isort y insert_t:

La función isort realiza la inserción en la cabeza de la lista, mientras que insert_t realiza la inserción al final de la lista. La inserción en la cabeza (::) puede ser más eficiente en términos de tiempo que la inserción al final, especialmente en listas enlazadas

*)	
	
	



(*let rec g_sorted ord = function
	[] -> true
	| _ :: [] -> true
	| h1 :: h2 :: t -> ord h1 h2 && g_sorted ord (h2 :: t);; *)


let rec isort_g ord l =
  let rec insert_g x srt_l = 
      match srt_l with
        [] -> [x]
        | c :: c2 ->
          if ord x c then x :: c :: c2
          else c :: insert_g x c2
  in
      match l with
 	 [] -> []
  	 | h :: t -> insert_g h (isort_g ord t);;


let bigl2 = List.init 10_000_000 (function x -> x + 1);;


let split_t l =
  let rec split_aux acc1 acc2 l = 
     match l with
        h1 :: h2 :: t -> 
        	split_aux (h1 :: acc1) (h2 :: acc2) t
        | _ -> (List.rev acc1, List.rev acc2)
 							 in
 							 split_aux [] [] l;;



let merge_t (l1, l2) =
  let rec merge_aux accum l1 l2 = 
     match l1, l2 with
       [], _ -> List.rev_append accum l2
       | _, [] -> List.rev_append accum l1
       | h1 :: t1, h2 :: t2 ->
           if h1 <= h2 then merge_aux (h1 :: accum) t1 l2
           else merge_aux (h2 :: accum) l1 t2
  								in
 								 merge_aux [] l1 l2;;


let msort' l =
  let rec msort_aux l = 
     match l with
       [] | [_] -> l
       | _ ->
         let l1, l2 = split_t l in
         merge_t (msort_aux l1, msort_aux l2)
  						in
  						msort_aux l;;


let bigl3 = [];;



(*
Explicacion de por qué msort' no produce desbordamiento:

El compilador optimiza las llamadas recursivas para que no ocupen más espacio del necesario en la pila, permitiendo el procesamiento de listas de gran tamaño sin problemas. Esto es gracias a la optimizacion de cola que permite hacer las llamadas recursivas de manera eficiente*)

(* 

crono msort lc1;;
- : float = 0.022173

crono msort' lc1;;
- : float = 0.0190539999999999876

-----------------------------------

crono msort lc2;;
- : float = 0.037914

crono msort' lc2;;
- : float = 0.0401030000000000275

-----------------------------------

crono msort ld1;; 
- : float = 0.0165429999999999744

crono msort' ld1;;
- : float = 0.0181250000000000022

-----------------------------------

crono msort ld2;;
- : float = 0.034221

crono msort' ld2;;
- : float = 0.0358799999999999675

-----------------------------------

crono msort lr1;; 
- : float = 0.016567

crono msort' lr1;;
- : float = 0.0187110000000000332

----------------------------------

crono msort lr2;; 
- : float = 0.034248

crono msort' lr2;;
- : float = 0.0384229999999999849

Podemos observar unos tiempos muy parejos entre las funciones.


lc1, lc2):

Ambas funciones (msort y msort') muestran tiempos de ejecución muy parecidos. Esto puede deberse a que la naturaleza de las listas ya ordenadas de manera ascendente favorece a los algoritmos de ordenación fusionada como el Merge Sort.

ld1, ld2):

Al igual que en el caso anterior, los tiempos de ejecución de msort y msort' son similares. La estructura recursiva y la estrategia de división y fusión del Merge Sort pueden manejar eficientemente listas ordenadas de manera descendente

lr1, lr2):

Nuevamente, los tiempos de ejecución de ambas funciones son comparables. Esto sugiere que la eficiencia de Merge Sort y su variante msort' se mantiene relativamente constante incluso para listas con elementos aleatorios.

msort vs. msort'):

Ambas funciones, msort y msort', muestran resultados similares en términos de tiempo de ejecución. Esto indica que la introducción de la función split_t y merge_t en msort' no ha afectado significativamente el rendimiento en comparación con la versión original msort

*)


let rec msort_g ord l =
  let rec split l =
    match l with
      [] | [_] -> l, []
      | h :: h2 :: tl -> 
           let l1, l2 = split tl in
                  h :: l1, h2 :: l2
  in
  let rec merge l1 l2 =
    match l1, l2 with
      [], l | l, [] -> l
      | x :: x2, y :: y2 ->
          if ord x y then x :: merge x2 (y :: y2)
          else y :: merge (x :: x2) y2
  in
  match l with
    [] | [_] -> l
    | _ -> let l1, l2 = split l in
       			    merge (msort_g ord l1) (msort_g ord l2);;









































