{Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que la búsqueda de un producto
    por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..
b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.
d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro,
 la cantidad de productos con códigos entre los dos valores ingresados.}

 program tp5Ej3;
 const
 dimF = 10;
 type
   subrango = 1..10; 
   producto = record
     codP: integer;
     stock: integer;
     rubro: subrango;
     precio: real;
   end;
   arbol = ^nodo;
   nodo = record
     dato: producto;
     hi: arbol;
     hd: arbol;
   end;
   vector = array [1..dimF] of arbol;
   
procedure incisoA (var v: vector);

 procedure incicializarV( var v : vector);
  var
  i: integer;
  begin
    for i:=1 to dimF do
    v[i]:=nil;
  end;

 procedure leerP (var p: producto);
 begin
    p.codP:= random (99);
    if (p.codP <> 0) then begin 
      p.rubro:= random (11);
      if (p.rubro = 0) or (p.rubro = 11) then p.rubro:= 10;
      p.precio:= random (99);
      p.stock:= random (99);
    end;
 end;
 procedure insertarHoja (var a: arbol; p: producto);
  var 
  nue: arbol;
  begin
   new(nue);
    nue^.dato:=p;
    nue^.hi:= nil;
    nue^.hd:= nil;
    if (a=nil)then
     a:= nue
     else if (a^.dato.codP > p.codP) then insertarHoja(a^.hi,p)
     else insertarHoja(a^.hd,p);
  end;

 var
 p: producto;
 begin
  incicializarV(v);
  leerP(p);
  while (p.codP <>0) do begin
    insertarHoja(v[p.rubro],p);
    leerP(p);
 end;
end;

procedure incisoB(v:vector);

  function busqueda (a: arbol; codP: integer): boolean;
  begin 
    if (a = nil) then
      busqueda:= false
    else
      if (a^.dato.codP = codP) then busqueda:= true
      else
        if (a^.dato.codP > codP) then busqueda:= busqueda (a^.hi, codP)
        else
          busqueda:= busqueda (a^.hd, codP);
  end;


 var
  rubro, cod :integer;
 begin
  writeln ('Ingrese un Rubro');
  readln(rubro);
  writeln ('Ingrese un codigo a buscar');
  readln(cod);
  writeln ('Se encontro el dato? ', busqueda(v[rubro],cod));  
end;

procedure incisoC(v : vector);
 procedure maxCodigo(a:arbol; var codMax:integer; var stock: integer);
  begin
    if (a=nil)then begin
      codMax:=-999;
      stock:=0;
      end else if (a^.hd = nil) then begin
       codMax := a^.dato.codP;
       stock := a^.dato.stock;
      end else maxCodigo(a^.hd,codMax,stock);
  end;
  {cuerpo inciso C}
  var
   i,codP,stock : integer;
  begin
  for i:= 1 to dimF do begin
    maxCodigo(v[i],codP,stock);
    writeln ('RUBRO ',i, ':');
    writeln ('MAYOR CODIGO: ',codP, ' .Stock: ', stock);
  end;  
end;

Procedure incisoD (v: vector);

  Function comparar (num1: integer; num2: integer): boolean;
  Begin
    If (num1 < num2) Then
      comparar := true
    Else
      comparar := false;
  End;

  Function contarIntervalo (a: arbol; min: integer; max: integer): integer;
  Begin
    If (a = Nil) Then
      contarIntervalo := 0
    Else
      Begin
        If (a^.dato.codP >= min) And (a^.dato.codP <= max) Then
          Begin
            contarIntervalo := (1 + contarIntervalo (a^.hi, min, max) + contarIntervalo (a^.hd, min, max));
          End
        Else
          If (a^.dato.codP > max) Then
            contarIntervalo := contarIntervalo (a^.hi, min, max)
        Else if(a^.dato.codP < min) then
          contarIntervalo := contarIntervalo (a^.hd, min, max);
      End;
  End;

  Var 
    i, cod1, cod2: integer;
  Begin
    writeln ('Ingrese el primer numero del intervalo ');
    readln (cod1);
    writeln ('Ingrese el segundo numero del intervalo');
    readln (cod2);
    If (comparar (cod1, cod2)) Then
      For i:= 1 To dimf Do
        writeln ('La cantidad de productos del RUBRO ', i,
               ' que tienen codigo dentro de los valores del intervalo son: ',
               contarIntervalo (v[i], cod1, cod2))
      Else
        For i:= 1 To dimf Do
          writeln ('La cantidad de productos del RUBRO ', i,
                  ' que tienen codigo dentro de los valores del intervalo son: '
                   , contarIntervalo (v[i], cod2, cod1));
End;


 procedure mostrarV(v:vector);
  procedure mostrarA(a:arbol);
   begin
     if (a<>nil) then begin
       mostrarA(a^.hi);
       writeln ('CodProd: ',a^.dato.codP,'.Precio',a^.dato.precio:2:2, '. Stock disponible: ', a^.dato.stock);
       mostrarA(a^.hd);
     end;
   end;
  var
  i:integer;
  begin
    for i:= 1 to dimF do begin
     writeln('RUBRO ', i,':');
     mostrarA(v[i]);
     end;
  end;

{CODIGO PRINCIPAL}
var 
 v: vector;
begin
 incisoA(v);
 mostrarV(v);
 //incisoB(v);
 //incisoC(v);
 incisoD(v);
end.
