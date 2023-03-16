{Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
}
program tp2Ej3;

type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
end;


procedure IncisoA(var l:lista);

	Procedure agregarAdelante(var l: lista; x : integer);
		var
			nue:lista;
		begin
			new (nue);
			nue^.dato:=x;
			nue^.sig:= l;
			l:= nue;
		end;
	
	
	procedure cargarLista(var l: lista); 
	var
		x: integer;
	begin		
		
		x:= random(20);
		if (x<>0) then begin
			agregarAdelante(l,x);
			cargarLista(l);
		end else
		writeln('Fin de carga de Lista');	
	end;	
	
	procedure verLista(l:lista);
	begin
		if (l<>nil)then begin
		verLista(l^.sig);
		writeln(l^.dato);
		end;
	end;

	BEGIN
		Randomize;// se pone solo una vez al comienzodel programa. 
		cargarLista(l);	
		verLista(l);
		

END;

procedure incisoByC(l:lista);

	Procedure MaxyMin (l:lista; Var min, max:integer);
	Begin
  		If (l <> Nil) Then
    		Begin
      		If (l^.dato < min) Then
        		min := l^.dato;
      		If (l^.dato > max) Then
       			 max := l^.dato;
      		MaxyMin(l^.sig, min, max);
    		End;
	End;
	var
		min, max: integer;
	begin
		min := 999;
		max := -999;
  		MaxyMin(l,min,max);
  		writeln ('El menor num es: ',min,'. El mayor num es: ', max);
end;
procedure incisoD (l:lista);

	Function buscarNum (l:lista; x: integer): boolean;
		Begin
  		If (l = Nil) Then
    		buscarNum := false
  		Else
    	buscarNum:= ((x = l^.dato) Or (buscarNum (l^.sig, x)));// en este caso evalua la primera condiucion, cuando esta es true,
		//corta la ejecucion del bucle y transforma en TRUE las subsiguentes retornos de los llamados recursivos.
	End;

	
	var
	buscar: integer;
	begin
	writeln('Ingrese el valor a buscar.');
	read (buscar);
	writeln('Esta el numero buscado? ', buscarNum(l,buscar));
end;


var
l: lista;
BEGIN
	
	l:=nil;
	IncisoA(l);
	incisoByC(l);
	incisoD(l);
END.
