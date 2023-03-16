{4.	Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Implementar un programa que:
a.	Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento y monto.
 La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente. 
b.	Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.}

program tp4Ej4;
const
    dimf = 7;
type
    teatro = record
        dia: integer;
        codObra :integer;
        asiento: integer;
        monto: real;
    end;
    teatro2 = record
        codObra :integer;
        monto: real;
    end;
lista2 = ^nodo2;
nodo2 = Record
  dato: teatro2;
  sig: lista2;
End;
         
lista = ^nodo;
nodo= record
    dato: teatro;
    sig: lista;
end;
vector = array [1..dimf] Of lista;

procedure incisoA (var v: vector);
   
    procedure insertarOrdenado(var l: lista; t: teatro);
    var
      nue,act,ant : lista;
    begin
       new(nue);
      nue^.dato:= t;
      nue^.sig:= nil;
      ant:= l; act:=l;
      if (l=nil) then  
        l:=nue
      else while (act <> nil) and (act^.dato.codObra< t.codObra) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if(ant = act) then
            l:= nue
        else 
            ant^.sig:= nue; 
        nue^.sig:= act;
        
    end;


    procedure leerTeatroAutomatico(var t : teatro);
    begin
        t.dia:=random(8);
        if (t.dia>6)then
            t.dia:=7;
        t.codObra:= random(100);
        t.asiento:= random(100);
        t.monto:= random(200);
     end;

    procedure cargarVector(var v: vector);
    var
      t:teatro;
    begin
      Randomize;
      leerTeatroAutomatico(t);
      while (t.codObra<>0) do begin
        insertarOrdenado(v[t.dia],t);
        leerTeatroAutomatico(t);
      end;
    end;

     Procedure inicializoVector(Var v: vector);
    var
        i:integer;
    begin
        for i:= 1 to 7 do
            v[i]:= nil;
    end;

begin
  inicializoVector(v);
  cargarVector(v);
end;

procedure incisoB (v: vector; var l: lista2);
  procedure agregarAtras(var l,ult: lista2; vTot:real; codObra:integer);
  var 
    nue: lista2;
  begin
    new(nue);
    nue^.dato.codObra:= codObra;
    nue^.dato.monto:= vTot;
    nue^.sig:= nil;
    if (l=nil) then
      l:= nue
    else
        ult^.sig:= nue;
    ult:= nue;
  end;

  procedure minimo(var v: vector; var min: teatro2);
  var
    indiceMin,i: integer;
  begin
    min.codObra:= 9999;
    for i:=1 to 7 do
      if (v[i] <> nil) then //primero pregunta que sea diferente a nil
        if (v[i]^.dato.codObra < min.codObra) then begin
          indiceMin:= i;
          min.codObra:= v[i]^.dato.codObra;
          min.monto:= v[i]^.dato.monto;
        end;
      if (min.codObra<>9999) then
        v[indiceMin]:= v[indiceMin]^.sig;
  end;

  procedure mergeAcumulador(v: vector; var l:lista2); 
    var
      min: teatro2;
      ult: lista2;
      ventaTotal: real;
      actual: integer;
    begin
      ult:= nil;
      minimo(v,min);
      while (min.codObra<> 9999) do begin 
        ventaTotal:= 0;
        actual:= min.codObra;
        While (min.codObra<> 9999) and (min.codObra= actual) do begin //actual es el codigo de obra
          ventaTotal := ventaTotal + min.monto;
          minimo(v,min);  
      end;
      agregarAtras(l,ult,ventaTotal,actual);
    end;
  end;
begin
  mergeAcumulador(v,l);
end;
procedure mostrarV(v:vector);
    procedure mostrarL(l:lista);
    begin
      if(l<>nil) then begin
        writeln('Codigo de obra: ',l^.dato.codObra,'.Num Asiento: ',l^.dato.asiento,'. Monto: $',l^.dato.monto:2:2,'.');
        mostrarL(l^.sig);
      end;
    end;

var
  i:integer;
begin
  for i:= 1 to dimf do begin
    writeln('Dia ',i,':');
    mostrarL(v[i]);
    end;
end;

procedure mostrarL2(l:lista2);
begin
  if (l<>nil) then begin
    writeln('Codigo de obra: ',l^.dato.codObra,'. Monto: $',l^.dato.monto:2:2,'.');
    mostrarL2(l^.sig);
  end;
end;

  {programa principal}
var
  v:vector;
  l: lista2;
begin
  l:= nil;
  incisoA(v);
  writeln('MUESTRO LISTAS DEL VECTOR');
  mostrarV(v);
  incisoB(v,l);
  writeln('MUESTRO LISTA MERGE ACUMULADOR');
  mostrarL2(l);
end.