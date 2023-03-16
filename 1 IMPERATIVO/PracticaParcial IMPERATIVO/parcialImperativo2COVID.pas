{El ministerio de salud quiere registrar información de los infectados de COVID - 19 . De cada infectado conoce : DNI ,
nombre , nivel de sintomatología ( 1 : asintomático 2 : leve 3 : moderado 4 : grave ) y código de ciudad .

1- Realice un módulo que permita cargar en una estructura la información de infectados leída desde teclado ( hasta
ingresar DNI 0 ) . Esta estructura debe ser eficiente para la búsqueda por DNI .
A partir de la estructura generada en 1 )

2- Realice un módulo que informe DNI , nombre , nivel de sintomatología y código de ciudad del infectado más adulto . La
persona más adulta es aquella con menor DNI .
3- Realice un módulo que genere una lista con todos los infectados de una ciudad cuyo código se recibe . Luego muestre
el contenido de la lista .
Nota : Realice el programa principal que invoque a los módulos realizados e informe lo pedido .}

program MASSERAFELIPE;
//MASSERA FELIPE
type
 subrango = 1..4;
 paciente = record
  dni: integer;
  nombre:integer;
  nivel:  subrango;
  codC:integer;
 end;

 arbol = ^nodo;
 nodo = record 
  dato : paciente;
  hi:arbol;
  hd: arbol;
 end;
 lista=^nodo2;
 nodo2 =record
  dato:paciente;
  sig: lista
end;

procedure incisoA(var a:arbol);
 procedure insertarHoja(var a:arbol; p:paciente);
  begin
    if(a=nil)then begin
     new(a);
     a^.dato:=p;
     a^.hi:=nil;
     a^.hd:=nil;
     end else if(a^.dato.dni>p.dni) then  insertarHoja(a^.hi,p)     
     else insertarHoja(a^.hd,p);
  end; 
  procedure leerPacienteAuto(var p: paciente);
   begin
     p.dni:= random(999);
     p.nombre:= random(100);
     p.nivel:= (random(4)+1);
     p.codC := random(30);
   end;
 var 
  p:paciente;
 begin
   leerPacienteAuto(p);
   while(p.dni<> 0) do begin
     insertarHoja(a,p);
     leerPacienteAuto(p);
  end;
end;

procedure incisoB(a:arbol);
  
  procedure buscarMasGrande(a:arbol; var p:paciente);
  begin
    if(a = nil) then p.dni:=0
    else
    if(a^.hi=nil) then p:= a^.dato else
    buscarMasGrande(a^.hi,p);  
  end;

 var
   p:paciente;
  begin
    buscarMasGrande(a,p);
    writeln('DNI: ', p.dni ,' NOMBRE: ',p.nombre,' NIVEL DE INFECCION: ',p.nivel, ' COD CIUDAD: ', p.codC);
end;

procedure verArbol(a:arbol);
 begin
   if(a<>nil) then begin
    verArbol(a^.hi);
    writeln('DNI: ', a^.dato.dni ,' NOMBRE: ',a^.dato.nombre,' NIVEL DE INFECCION: ',a^.dato.nivel,' COD CIUDAD: ', a^.dato.codC);
    verArbol(a^.hd);
   end;
 end;

procedure incisoC(a:arbol; var l:lista);
  procedure agregarAtras(var l: lista ;var ult:lista; p:paciente);
   var 
   nue: lista;
   begin
     new(nue);
       nue^.dato:= p;
       nue^.sig :=nil;
     if(l=nil) then
      l:=nue
      else 
       ult^.sig:=nue;
     ult:= nue;
   end;
  procedure merge(a:arbol; var l:lista; var ult:lista; codBuscado:integer);
   begin
     if (a<>nil) then begin
     merge(a^.hi,l,ult,codBuscado);
     if (a^.dato.codC = codBuscado) then agregarAtras(l,ult,a^.dato);
     merge(a^.hd,l,ult,codBuscado);
     end;
   end; 
var
 ult:lista;
 dato:integer;
 begin
   ult:=nil;
    writeln('ingrese el dato que requiere buscar');
   read(dato);
   merge(a,l,ult,dato);
 end;
   procedure verLista(l:lista);
    begin
    if (l<>nil) then Begin
    writeln('DNI: ', l^.dato.dni ,' NOMBRE: ',l^.dato.nombre,' NIVEL DE INFECCION: ',l^.dato.nivel,' COD CIUDAD: ', l^.dato.codC);
    verLista(l^.sig);
    end;
end;


{PROGRAMA PRINCIPAL}
 var 
  a:arbol;
  l: lista;
 begin
  a:=nil;
  l:=nil;
  incisoA(a);
  //writeln('MUESTRO EL ARBOL ORIGINAL');
  //verArbol(a);
  //writeln('ARRANCO INCISO B');
  //incisoB(a);
  incisoC(a,l);
  writeln('IMPRIMO LA LISTA FINAL INCISO C');
  verLista(l);
  end.