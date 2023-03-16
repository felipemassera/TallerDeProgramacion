
{.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados. 
}

Program tp1Recursion.pas;

Type 
  vector = array [1..10] Of char;
  lista = ^nodo;
  nodo = record
    dato: char;
    sig: lista;
  end; 
Procedure incisoABC();
    Procedure leerVector(x:char; Var v:vector; Var diml: integer);
        Begin
        writeln('Leo un char, vuelta ',(diml+1));
        readln(x);
        If (x<>'.') Then
            Begin
            diml := diml+1;
            v[diml] := x;
            leerVector(x,v,diml);
            End;
        End;
    Procedure verVector(v:vector; diml:integer);
        //proceso iterativo de muestra de vector

        Var 
        i: integer;
        Begin
        writeln('MUESTRO VECTOR');
        For i:= 1 To diml Do
            writeln (i,') ',v[i],'.');
        End;

    Procedure verVectorRecursivo (dimL:integer; V:vector; i:integer); //RECURSIVO
        Begin
        //If (i >= 0) And (i < dimL)Then
        If (i < dimL)Then
            Begin
            i := i+1;
            write('|');
            write(V[i]);
            write('|');
            verVectorRecursivo(dimL, V, i);
            End;
        End;

    Var 
    x: char;
    i,diml: integer;
    v: vector;
    Begin
    i:=0;
    diml := 0;
    leerVector (x,v,diml);
    verVector(v,diml); //Inciso B Iterado
    writeln('VEO RECURSIVAMENTE');
    verVectorRecursivo(diml,v, i); //INCISO C Recursivo
End;

procedure incisoD();
   function leerChar(x:char):integer;
    begin
        readln(x);
        if (x<>'.')then
        begin
    	    leerChar:= leerChar(x)+1;
        end Else
        leerChar:= 0;
    end;
    var
    x:char; 
    begin
    writeln('Ingrese los caracteres');
    writeln('La cantidad de caracteres leidos es: ',leerChar(x));
end;

Procedure IncisoE();

Procedure agregarNodo(Var l:lista; x: char);

Var 
  nue : lista;
Begin
  new (nue);
  nue^.dato := x;
  nue^.sig := l;
  l := nue;
End;

Procedure leerChar(Var l:lista);

Var 
  x: char;
Begin
  read(x);
  If (x<>'.') Then
    Begin
      agregarNodo(l,x);
      leerChar(l);
    End;
End;

Procedure verListaRecursivoInvertido(l:lista);
Begin
  If (l<>Nil)Then
    Begin
      write(l^.dato);
      verListaRecursivoInvertido(l^.sig);
    End;
End;

Procedure verListaRecursivo(l:lista);
Begin
  If (l<>Nil)Then
    Begin
      verListaRecursivo(l^.sig);
      write(l^.dato);
    End;
End;

Var 
  l: lista;
Begin
  l := Nil;
  writeln('ingrese los char necesarios');
  leerChar(l);
  writeln('VER LISTA en orden de carga');
  verListaRecursivoInvertido(l);
  writeln('');
  writeln(' VER LISTA INVERTIDA PUES insertarADELANTE');
  verListaRecursivo(l);
End;


{Programa principal}
Begin
  //incisoABC();
  //incisoD();
  incisoE();
End.
