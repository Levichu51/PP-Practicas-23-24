
let is_valid_move m n visited obstacles (x, y) =
  x >= 0 && x < m && y >= 0 && y < n && not (List.mem (x, y) visited) && not (List.mem (x, y) obstacles);;

let tour m n obstacles start finish =
  let rec helper visited current =
    if current = finish then
      List.rev visited
    else
      let moves = [(1, 2); (1, -2); (-1, 2); (-1, -2); (2, 1); (2, -1); (-2, 1); (-2, -1)] in
      let next_moves = List.map (fun (dx, dy) -> (fst current + dx, snd current + dy)) moves in
      let valid_moves = List.filter (is_valid_move m n visited obstacles) next_moves in

      match valid_moves with
      | [] -> raise Not_found
      | next_move :: _ -> helper (next_move :: visited) next_move
  in
  helper [start] start;;



































