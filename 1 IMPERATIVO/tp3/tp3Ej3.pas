{3.	Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo
a aquellos alumnos que posean año de ingreso posterior al 2010. 
De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de alumnos cuyo legajo esté entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
}
Program tp3Ej3;
Type 
  alumno = Record
    legajo : integer;
    dni : integer;
    anio: integer;
  End;
  arbol = ^nodo;
  nodo = Record
    dato : alumno;
    hi: arbol;
    hd: arbol;
  End;

procedure incisoA(var a:arbol);
        procedure crearArbol(var a:arbol; al:alumno);
        begin
          if (a= nil) then begin
          new(a);
          a^.dato := al; a^.hi:= nil ; a^.hd := Nil;
          end 
          else if (al.legajo < a^.dato.legajo) then crearArbol(a^.hi,al)
          else crearArbol (a^.hd,al);
        end;

        procedure leerAlumnoAutomatico(var a: alumno);
        begin
            a.legajo:= random(100);
            a.dni:= random(99999);
            a.anio:= 2000 + random (30);
        end;
        procedure cargarArbol(var a:arbol);
        var
        al: alumno;
        i:integer;
        begin
            Randomize;
            for i:= 1 to 40 do begin
                leerAlumnoAutomatico(al);
                if (al.anio> 2010) then crearArbol(a,al); //si es mayor al 2010 se carga en la lista
            end;    
        end;
begin
    cargarArbol(a);
end;
{b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de
ingreso de aquellos alumnos cuyo legajo sea inferior
a un valor ingresado como parámetro.}
procedure incisoB(a: arbol);
    procedure informarDniAnio(a: arbol; dato:integer);
    begin
      if (a<>nil) then
        if (dato <= a^.dato.legajo) then informarDniAnio(a^.hi,dato)
        else begin            
            informarDniAnio(a^.hi,dato);
            writeln('Dni: ',a^.dato.dni,'. Anio: ', a^.dato.anio);
            informarDniAnio(a^.hd,dato);
        end;
    end;
var
    x: integer;
begin
    writeln('IncisoB: el valor es 50');
    x:=50;
    informarDniAnio(a,x);
end;
{c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de alumnos cuyo legajo esté entre dos valores que se reciben como parámetro.}
procedure incisoC(a:arbol);
    procedure entreValores(a:arbol; inf:integer; sup: integer);
    begin
      if (a<> nil) then
        if(a^.dato.legajo < inf ) then entreValores(a^.hd,inf,sup) //Si el num es < al limite inf me voy a la derecha
            else If (a^.dato.legajo > sup) then entreValores(a^.hi,inf,sup)// sino si el dato es mas grande que el sup me voy a la izq
            else begin 
            writeln('Legajo: ',a^.dato.legajo,' .Dni: ',a^.dato.dni,' .Anio: ',a^.dato.anio);
            entreValores(a^.hi,inf,sup);
            entreValores(a^.hd,inf,sup);
            end;
    end;
Var 
  inf,sup: integer;
Begin
  writeln('INCISO C');
  writeln('Limites inf:= 6, sup:= 60');
  inf := 50;
  sup := 60;
  entreValores(a,inf,sup);
End;


//d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
Procedure incisoD (a:arbol);
    Procedure maxEdad(a: arbol; Var max: integer);
    Begin
    If (a <> Nil) Then
        Begin
        maxEdad(a^.hi, max);
        If (a^.dato.dni > max) Then
          max := a^.dato.dni;

        maxEdad(a^.hd, max);
        End;
    End;
var
maxDni:integer;    
Begin
  maxDni := -1;
  maxEdad(a, maxDni);
  writeln('DNI MAS GRANDE es:' , maxDni);
End;

//e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
procedure incisoE(a:arbol);
    function legajoImpar(a:arbol):integer;
    begin
        if (a=nil)then
        legajoImpar:= 0
        else if (a^.dato.legajo mod 2 <> 0) then legajoImpar:= 1 + legajoImpar(a^.hi) + legajoImpar(a^.hd)
        else legajoImpar := legajoImpar(a^.hi) + legajoImpar(a^.hd)
    end;
begin
  writeln('En el arbol hay: ', legajoImpar(a) ,' legajos impares.');
end;

procedure mostrarArbol(a:arbol);
begin
    if (a<>nil)then begin
        mostrarArbol(a^.hi);
        writeln ('Legajo: ',a^.dato.legajo,' .Dni: ',a^.dato.dni,' .Anio: ',a^.dato.anio);
        mostrarArbol(a^.hd);
    end;
end;

Var 
a: arbol;
Begin
a:= nil;
incisoA(a);
mostrarArbol(a);
//incisoB(a);
incisoC(a);
//incisoD(a);
//incisoE(a);
End.

{NOTA 1: RECORDAR SIEMPRE INICIAR EL ARBOL EN NIL}