{- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa.
 La lectura finaliza cuando llega el código de identificación -1.
b)	Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.
c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector.
 En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
d)	Tenga un módulo recursivo que retorne el monto total de las expensas. }
program tp5Ej1;
const
 dimF = 300;
type
 oficinas = record
  cod : integer;
  dni : integer;
  expensa: real;
 end;
 vector = Array [1..dimf] of oficinas;
// END TYPE 


 
 procedure cargarVector(var v : vector;var diml:integer);
  Procedure leerOficina (Var o: oficinas);
   Begin
     o.cod := random(100);
     o.dni := random(4000);
     o.expensa := random(20000);
  End;
  var
    o: oficinas;
  begin
    Randomize;
    leerOficina(o);
    while (diml<dimf) and (o.cod <> 0) do begin
      diml := diml+1;
      v[diml]:= o;
      leerOficina(o);
    end;
 end; 

procedure mostrarV(v:vector; diml:integer);
 var
  i: integer;
 begin
  for i:= 1 to diml do
   writeln (i,') Codigo: ',v[i].cod,'. DNI: ',v[i].dni,'. Valor Expensa : $',v[i].expensa:2:2); 
end;
 {APRENDER CLAVE PARA EL EXAMEN ORDENAMIENTOS< BUSQUEDA DICOTOMICA}

procedure ordenarInsercion(var v: vector; diml:integer);
 var 
  i,j :integer;
  aux: oficinas;
 begin
  for i:= 2 to diml do begin
    aux:= v[i];
    j:= i-1;
    while (j>0) and (v[j].cod > aux.cod ) do begin
      v[j+1]:= v[j];
      j:= j-1;
    end;
    v[j+1]:= aux;
  end; 
end;
procedure ordenarSeleccion(var v: vector; diml:integer);
 var 
 i,j,k: integer;
 aux: oficinas;
 begin
   for i:= 1 to diml-1 do begin
    k:=i;
    for j:= i+1 to diml do
      if(v[j].cod< v[k].cod) then k:=j;
    aux:= v[k];
    v[k]:= v[i];
    v[i]:= aux;
   end; 
end;
procedure busquedaDicotomica(v:vector;diml:integer);
    Procedure Dicotomica (v: vector; pri,fin, dato : integer; var pos: integer);
     var 
      medio:integer;
     begin
       if (pri> fin) then pos:=-1
       else begin
         medio:= (pri+fin) div 2;
         if(v[medio].cod = dato) then
          pos:=medio
         else
          if(v[medio].cod > dato) then
            Dicotomica(v,pri,medio-1,dato,pos)
            else
            Dicotomica(v,medio+1,fin,dato,pos);
       end;
     end;
    
 var
  dato,fin,pos: integer;
 begin
  fin:= diml; //dimf
  pos:=0 ;
  writeln('Ingrese el codigo a buscar');
  readln(dato);
  Dicotomica(v,1,fin,dato,pos);
  if(pos<>-1) then
   writeln('EL codigo fue encontrado y el DNI : ',v[pos].dni)
  else Writeln('El dato no se encontro en el vector');
end;
procedure expensasTot2(v:vector; diml:integer ; var total:real);
 var
  i:integer;
 begin
   for i:= 1 to diml do 
     total:= total + v[i].expensa;
end;

function expensasTot(v:vector;diml:integer):real;
 begin
  if(diml=0) then expensasTot:= 0
  else
   expensasTot:= expensasTot(v,diml-1)+ v[diml].expensa; 
end;
{PROGRAMA PRINCIPAL}
var 
 v: vector;
 dato,diml: integer;
 total: real;
begin
 total:=0;
 cargarVector(v,diml); //incisoA
  writeln('MUESTRO VECTOR RECIEN CARGADO');
   mostrarV(v,diml);
  ordenarSeleccion(v,diml);//Inciso B
  writeln('MUESTRO VECTOR Ordenado SELECCION');
  mostrarV(v,diml);
  //ordenarInsercion(v,diml);
  //writeln('MUESTRO VECTOR Ordenado INSERCION');
  //mostrarV(v,diml);
 busquedaDicotomica(v,diml);//incisoC
 writeln('Las expensas totales fueron: ',expensasTot(v,diml):2:2);
expensasTot2(v,diml,total);
writeln('Las expensas totales 2 fueron: ',total:2:2);
end.

