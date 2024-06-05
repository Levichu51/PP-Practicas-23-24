(*x - y;;*)
(*Mostrará un error, no están definida ni la x ni la y, Error: Unbound value x*)

let x = 1;;
(*x - y;;*)
(*se define el valor de x (1), pero sigue dando error dado que y no lo está, Error: Unbound value y*)

let y = 2;;
(*se define el valor de y (2)*)
x - y;;
(*mostrará el valor -1 por pantalla, la resta de x - y con sus valores 1 y 2, - ; int = -1*)

(*let x = y in x - y;;*)
(function y -> x - y) (x);;
(*motrará un 0, en esa definición local la x valdra lo mismo que la y anterior, 2, y hace la resta de x - y, que dará 0, - : int = 0*)

x - y;;
(*volverá a mostrar -1, lo anterior es una definición local, no afecta a las globales, - : int = -1*)

(*z;;*)
(*mostrara un error léxico, z no está definida, Error: Unbound value z*)

let z = x + y;;
(*asigna a z la suma de x + y, (1+2), val z : int = 3*)

z;;
(*imprimira el valor de z, 3, - : int = 3*)

let x = 5;;
(*asigna un nuevo valor a x, el 5, val x : int = 5*)

x + y;;
(*hace la suma de x + y, (5+2), - : int = 7*)

z;;
(*vuelve a imprimir 3, la redefincion anterior no afecta a las anteriores, se tendria que redefinir esta, - : int = 3*)

(*let y = 5 in x + y;;*)
(function y -> x + y) (x);;
(*hace 5 + 5, se suma el valor de x actual y el valor local de y que es 5, - : int = 10*)

x + y;;
(*vuelve a sumar 7, la definicion local anterior no afecta a las locales, - : int = 7*)

(*let x = x + y in let y = x * y in x + y + z;;*)
(function x -> (function y -> x + y + z) (x * y)) (x + y);;
(*imprime 24, define localmente la x como 7 luego la y como 7 * 2 y finalmente hace x + y + z, 7 + 14 + 3, - : int = 24*)
x + y + z;;
(*hace 5 + 2 + 3 = 10, - : int = 10*)

function x -> 2 * x;;
(*define una funcion que al pasarle un int devuelve su doble, - : int -> int = <fun>*)

(function x -> 2 * x) (2+1);;
(*hace el doble de 3, 6 , - : int = 6*)

(function x -> 2 * x) 2 + 1;;
(*hace el doble de 2, que es el mas cercano y suma 1, esto ocurre al no poner los parentesis, - : int = 5*)

let f = function x -> 2 * x;;
(*define f como la funcion que hace el doble de un entero, val f : int -> int = <fun>*)

f;;
(*devuelve el tipo de f, que es una funcion que va de int a int y hace el doble del int, - : int -> int = <fun>*)

f (2+1);;
(*devuelve 6, el doble de 2+1, - : int = 6*)

f 2 + 1;;
(*hace el doble de 2, que es el mas cercano y suma 1, esto ocurre al no poner los parentesis, - : int = 5*)

f x;;
(*hace el doble de 5, el valor de x, - : int = 10*)

let m = 1000;;
(*declara a m como 1000, val m : int = 1000*)

let g = function x -> x + m;;
(*define g como la funcion que suma a un int m, val g : int -> int = <fun>*)

g;;
(*devuelve el tipo de funcion que es g, que es de int a int, - : int -> int = <fun>*)

g 3;;
(*hace la suma de 3 + 1000, - : int = 1003*)

(*g 3.0;;*)
(*devuelve un error de tipos (sintáctico), Error: This expression has type float but an expression was expected of type int*)

let m = 7;;
(*define a m como 7, val m : int = 7*)

g 3;;
(*la definicion anterior no afecta a la funcion que lleva el valor anterior de m, seguira siendo 1003 el resultado, - : int = 1003*)

(*let istrue = function true -> true;;*)
(*define istrue como una funcion de tipo bool -> bool que pasa un valor true a true, no tiene en cuenta a false y puede llevar a errores, val istrue : bool -> bool = <fun>*)

(*istrue;;*)
(*muestra el tipo de istrue, que es de bool -> bool, - : bool -> bool = <fun>*)

(*istrue (1 < 2);;*)
(*devolvera true porque 2 es mayor que uno, pasa de true a true, - : bool = true*)

(*istrue (2 < 1);;*)
(*devolvera una excepcion porque la funcion no contempla el caso en el que sea false una sentencia, Exception: Match_failure ("//toplevel//", 1, 13).*)

(*istrue 0;;*)
(*saltara un error porque 0 no es de tipo bool, Error: This expression has type int but an expression was expected of type bool*)

(*let iscero_v1 = function 0 -> true;;*)
(*define iscero_v1 como una funcion que pasa de 0 a true, int (solo 0) -> bool (true), salatará una excepción porque solo contempla al 0, Warning 8: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched: 1 val iscero_v1 : int -> bool = <fun>*)

(*iscero_v1 0;;*)
(*devuelve true, - : bool = true*)

(*iscero_v1 0.;;*)
(*salta un error de tipos porque 0. es un float y solo acepta 0 de tipo int, iscero_v1 0.;;
Error: This expression has type float but an expression was expected of type int*)

(*iscero_v1 1;;*)
(*salta un error de excepcion, la funcion solo contempla al 0, Exception: Match_failure ("//toplevel//", 1, 16).*)

let iscero_v2 = function 0 -> true | _ -> false;;
(*define la funcion iscero_v2 como la funcion que si entra int 0 devuelve true y si le entra cualquier otro tipo int devuelve false, val iscero_v2 : int -> bool = <fun>*)

iscero_v2 0;;
(*devuelve true, le entra el int 0, - : bool = true*)

iscero_v2 1;;
(*devuelve false porque es un numero totalmente distinto a int 0, - : bool = false*)

(*iscero_v2 0.;;*)
(*devuelve un error de tipos, 0. es un float y esta funcion solo acepta int*)

let all_to_true = function true -> true | false -> true;;
(*define un funcion de tipo bool -> bool que devuelve siempre true dandole igual si entra un bool que es true o false*)

all_to_true (1 < 2);;
(*devuelve true, 1 < 2 es true y la funcion pasa de true -> true, - : bool = true*)

all_to_true (2 < 1);;
(*devuelve true aunque 2 < 1 sea false, la funcion pasa de false -> true, - : bool = true*)

(*all_to_true 0;;*)
(*salta un error de tipos, Error: This expression has type int but an expression was expected of type bool*)

let first_all_to_true = all_to_true;;
(*define first_all_to_true como la funcion all_to_true, val first_all_to_true : bool -> bool = <fun>
*)

let all_to_true = function x -> true;;
(*define all_to_true como la funcion que le entra cualquier tipo y devuelve un bool (true), val all_to_true : 'a -> bool = <fun>*)

all_to_true (1 < 2);;
(*devuelve true, pasa de bool -> bool en este caso, la funcion devuelve siempre true para cualquier tipo, - : bool = true*)

all_to_true (2 < 1);;
(*devuelve true aunque 2 < 1 sea falso, pasa de falso -> true esta funcion, - : bool = true*)

all_to_true 0;;
(*tambien devolvera true, ya que esta funcion admite todos los tipos, - : bool = true*)

(*first_all_to_true 0;;*)
(*salta un error de tipos, Error: This expression has type int but an expression was expected of type bool*)














