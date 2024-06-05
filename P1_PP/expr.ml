();;
(*se mostrará el tipo unit de la expresión*)
(*- : unit ()*)
2 + 5 * 3;;
(*devolverá el resultado de la operación sin problemas*)
(*- : int = 17*)
1.25 *. 2.0;;
(*devolverá el resultado de la operación, será tipo float*
*- : float = 2.5*)
(*2 - 2.0;;*)
(*error de tipos, 2.0 es float y 2 es tipo int, son incompatibles*)
(*3.0 + 2.0;;*)
(*error de tipos, hay que usar la expresion +. son float*)
5 / 3;;
(*devolverá el resultado de la división, pero con un número entero*
*- : int = 1*)
5 mod 3;;
(*devolverá 5 en módulo 3, de tipo int*
*- : int = 2 , calcula 5 en modulo 3*)
2.0 *. 3.0 ** 2.0;;
(*devolverá el resultado de la operación, será tipo float*
*- : float = 18.*)
2.0 ** 3.0 ** 2.0;;
(*devolverá el resultado de (3^2)^2 hace primero 3.0 ** 2.0 y luego 2.0 ** 9.0 (el resultado anterior) de tipo float*
*- : float = 512*)
sqrt;;
(*dirá el tipo de la función sqrt y la salida - : float -> float = <fun>*)
(*sqrt 4;;*)
(*4 no es un tipo float, error de tipos*)
int_of_float;;
(*mostrará como trabaja la función pasando de float a int, float -> int = <fun>*)
float_of_int;;
(*mostrará como trabaja la función pasando de int a float, int -> float = <fun>*)
3.0 = float_of_int 3;;
(*compara el float 3.0 con la conversion int 3 a float, - : bool = true*)
(*int_of_float -2.9;;*)
(*error sintáctico, debería ser (-2.9)*)
int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0 , hace 2-2*)
truncate;;
(*mostrará con que valor trabaja, trunca un float y se queda con la parte entera, pasando a int*)
truncate 2.1 + truncate (-2.9);;
(*- : int = 0 , trunca los dos numeros pasándolos a int por el decimal, haciendo 2-2*)
floor;;
(*mostrará el tipo que se tiene que usar para poder usar la función, - : float -> float = <fun>*)
floor 2.1 +. floor (-2.9);;
(*- : float = -1. , aproxima el valor de los float al float truncado mas cercano y los suma, 2. - 3. *)
ceil;;
(*dira el tipo que se tiene que usar, aproxima el float al número más cercano más alto, ej: 2.9 -> 3. , - : float -> float = <fun>*)
ceil 2.1 +. ceil (-2.9);;
(*- : float = 1. , ceil aproxima el float al numero mas alto más cercano exacto, 2.1 a 2 y -2.9 no iría a -3 que es más pequeño si no a -2., el float sin decimales más alto *)
int_of_char;;
(*devuelve el valor entero del carácter introducido, - : char -> int = <fun>*)
int_of_char 'A';;
(*devuelve el valor entero ASCII de 'A' , - : int = 65*)
char_of_int;;
(*devuelve el carácter del número introducido de la tabla ASCII, - : int -> char = <fun>*)
char_of_int 66;;
(*devuelve el carácter 66 de la tabla ASCII, - : char = 'B'*)
Char.code;;
(*devuelve el valor ASCII del carácter introducido, char -> int = <fun>*)
Char.code 'B';;
(*devuelve 66, el valor ASCII de 'B', - : int = 66*)
Char.chr;;
(*devuelve el carácter del int introducido de la tabla ASCII, int -> char = <fun>*)
Char.chr 67;;
(*devuelve 'C' el carácter 67 de la tabla ASCII, - : char = 'C'*)
'\067';;
(*devuelve el carácter ASCII 67, - : char 'C'*)
Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*muestra el carácter de la operación de los valores ASCII, - : char 'm'*)
Char.lowercase_ascii;;
(*pasa a minúscula el char introducido y lo devuelve*)
Char.lowercase_ascii 'M';;
(*devolverá 'm' al ser la minúsucula, - : char 'm'*)
Char.uppercase_ascii;;
(*pasa a mayúscula el char introducido y lo devuelve*)
Char.uppercase_ascii 'm';;
(*devolverá 'M' al ser la minúsucula, - : char 'M'*)
"this is a string";;
(*se mostrará otra vez el string, - : string = "this is a string"*)
String.length;;
(*devuelve la longitud int del string introducido, - : string -> int = <fun>*)
String.length "longitud";;
(*devuelve 8, la longitud de la cadena, - : int = 8*)
(*"1999" + "1";;*)
(*salta un error de tipos, no se pueden sumar tipos string *)
"1999" ^ "1";;
(*concatena los dos string devolviendo 19991, - : string = "19991" *)
int_of_string;;
(*devuelve el valor int del string, si el string es numérico*)
int_of_string "1999" + 1;;
(*devuelve el valor int del string, "1999" pasa a 1999 y se le suma 1, dando 2000, - : int = 2000*)
"\065\066";;
(*devuelve el string "AB", se concatena los valores ASCII de 65 y 66*)
string_of_int;;
(*devuelve un string de un valor int introducido*)
string_of_int 010;;
(*devuelve el string "10", - : string = "10"*)
not true;;
(*devuelve false, es una sentencia falsa (no es verdadero), - : bool = false*)
true && false;;
(*devuelve false por que nada es verdadero y falso a la vez, - : bool = false*)
true || false;;
(*devuelve true por que la sentencia es verdadera o falsa y cumple una de las dos condiciones al menos, - : bool = true*)
(1 < 2) = false;;
(*compara el resultado anterior (1 < 2) (true) con false, devolviendo false porque true no es false, - : bool = false*)
"1" < "2";;
(*compara las cadenas por orden, el carácter "1" tiene un valor Unicode menor que el carácter "2", entonces devuelve true, - : bool = true*)
2 < 12;;
(*devuelve true, 12 es mayor que 2, - : bool = true*)
"2" < "12";;
(*compara las cadenas por orden, el carácter "2" tiene un valor Unicode mayor que el carácter "1", entonces ya devuelve false porque "2" > "1", - : bool = false*)
"uno" < "dos";;
(*compara las cadenas por orden, el carácter "u" tiene un valor Unicode mayor que el carácter "d", entonces ya devuelve false porque "u" > "d", - : bool = false*)
if 3 = 4 then 0 else 4;;
(*devuelve 4 porque 3 no es igual a 4, - : int = 4*)
if 3 = 4 then "0" else "4";;
(*devuelve el string "4" porque 3 no es igual a 4, - : string = "4"*)
(*if 3 = 4 then 0 else "4";;*)
(*salta un error de incompatibilidad de tipos, la expresión devuelve int 0 si 3 = 4 si no un string, no son compatibles*)
(if 3 < 5 then 8 else 10) + 4;;
(*devuelve int 12 porque 5 es mayor que 3, entonces devuelve int 8 y se le suma int 4, - : int = 12*)












































































