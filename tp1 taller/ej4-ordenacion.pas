{4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, 
código de rubro (del 1 al 8) y precio. Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada.
 El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. 
Considerar que puede haber más o menos de 30 productos del rubro 3. 
Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado.
}

Program ej4-ordenacion.pas;

Const 
  dimF = 8;

Type 
subrango3 = 1..30;
  producto = Record
    codigo = integer;
    rubro = 1..dimF;
    precio = real;
  End;

lista = ^nodo;
nodo = record
dato : producto;
sig : lista;
end;
arrLista = array [1..rango] of lista;
arrProdRubro3 = array [subrango3] of producto;


Procedure leerProducto(car p: producto);
Begin
  writeln('ingrese el precio');
  readln (p.precio);
  If (p.precio <> 0) Then
    Begin
      writeln('ingrese el codigo');
      readln (p.codigo)
      writeln('ingrese el rubro');
      readln(p.rubro);
    End;
End;

Procedure insertarOrdenado(Var L:lista; p:producto);
Var 
  nue: lista;
  act, ant: lista; {punteros auxiliares para recorrido}
Begin
  new (nue);
  nue^.dato := j;
  act := L; {ubico act y ant al inicio de la lista}
  ant := L;
  While ( act <> Nil)And(p.codigo > act^.dato.codigo) Do { el orden va a ser por el codigo de producto}
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then {al inicio o lista vacía}
    L := nue;
  Else {al medio o al final}
    ant^.sig := nue;
  nue^.sig := act;
End;


Procedure cargarVectorListas (Var arr:arrLista);
Var 
  P: producto;
Begin
  leerProducto(P);
  While (P.precio <> 0) Do
    Begin
      insertarOrdenado (arr[P.rubro], P);
      leerPelicula(P);
    End;
End;

Procedure inicializarLista(Var arr:arrLista);
Var 
  i: integer;
Begin
  For i:=1 To dimF Do
    arr[i] := nil;
End;

procedure verLista (L:lista);
begin
  while (L <> nil) do begin
    write ('Codigo: 'L^.dato.codigo);
    writeln ('    Precio: 'L^.dato.precio);
    L:= L^.sig;
  end;
end;

procedure cargarArrProdRubro3(l:lista ; var a:arrProdRubro3;var dl :integer;);
begin
  while (l <> nil) and (dl < 30) do begin
dl := dl+1;
    a[dl] := l^.dato;
l:= l^.sig;
  end;
  if (dl=30)then
  writeln ('Dimension logica agotada(se llego a los 30 productos)');
end;


procedure recorrerVect(a:arrLista; var a2:arrProdRubro3; var dimL: integer;);
var
i: integer;
begin
for i:=1 to dimF do begin
    writeln ('PRODUCTOS DEL RUBRO N* ',i);
    verLista(a[i]);
end;    
    cargarArrProdRubro3 (a[3],a2,dimL);

end;


var
arrProd : arrLista;
arrRubro3 : arrProdRubro3; 
dl:integer;
begin
dl:=0;
inicializarLista(arrProd);
cargarVectorListas(arrLista);
recorrerVect(arrLista,arrRubro3,dl);
ordenInsercion(arr)
end.