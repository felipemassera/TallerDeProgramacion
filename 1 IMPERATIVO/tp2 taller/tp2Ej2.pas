{.- Realizar un programa que lea números hasta leer el valor 0 e imprima,
 para cada número leído, sus dígitos en el orden en que aparecen en el número.
  Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido.
   Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}
   
 program Ej2tp2;
	
	procedure leerNumero(x:integer);
	
	begin
		if (x<>0) then begin
		leerNumero(x div 10);
		writeln(x mod 10);
		end;
	end;

 procedure punto2();
 var
	x:integer;	
 begin
	writeln('ingrese un numero');
	readln(x);
	if (x<>0) then begin
	leerNumero(x);
	punto2();	
	end;	
 end;

begin
	punto2();
end.
