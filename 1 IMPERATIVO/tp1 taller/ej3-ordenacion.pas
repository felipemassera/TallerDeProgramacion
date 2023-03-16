{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.
}

program ej3;
const
	dimF= 8;
type
pelicula = record
    codigo:integer;
    codigoGenero:integer;
    puntaje:real;

end;

lista = ^nodo;
nodo = record
    dato:pelicula;
    sig:lista;
end;

arrLista = array [1..dimF] of lista;
arrMejorPeli = array [1..dimF] of pelicula;


procedure leerPelicula (var P:pelicula);
begin
    writeln('Ingrese el codigo de la pelicula');
    readln(P.codigo);
    if (P.codigo <> -1) then
    begin
        writeln('Ingrese el codigo de genero de la pelicula');
        readln(P.codigoGenero);
        writeln('Ingrese el puntaje promedio de la critica');
        readln(P.puntaje);
    end;
end;

procedure agregarAtras (var L, ultimo:lista; valor:pelicula);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=valor;
    nuevo^.sig:=nil;
        if (L = nil) then
            L:=nuevo
        else
			ultimo^.sig:=nuevo;
		ultimo:=nuevo;
end;


procedure cargarVectorListas (var arr:arrLista);
var
    P:pelicula;
    arrUlt:arrLista;
begin
    leerPelicula(P);
    while (P.codigo <> -1) do begin
        agregarAtras(arr[P.codigoGenero],arrUlt[P.codigoGenero], P);
		leerPelicula(P);
	end;
end;



procedure inicializarLista(var L:lista; var arr:arrLista);
var
    i:integer;
begin
    L:=nil;
    for i:=1 to dimF do 
        arr[i]:=L;
end;


procedure verLista(L:lista);
var
	aux:integer;
begin
	aux:=1;
    while (L <> nil) do
    begin
		writeln(aux);
        writeln('CODIGO: ', L^.dato.codigo);
        writeln('Codigo de Genero: ', L^.dato.codigoGenero);
        writeln('Puntaje Promedio: ', L^.dato.puntaje:2:2);
        aux:=aux + 1;
        L:=L^.sig;
    end;
end;


procedure recorrerLista (L:lista; var P:pelicula);
var
    max:real;
begin
    max:=-1;
    while (L <> nil) do begin
        if (L^.dato.puntaje > max) then begin
            max:= L^.dato.puntaje;
            P:= L^.dato;
        end;
        L:=L^.sig;
    end;
end;


procedure recorrerVect (v:arrLista; var arrMejorPeli: arrMejorPeli);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        // verLista(v[i]); //CON ESTE PROCESO VEMOS LAS PELICULAS CARGADAS
        recorrerLista(v[i], arrMejorPeli[i]);
    end;
end;



Procedure ordenInsercion ( var v: arrMejorPeli);
var i, j: integer; actual: pelicula;	
		
begin
 for i:=2 to dimF do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) and (v[j].codigo < actual.codigo) do      // si '<' ordena de mayor a menor, sino, '>' menor a mayor.
       begin
         v[j+1]:= v[j];
         j:= j - 1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;

var
    L:lista;
    arr:arrLista;
    arr2: arrMejorPeli;
BEGIN
    inicializarLista(L, arr);
    cargarVectorListas(arr);
    recorrerVect(arr,arr2);
    ordenInsercion(arr2);
    writeln ('El codigo de pelicula con mayor puntaje es; ',arr2[1].codigo);
    writeln ('El codigo de pelicula con menor puntaje es; ',arr2[8].codigo);
END.
