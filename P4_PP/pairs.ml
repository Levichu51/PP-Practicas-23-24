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
    
   

    
    
    
    
    
    
    
    
    
    
    
    






























    
