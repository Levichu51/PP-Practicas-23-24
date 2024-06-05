let p = (1 + 1, asin 1.), true;;
(*se define p como un producto cartesiano, (int * float) * bool que da ((2, 1.57), true) | val p : (int * float) * bool = ((2, 1.57079632679489656), true)*)

let (x,y), z = p;;
(*define (x,y), z como p, o sea como un par en la que (x,y) tendra el primer valor del par de p e y tendra el boolenao de la otra componente| 
let (x,y), z = p;;
val x : int = 2
val y : float = 1.57079632679489656
val z : bool = true*)

let p1, p2 = p in let p11, _ = p1 in (p2, 2 * p11);;
(*let p1, p2 = p in: Descompone el valor de p en dos partes: p1 y p2.

let p11, _ = p1 in: Descompone el valor de p1 en dos partes: p11 y un valor no utilizado (usando _ para indicar que no se usa).

(p2, 2 * p11): Crea un nuevo par donde el primer elemento es p2 (el segundo elemento del par original p) y el segundo elemento es el resultado de multiplicar 2 por p11. Luego, el resultado global de toda la expresión es este nuevo par.*)
(*- : bool * int = (true, 4)*)

let f (x, y) = 2 * x + y;;
(*define f como un par que devolverá un int, el doble de la primera componente + la segeunda | - : int = 8*)

let f2 x y z = x + 2 * y + 3 * z;;
(*define f2 como una funcion que le entran 3 argumentos y devuelve un int que vale la 1ª componente + 2 * 2ª + 3 * la 3ª componente | val f2 : int -> int -> int -> int = <fun>*)

let g x y z = x (y, z);;
(*define g como una funcion que le entran 3 argumentos, una funcion y 2 valores de cualquier tipo que hace la función x aplicada al par (y, z)*)

g fst 1 "hola";;
(*obtienes el primer valor del par | - : int = 1*)

g snd fst true;;
(*obtienes el segundo valor del par | - : bool = true*)

g f 2 3;;
(*aplica la funcion f definida anteriormente con el par (2,3), devolverá 7 | - : int = 7*)

g (function (f, x) -> f (f x)) (function x -> x * x) 3;;
(*La expresión g (function (f, x) -> f (f x)) (function x -> x * x) 3 toma la función que aplica la otra función dos veces y la aplica a la función que calcula el cuadrado de un número (función x -> x * x) con el argumento 3. Esto se traduce en (3 * 3) * (3 * 3), que es igual a 81.
- : int = 81 *)

let x, y, z = 1, 2, 3;;
(*define x y z como 1 2 y 3 | 
val x : int = 1
val y : int = 2
val z : int = 3*)

f2 x y z;;
(*aplica la funcion f2 a los valores nuevos de x y z, devolverá 14 | - : int = 14*)

let swap (x, y) = y,x;;
(*define la funcion swap como la funcion que intercambia las componentes del par| val swap : 'a * 'b -> 'b * 'a = <fun>*)

let p = 1, 2;;
(*define p como un par (1, 2), tipo producto cartesiano | val p : int * int = (1, 2)*)

f p;;
(*aplica p a la funcion f, devolverá 4 | - : int = 4*)

let p = swap p in f p;;
(*redefine p como una funcion que aplica swap (intercambia de posicion las componentes del par) a p localmente y luego es aplicada a f, devolverá 5 porque cambia (1,2) a (2,1) | - : int = 5*)

f p;;
(*aplica p a la funcion f (la definicion anterior no afecta porque lo hace de una manera local, devolverá 4 | - : int = 4*)














