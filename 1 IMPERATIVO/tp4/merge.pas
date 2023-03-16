
program merge;
const
	dimF = 12;
	
type
	prestamo = record
		isbn: integer;
		numSocio: integer;
		dia: integer;
		mes: integer;
		cantDiasPrestado: integer;
	end;
	lista = ^nodo
	nodo = record
		dato: prestamo;
		sig: lista;
	end;
	
	arrListas = array [1..dimF] of lista;
	
	
	
	
procedure generarVectorListas (var arr: arrListas);

	procedure iniciarArray (var arr: arrListas);
	var
		i: integer;
	begin
		for i:=1 to dimF do
			arr[i]:= nil;
		end;
	end;
		
	procedure leerPrestamo (var P:prestamo);
	begin
		writeln('Ingrese el numero de ISBN');
		readln(P.isbn);
		if (P.isbn <> -1) then begin
			writeln('Ingrese el numeor de socio');
			readln(P.numSocio);
			writeln('Ingrese el dia del prestamo');
			readln(P.dia);
			writeln('Ingrese el mes del prestamo');
			readln(P.mes);
			writeln('Ingrese la cantidad de dias prestado');
			readln(P.cantDiasPrestado);
		end;
	end;
	
	procedure insertarOrdenado (var L:lista ; P: prestamo);
	var
		anterior, actual, nuevo: lista;
	begin
		new (nuevo);
		nuevo^.dato:= P;
		anterior:= L;
		actual:= L
		while (actual <> nil) and (actual^.dato.isbn < P.isbn) then begin
			anterior:= actual;
			actual:= actual^.sig;
		end;
		if (actual = anterior) then
			L:= nuevo;
		else
			anterior^.sig:= nuevo
		nuevo^.sig:= actual;
	end;
		
var
	P: prestamo;
begin
	iniciarArray(arr);
	leerPrestamo(P);
	while (P.isbn <> -1) do begin
		insertarOrdenado(arr[P.mes],P);
		leerPrestamo(P);
	end;
end


procedure mostrarVectorLista(arr:arrListas);
	procedure mostrarListasRecursiva(l:lista);
	begin
	if (l<>nil) then 
		begin
		writeln(l^.dato.isbn);
		writeln(l^.dato.numSocio);
		mostrarListasRecursiva(l^.sig);
		end;
	end;

var
i:integer;
begin
 for i:= 1 to dimF do
 begin
 writeln('Mes ',i, ' :'); 
 mostrarListasRecursiva(arr[i]);
 end;
end;


procedure merge (arr: arrListas ; L: lista);

begin
	minimo(arr, min)
end;





var
	arr: arrListas;
	LM: lista
BEGIN
	LM:= nil;
	generarVectorListas(arr);
	mostrarVectorLista(arr):
	merge (arr, LM);
	
END.

