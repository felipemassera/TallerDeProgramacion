

{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, 
    año de fabricación (2010..2018), la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. 
}
program tp5Ej2;
const
 dimF = 2018;
type
 anios = 2010..dimF;
 auto = Record
   anio : anios;
   patente : integer;
   marca: integer;
   modelo: integer;
  end;

 arbol = ^nodo;
 nodo = record 
   dato: auto;
   hi : arbol;
   hd : arbol;
  end;
 lista = ^nodoL;
 nodoL = record
   dato : auto;
   sig : lista;
  end;
 vector = array [2010..dimF] of lista;
//
 procedure verArbol (a: arbol);
    begin
      if (a<>nil)then begin
       verArbol(a^.hi);
       writeln ('Patente : ',a^.dato.patente,' Anio: ',a^.dato.anio,' Marca: ' ,a^.dato.marca,' Modelo: ',a^.dato.modelo); 
       verArbol(a^.hd);
       end; 
    end;
procedure incisoA (var a: arbol);
  
  procedure agregarHoja (var a : arbol; au: auto);
   begin
     if (a=nil) then begin
     new(a); 
     a^.dato:= au; a^.hi:=nil ; a^.hd:= nil;
     end else if (au.patente < a^.dato.patente) then agregarHoja(a^.hi,au)  //ordena por patente
    // end else if (au.marca < a^.dato.marca) then agregarHoja(a^.hi,au)   //ordena por marca
      else agregarHoja(a^.hd,au);
   end;
  
  procedure leerAuto(var a: auto);
   begin
     a.patente := random (999);
     if (a.patente <> 0) then begin
     a.anio := 2010 + random(9);
     if(a.anio = 2019) then a.anio:= 2018;
     a.marca := random(50);
     a.modelo := random(50);
     end;
   end;
  

  var
   au: auto;
  begin
    leerAuto(au);
    while (au.patente<>0) do begin
     agregarHoja(a,au);
     leerAuto(au);
    end;
end; //FIN INCISO A

Procedure incisoB (a: arbol; m: integer; var cantAutos: integer);
 Begin
 if(a<>nil)then begin
  incisoB(a^.hi,m,cantAutos);
  if (a^.dato.marca = m )then cantAutos:= cantAutos + 1;
  incisoB(a^.hd,m,cantAutos);
 end;
End; //fin IncisoB
procedure incisoC( a:arbol ; var v:vector);
  
  procedure inicializoV(var v:vector);
   var
    i:integer;
   begin
     for i:= 2010 to dimF do 
      v[i]:= nil;
   end;

    procedure agregarAdelante(var l:lista; au:auto);
    var 
     nue: lista;
    begin
      new (nue);
      nue^.dato:= au;
      nue^.sig:= l;
      l:= nue;
    end;

  procedure cargarV(a: arbol ; var v:vector);
    Begin
   if (a<>nil) then begin
    cargarV(a^.hi,v);
    agregarAdelante(v[a^.dato.anio],a^.dato);
    cargarV(a^.hd,v);
    end;
  end; 
 
   procedure verVector(v:vector);
     procedure verLista (l:lista);
      begin
        if(l<>nil) then begin
         verLista(l^.sig);
         writeln ('Patente : ',l^.dato.patente,' Anio: ',l^.dato.anio,' Marca: ' ,l^.dato.marca,' Modelo: ',l^.dato.modelo);   
        end;  
      end;  

     var 
      i: integer;
     begin
       for i:= 2010 to dimF do begin
         writeln('ANIO ',i,': ');
         verlista(v[i]);
       end;  
    End;
 
 begin
  inicializoV(v);
  cargarV(a,v);
  verVector(v);
end;

procedure verIncisoD( a: arbol; x : integer);
begin
  if (a<>nil) then begin
   verIncisoD(a^.hi,x);
   if (a^.dato.patente = x ) then begin
   writeln (' anio ', a^.dato.anio);
   end;
   verIncisoD(a^.hd,x);
  end;
end;

{      PROGRAMA PRINCIPAL      }

var
 a: arbol;
 totalAutosMarca: integer; 
 m , x :integer;
 v: vector;
begin
  totalAutosMarca:= 0;
  a:= nil;
  incisoA(a);
  //verArbol(a);
  {comienzo incisoB
   writeln('Ingrese la marca del auto para saber cuantos hay en agencia');
   readln(m);
   incisoB(a,m,totalAutosMarca);
   writeln ('La cantidad de autos de la marca ',m,' es: ',totalAutosMarca);
  incisoC(a,v);}
  writeln('INGRESO AL INCISO D');
  read(x);
  verIncisoD(a,x);
end.  