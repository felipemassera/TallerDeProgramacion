{2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, código de género
(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa que contenga:
a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de datos adecuada.
 La lectura finaliza cuando se lee el código de película -1. 
b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas 
por código de película. }

program tp4Ej2;
const
    dimF = 8;
type
    peli = record
        codPeli: integer;
        codGen: integer;
        punt: integer
    end;
    lista = ^nodo;
    nodo = record
        dato: peli;
        sig: lista;
    end;
    vector = array [1..dimF] of lista; 

procedure IncisoA(var v:vector);
    procedure cargarVector(var v: vector);
      procedure insertarOrdenado(var l: lista; p: peli);
         var
            nue, act, ant: lista;
        begin
            new(nue);
            nue^.dato:= p;
            act:= l; 
            ant:= l;
            if(l= nil) then
                l:= nue
            else
            while (act <> nil ) and  (act^.dato.codPeli < p.codPeli) do begin
                ant:= act;
                act:= act^.sig; 
            end;
            if(ant= act) then
                l:= nue
            else
                ant^.sig:= nue; //hace el enganche del anterior con el nodo nuevo
            nue^.sig:= act ; // hace el enganche del nuevo con el actual
        end;
      procedure leerPelicula(var p:peli);
        begin
          p.codPeli:= random(50);
          p.codGen:= random(8);
          if (p.codGen=0) then p.codGen:= 8;
          p.punt:= random(10);
        end;

      procedure inicializoVector(var v: vector);
         var
            i: integer; 
         begin
          for i:=1 to 8 do
            v[i]:= nil;
       end;


     
     var
        p: peli;
     begin
        Randomize;
        inicializoVector(v);
        leerPelicula(p);
        while (p.codPeli<>0) do begin //EL CORTE DEBERIA SER -1 pero rellene automaticamente;
            insertarOrdenado(v[p.codGen],p);
            leerPelicula(p);
        end;
    end;
 begin
  cargarVector(v);
 end;
    procedure mostrarL(l:lista);
        begin
        if(l<>nil) then begin
            writeln('Codigo de Peli: ',l^.dato.codPeli,'. Cod Genero: ',l^.dato.codGen,'. Puntuacion: ',l^.dato.punt,'.');
            mostrarL(l^.sig);
        end;
        end;
    procedure mostrarV(v:vector);
    var
    i:integer;
    begin
    writeln('MUESTRO VECTOR DE LISTAS');
    for i:= 1 to dimf do begin
        writeln('Genero ',i,':');
        mostrarL(v[i]);
        end;
    end;
//
procedure IncisoB(v:vector; var l: lista);
    procedure agregarAtras(var l, ult :lista; p: peli);
     var
     nue: lista;
     begin
       new(nue);
       nue^.dato:= p;
       nue^.sig:= nil;
       if (l=nil)then
         l:= nue
       else
          ult^.sig := nue;
        ult:= nue;   
     end;
    procedure minimo(var v: vector; var p: peli);
     var
        i, indiceMin: integer;
     begin
        p.codPeli := 9999;
        indiceMin:= 0;
        for i:= 1 to dimF do begin 
            if (v[i]<>nil) then
                if (v[i]^.dato.codPeli< p.codPeli)then begin
                    indiceMin:= i;
                    p:= v[i]^.dato;
                end;
        end;
        if (p.codPeli<>9999) then 
        v[indiceMin]:= v[indiceMin]^.sig;
     end;
    //
    procedure merge(v: vector; var l : lista);
     var
     p : peli;
     actual:integer;
     ult: lista;
     begin
        ult:= nil;
        minimo(v,p);
        While (p.codPeli<>9999) do begin
          actual:= p.codPeli;
          while (p.codPeli <> 9999) and (p.codPeli = actual) do begin
            agregarAtras(l,ult,p);
            minimo(v,p);
          end;
        end;
     end;
 begin
   merge(v,l);
 end;
//

{PROGRAMA PRINCIPAL}
var
v: vector;
listMerge: lista;
Begin
  listMerge:=nil;
  IncisoA(v);
  mostrarV(v);
  IncisoB(v, listMerge);
  writeln('MUESTRO LISTA MERGE');
  mostrarL(listMerge);
End.