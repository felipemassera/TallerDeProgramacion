{ 2.	Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto,
fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta.
Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. 
Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
    Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades
 vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades
 vendidas de ese producto.
}

program tp3Ej2;

type
    venta = record
        codProd :integer;
        mes : integer;
        cantVent : integer;
    end;
    venta2 = Record
    codProd : integer;
    cantVent : integer;
    End;
    arbol = ^nodo;
    nodo = record
        dato: venta;
        hi: arbol;
        hd: arbol;
    end;
    arbol2 = ^nodo2;
    nodo2 = record
        dato: venta2;
        hi: arbol2;
        hd: arbol2;
    end;

procedure incisoAiyii(var a:arbol; Var a2: arbol2);
    procedure crearArbol(var a: arbol; v: venta);
    begin
      if (a= nil) then begin
        new(a); 
        a^.dato:=v; a^.hi:= nil; a^.hd:= Nil;
        end else if (v.codProd < a^.dato.codProd) then crearArbol(a^.hi, v) //si el dato es menor al nodo, se va para la rama izq sino derecha
        else crearArbol(a^.hd,v); 
    end;

    procedure crearArbol2(var a: arbol2; v: venta2);
    begin
      if (a= nil) then begin
        new(a); 
        a^.dato:=v; a^.hi:= nil; a^.hd:= Nil;
        end else if(v.codProd = a^.dato.codProd ) then 
        a^.dato.cantVent:= a^.dato.cantVent + v.cantVent //en este caso si el codigo de producto es = acumula ventas en arbol2.
        else if (v.codProd < a^.dato.codProd) then 
        crearArbol2(a^.hi, v) //si el dato es menor al nodo, se va para la rama izq sino derecha
        else crearArbol2(a^.hd,v); 
    end;
    procedure leerVentas (var v: venta); //lee ventas MANUAL
        begin
        writeln('Ingrese el codigo de producto');
        readln (v.codProd);
        if (v.codProd <> 0) then
        begin
        writeln('Ingrese el fecha(mes) de compra');
        readln (v.mes);
        writeln('Ingrese el cantidad Vendida');
        readln (v.cantVent);
        writeln('SALGO DE LA LECTURA');
        end;
    end;

    procedure leerVentasAutomatico (var v: venta); //Lee ventas Automatica
    begin
        v.codProd:= random(100);
        if (v.codProd <> 0) then
        begin
        v.mes := random(12);
        v.cantVent :=random(50);
        end;
    end;

    procedure creoNodo (var a:arbol; var a2:arbol2);
    var
    v:venta;
    v2: venta2;
    begin
        Randomize;
        //leerVentas(v);
        leerVentasAutomatico(v);
        while (v.codProd <>0) do begin
          crearArbol (a,v);
          v2.codProd:= v.codProd;
          v2.cantVent:= v.cantVent;
          crearArbol2(a2,v2);
          //leerVentas(v);
        leerVentasAutomatico(v);
        end;
    end;
begin
   creoNodo(a,a2);
end;

function incisoB(a:arbol;dato:integer):integer;
begin
  if (a=nil) then incisoB:=0 
  else if (dato = a^.dato.codProd )then incisoB:= a^.dato.cantVent + incisoB(a^.hd,dato)
  else if(dato< a^.dato.codProd) then incisoB:=incisoB(a^.hi,dato)
  else incisoB := incisoB(a^.hd,dato);
end;

Function incisoC(a:arbol2;dato:integer): integer;
Begin
  If (a=Nil) Then incisoC := 0
  Else If (dato = a^.dato.codProd )Then incisoC := a^.dato.cantVent
  Else If (dato< a^.dato.codProd) Then incisoC := incisoC(a^.hi,dato)
  Else incisoC := incisoC(a^.hd,dato);
End;


procedure mostrarArbol(a:arbol); //MUESTRA DE MENOR A MAYOR
begin   
    if (a<>nil) then begin
    mostrarArbol(a^.hi);
    writeln ('CodProd: ',a^.dato.codProd,'. Cantidad de Ventas: ',a^.dato.cantVent);
    mostrarArbol(a^.hd);
    end;
end;

Procedure mostrarArbol2(a2:arbol2);//MUESTRA EL ARBOL 2 de Menor a Mayor
Begin
  If (a2<>Nil) Then
    Begin
      mostrarArbol2(a2^.hi);
      writeln ('CodProd:',a2^.dato.codProd,'. Cantidad de Ventas: ', a2^.dato.cantVent);
      mostrarArbol2(a2^.hd);
    End;
End;


{PROGRAMA PRINCIPAL}
var
a: arbol;
a2: arbol2;
cantTot,x: integer;
begin
cantTot:=0;
a:= nil;
incisoAiyii(a,a2);
writeln ('MUESTRA EL ARBOL NORMAL');
mostrarArbol(a); 
writeln ('MUESTRA el arbol con datos acumulados');
mostrarArbol2(a2);
{b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades
 vendidas de ese producto.}
writeln('Ingrese un codigo de producto {INCISO B}');
readln(x);
cantTot:= incisoB(a,x);
if (cantTot= 0) then writeln('El dato no se encontro!')
else writeln('EL total para el dato :=',x, ' ,es: ', cantTot);
writeln('');
{c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades
 vendidas de ese producto.}
writeln('USO EL MISMO DATO QUE ANTES A VER Q DA {INCISO C}');
cantTot := incisoC(a2,x);
If (cantTot= 0) Then writeln('El dato no se encontro!')
Else writeln('EL total para el dato :=',x, ' ,es: ', cantTot);

END.

{NOTA 1 :Lo importante de este ejercicio en el punto 1 es darse cuenta que la creacion de los dos arboles deben ser en simultaneo
 ya que sino debemos recorrer la estructura e ir acumulando, de esta forma nodo a nodo se van sumando datos (para el arbol 2)}