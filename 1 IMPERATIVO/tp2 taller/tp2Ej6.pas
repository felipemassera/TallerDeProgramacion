{Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba el equivalente en binario de un número decimal.
*  El programa termina cuando el usuario ingresa el número 0 (cero). 
Ayuda:  Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
* ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva?
*  Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}


program tp3Ej6;

procedure transformoEnBinario (num:integer);
var
    aux:integer;
begin
    if (num <> 0) then begin //cuando el num sea igual a 0 es nuestro caso base;
        aux:=num;
        num:= num div 2;
        transformoEnBinario(num);
        write(aux mod 2);
    end;
end;
procedure leer (var aux:integer);
begin
	writeln('Inserte el valor que quiere cambiar a bin');
    readln(aux);
    while (aux <> 0) do begin
        transformoEnBinario(aux);
        writeln();
        writeln('Inserte el valor que quiere cambiar a bin');
        readln(aux);
    end;
end;
var
    num:integer;
begin
    leer(num); //proceso que lee un numero 
end.

