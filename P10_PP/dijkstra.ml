

(*Implementación del algoritmo de Dijkstra, no se ha usado ninguna cola explícita al no conseguir que funcione*)

let dijkstra grafo =
	let num_nodos = Array.length grafo in
  	if num_nodos = 0 || num_nodos <> Array.length grafo.(0) then
   	  raise (Invalid_argument "La matriz no es cuadrada")
  	else
   	 let distancias = Array.make_matrix num_nodos num_nodos None in
   	 let visitados = Array.make num_nodos false in

   	 let rec iterar_dijkstra inicio =
     	 let actual = ref (-1) in
     	 let min_distancia = ref max_int in

      (*Encontrar el nodo que no se ha visitado con la menor distancia*)
     	 for i = 0 to num_nodos - 1 do
     	   match distancias.(inicio).(i) with
            | Some d when not visitados.(i) && d < !min_distancia -> (
              actual := i;
              min_distancia := d
            )
            | _ -> ()
        done;

     	 match !actual with
     	  -1 -> ()
     	  | actual ->
          visitados.(actual) <- true;

          (*Se actualizan las distancias entre ellos*)
            for destino = 0 to num_nodos - 1 do
              match grafo.(actual).(destino) with
                | Some peso ->
                  let nueva_distancia =
                    match distancias.(inicio).(actual) with
                      Some d -> d + peso
                      | None -> failwith "None no deseado"
                  in
                    if nueva_distancia < match distancias.(inicio).(destino) with
                      Some d -> d
                      | None -> max_int then (
                          distancias.(inicio).(destino) <- Some nueva_distancia
                     )
                      | _ -> ()
                 done;

          iterar_dijkstra inicio
    	in

    (*Ejecuta dijkstra para cada nodo como primer nodo*)
   	   for nodo_inicial = 0 to num_nodos - 1 do
    
      (*Se resetea cada nodo*)
     	 Array.fill visitados 0 num_nodos false;
     	 Array.fill distancias.(nodo_inicial) 0 num_nodos None;

      	distancias.(nodo_inicial).(nodo_inicial) <- Some 0;
      	iterar_dijkstra nodo_inicial;
      	
    	done;
    (*Se devuelve la matriz de distancias resultante*)
    
   	 distancias;;


(*No se utiliza una cola explícita para gestionar los nodos a visitar en el algoritmo de Dijkstra. En su lugar, se utiliza un enfoque más directo, recorriendo iterativamente todos los nodos para encontrar el nodo no visitado con la menor distancia actual.

La función iterar_dijkstra toma un nodo inicial y, en cada iteración, encuentra el nodo no visitado con la menor distancia desde el nodo inicial. Luego, actualiza las distancias entre el nodo inicial y los nodos adyacentes a través de este nodo seleccionado. Este proceso se repite hasta que todos los nodos hayan sido visitados o no haya nodos alcanzables desde el nodo inicial.

Aunque no se utiliza una cola explícita, el algoritmo aún sigue la lógica fundamental de Dijkstra al explorar gradualmente los nodos con las distancias más cortas. La implementación utiliza referencias mutables (actual y min_distancia) para realizar un seguimiento del nodo actual con la menor distancia, en lugar de una cola. En este caso, la cola implícita se representa mediante el bucle for que recorre los nodos y elige el siguiente nodo a visitar *)















