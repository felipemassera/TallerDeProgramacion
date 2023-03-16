{1.	 Una biblioteca nos ha encargado procesar la información de los préstamos realizados durante cada el año 2021.
 De cada préstamo se conoce el ISBN del libro, el número de socio, día y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a.	Un módulo que lea préstamos y retorne en una estructura adecuada la información de los préstamos organizada por mes.
 Para cada mes, los préstamos deben quedar ordenados por ISBN.La lectura de los préstamos finaliza con ISBN -1.
b.	Un módulo recursivo que reciba la estructura generada en a. y muestre, para cada mes, ISBN y numero de socio.
c.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura con todos los préstamos ordenados por ISBN.
d.	Un módulo recursivo que reciba la estructura generada en c. y muestre todos los ISBN y número de socio correspondiente.
e.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN
 aparezca una vez junto a la cantidad total de veces que se prestó durante el año 2021.
f.	Un módulo recursivo que reciba la estructura generada en e. y muestre su contenido.}

program tp3Ej1; 
const
    dimF = 12;
type 
    libro = record
      isbn :integer;
      nSocio: integer;
      dia:integer;
      mes:integer;
      cantDias:integer;
    end;
    lista = ^nodo;
    nodo= record
        dato: libro;
        sig:lista;
    end;
    vector = array [1..dimF] of lista;
    libro2 = record
      isbn :integer;
      cantDias:integer;
    end;
    lista2 = ^nodo2;
    nodo2= record
        dato: libro2;
        sig:lista2;
    end;
// 
procedure incisoA (var v: vector);
   
    procedure insertarOrdenado(var l: lista; li: libro);
    var
      nue,act,ant : lista;
    begin
       new(nue);
      nue^.dato:= li;
      nue^.sig:= nil;
      ant:= l; act:=l;
      if (l=nil) then  
        l:=nue
      else while (act <> nil) and (act^.dato.isbn< li.isbn) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if(ant = act) then
            l:= nue
        else 
            ant^.sig:= nue; 
        nue^.sig:= act;
        
    end;


    procedure leerLibroAutomatico(var l : libro);
    begin
        l.isbn:=random(100);
        if (l.isbn<>0)then begin
        l.nSocio:= random(200);
        l.dia:= random(30);
        l.mes:= random(12);
        if (l.mes = 0 ) then
        l.mes:=12;
        l.cantDias:= random(50);
        end;
     end;

    procedure cargarVector(var v: vector);
    var
      l:libro;
    begin
      Randomize;
      leerLibroAutomatico(l);
      while (l.isbn<>0) do begin //el original era cuando sea la lectura =-1 pero prefiero igresar datos #random
        insertarOrdenado(v[l.mes],l);
        leerLibroAutomatico(l);
      end;
    end;

     Procedure inicializoVector(Var v: vector);
    var
        i:integer;
    begin
        for i:= 1 to dimF do
            v[i]:= nil;
    end;

 begin //programa INCISO A
  inicializoVector(v);
  cargarVector(v);
end;
//
procedure merge(v: vector; var l: lista); 
 procedure agregarAtras(var l, ult : lista; li:libro);
  var
  nue: lista;
  begin
   new(nue);
   nue^.dato:= li;
   nue^.sig:= nil;
   if (l=nil) then
     l:= nue
   else
     ult^.sig:= nue;
   ult:= nue; //asigna la direccion donde esta el nuevo dato


 end;
 procedure minimo (var v:vector; var li: libro);
  var
   i, indiceMin: integer; 
  begin
    li.isbn:= 9999;
    for i:=1 to dimF do
        if(v[i]<>nil) then
          if (v[i]^.dato.isbn< li.isbn) then begin
            indiceMin := i;
            li:= v[i]^.dato;
          end;
    if (li.isbn<>9999) then
        v[indiceMin]:= v[indiceMin]^.sig;
 end;
 var
  li: libro;
  actual:integer;
  ult: lista;
 begin
   ult:= nil;
   minimo(v,li);
   while (li.isbn<>9999) do begin
     actual:= li.isbn;
     while (li.isbn <>9999) and (li.isbn = actual) do begin
        agregarAtras(l,ult,li);
        minimo(v,li);
     end;
   end;
end;


procedure mostrarV(v:vector);
    procedure mostrarL(l:lista);
    begin
      if(l<>nil) then begin
        writeln('isbn: ',l^.dato.isbn,'. Num Socio: ',l^.dato.nSocio,'.');
        mostrarL(l^.sig);
      end;
    end;

 var 
  i:integer;
 begin
  for i:= 1 to dimF do begin
    writeln('Mes ',i,':');
    mostrarL(v[i]);
    end;
end;

Procedure mostrarL(l:lista);
 Begin
  If (l<>Nil) Then
    Begin
      writeln('isbn: ',l^.dato.isbn,'. Num Socio: ',l^.dato.nSocio,'.',' Dias PRESTADOS TOTALES: ',l^.dato.cantDias,'.');
      mostrarL(l^.sig);
    End;
End;

procedure mergeAcumulador(v: vector; var l: lista2);
 
 procedure agregarAtras(var l,ult:lista2; isbn,totDias:integer);
  var
   nue:lista2;
  begin
    new(nue);
    nue^.dato.isbn:= isbn;
    nue^.dato.cantDias:= totDias;
    nue^.sig :=nil;
    if(l= nil)then
      l:= nue
    else
      ult^.sig:=nue;
    ult:=nue;
 end;

  procedure minimo(var v: vector;var l: libro2);
   var 
    indiceMin,i: integer;  
   begin
    l.isbn:= 9999;
    for i:= 1 to dimF do begin
      if (v[i]<>nil) then
        if(v[i]^.dato.isbn < l.isbn) then begin
          l.isbn:= v[i]^.dato.isbn;
          l.cantDias:= v[i]^.dato.cantDias;
          indiceMin:=i;
        end;
    end;       
      if (l.isbn<>9999) then
        v[indiceMin]:=v[indiceMin]^.sig;
  end;

  var
    ult: lista2;
    totDias,actual: integer;
    li: libro2;
  begin
    ult:= nil;
    minimo(v,li);
    while (li.isbn <> 9999) do begin
      actual:= li.isbn;
      totDias:=0;
      while (li.isbn <> 9999) and (li.isbn = actual) do begin
        totDias:= totDias + li.cantDias;
        minimo(v,li);
      end;
    agregarAtras(l,ult,actual,totDias);
  end;
end;

Procedure mostrarL2(l:lista2);
Begin
  If (l<>Nil) Then
    Begin
      writeln('isbn: ',l^.dato.isbn,'. Dias PRESTADOS TOTALES: ',l^.dato.cantDias,'.');
      mostrarL2(l^.sig);
    End;
End;

{PROGRAMA PRINCIPAL}
var
v: vector;
l:lista;
l2:lista2;
begin
    l:=nil;
    l2:=nil;
    incisoA(v);
    //IncisoB
    writeln('   MUESTRO LISTAS x MES');
    mostrarV(v);
    //IncisoC
    merge(v,l);
    //IncisoD
    writeln('   MUESTRO LISTA MERGE');
    mostrarL(l);
    //IncisoE
    mergeAcumulador(v,l2);
    writeln('   MUESTRO LISTA MERGE ACUMULADORA');
    mostrarL2(l2);
end.