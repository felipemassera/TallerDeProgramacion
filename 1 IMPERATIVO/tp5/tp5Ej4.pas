

{ Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Se pide:
a)	Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento, monto. 
La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente.
b)	Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.
c)	Realice un módulo recursivo que informe el contenido de la lista generada en b)
 }

program tp5Ej4;
const 
  dimF = 7;
type
  dias= 1..7;
  entrada = record 
    dia : dias;
    cod: integer;
    asiento:integer;
    monto:real;
 end;
  lista = ^nodo;
  nodo = record
    dato: entrada;
    sig: lista;
  end;
  vector = array [1..dimF] of lista;
 
  entrada2 = record
    cant: integer;
    cod: integer;
  end;
  lista2 = ^nodo2;
  nodo2 = record
    dato: entrada2;
    sig: lista2;
  end;
//

procedure incisoA(var v: vector);

    procedure inicializar (var v: vector);
    var 
    i: integer;
    begin
        for i:= 1 to dimF do 
        v[i]:= nil;
    end; 

    procedure leerE (var e: entrada);
    begin 
      e.cod:=random(100);
      if (e.cod <> 0) then begin
        e.dia := random(8);
        if(e.dia = 0 ) or (e.dia =8 ) then e.dia:= 7;
        e.asiento := random(200);
        e.monto := random(2000);
      end;
    end;

    procedure insertarOrdenado(var l: lista ; e : entrada);
     var
      nue, ant,act :lista;
     begin
      new(nue);
      nue^.dato:= e;
      nue^.sig := nil;
      ant:= l; act :=l;
      if(l= nil) then
       l:= nue
      else
       while (act<>nil) and (act^.dato.cod<e.cod) do begin
         ant := act;
         act:= act^.sig;
       end;
       if(ant = act) then
        l:=nue
        else
          ant^.sig:=nue;
        nue^.sig:= act;
    end;   

 var
  e: entrada;
 begin 
  leerE(e);
  while (e.cod <>0) do begin
    insertarOrdenado(v[e.dia],e);
    leerE(e);
    
  end;
end;

procedure mostrarV(v: vector);

    procedure mostrarL (l: lista);
    begin
        if (l <> nil) then begin
          writeln (' Cod: ', l^.dato.cod,' .Asiento: ', l^.dato.asiento ,' .Monto: $', l^.dato.monto:2:2);
          mostrarL (l^.sig);
        end;
    end;
    
 var
   i: integer;
  begin
   for i:= 1 to dimF do begin
        writeln ('Dia: ', i);
        mostrarL (v[i]);
    end;
end;

procedure incisoB (var v: vector; var l: lista2);

    procedure agregarAtras (var l: lista2; var ult: lista2; e: entrada2);
     var 
      nue : lista2;
     begin
      new(nue);
      nue^.dato:= e;
      nue^.sig:= nil;
      if (l = nil) then
        l:= nue
      else
        ult^.sig:= nue;
      ult:= nue;
    end;

    
    procedure minimo(var v: vector; var m: entrada2);
    var 
     i, indiceMin: integer;
     begin
      indiceMin:=0;
      m.cod:=9999;
      m.cant:=0;
      for i:=1 to dimF do
        if (v[i]<>nil) then 
          if (v[i]^.dato.cod < m.cod) then begin //di vuelta el signo
            m.cod:= v[i]^.dato.cod;
            indiceMin:= i;
            m.cant:= 1;
          end;
      if (m.cod <> 9999) then
        v[indiceMin]:= v[indiceMin]^.sig;
      end;

    procedure merge (v: vector; var l: lista2);
     var 
       min, actual: entrada2;
       ult:lista2;
     begin
       ult:= nil;
       minimo (v,min);
       while (min.cod <> 9999) do begin
         actual.cod:= min.cod;
         actual.cant:= 0;
         while (min.cod <> 9999) AND (actual.cod = min.cod) do begin
           actual.cant:= actual.cant + min.cant;
           minimo (v, min);
        end;
          agregarAtras (l, ult,actual);
       end;
      end;
 
 begin
  merge (v,l);
end;

 
procedure incisoC (l:lista2);
 begin
  if(l<>nil) then begin
   writeln('Codigo de obra', l^.dato.cod, ' . Cantidad vendidas: ',l^.dato.cant);
   incisoC(l^.sig);

  end;
end;
 
{PROGRAMA PRINCIPAL}
var
 v: vector;
 l:lista2;
begin
 l:=nil;
 incisoA(v);
 //mostrarV(v);
 incisoB(v,l);
 incisoC(l);
end.





{program parcial2IMPERATIVO;
const
 dimF = 200;
type 
vector = array [1..200] of integer;

 procedure busquedaDicotomica (v:vector; pri,ult,dato:integer; var pos :integer; var ok:boolean);
  var 
   medio:integer;
  begin
   if (pri> ult) then begin 
    pos:=-1;
    ok:=false;
    end
  else begin
    medio:= (pri+ult) div 2;
    if(v[medio] = dato ) then begin
    pos:= medio;
    ok:=true;
    end
    else
     if ( v[medio] > dato ) then busquedaDicotomica(v,pri, medio-1, dato,pos,ok)
        else busquedaDicotomica(v,medio+1,ult, dato,pos,ok);
  end;
end;
 procedure mostrarV(v:vector);
 var
  i:integer;
  begin
   for i:= 1 to dimF do
    Writeln (i,') ',v[i]);    
 end;


var
  v: vector;
  i, pos: integer;
  num, numAb: integer;
  ok: boolean;
begin
  Randomize;
  for i:= 1 to dimF do begin
    num:= random (1000);
    v[i]:= num;
  end;
  mostrarV(v);
  writeln ('Ingrese el numero a buscar');
  readln (numAb);
  busquedaDicotomica (v, 1, dimF, numAb, pos , ok);
  if (ok) then
    writeln ('El numero esta en la posicion: ', pos)
  else
    writeln ('El numero no esta flaco, no rompas las pelotas');
end.}