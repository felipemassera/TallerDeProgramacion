{
 6.- Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba 
 * el equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa el número 0 (cero). 
}


program ej6;

type
	arrB = array [1..8] of integer;
	
	
	
	

procedure enBinarioEs (num: integer ; aux: integer);
begin
	if (num <> 0) then begin
		aux:= num;
		num:= num div 2;
		enBinarioEs(num, aux);
		write(aux mod 2);
	end;
end;


var
	num: integer;
	aux: integer;
BEGIN	
	writeln('Ingrese el numero que desea transcribir a su equivalente binario');
	readln(num);
	aux:= 0;
	enBinarioEs(num, aux);
END.

