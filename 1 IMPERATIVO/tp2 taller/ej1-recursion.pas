{
a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos.
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.
}

Type 
  arrLetras = array [1..10] Of char;
  lista = ^nodo;
  nodo = Record
    caracter: char;
    sig: lista;
  End;


Procedure incisoA (Var dimL:integer; Var v: arrLetras; Var aux:char);
{dimL = 0 en el caso base}
Begin
  If (dimL < 10)Then
    Begin
      readln (aux);
      If (aux <> '.') Then
        Begin
          dimL := dimL+1;
          v[dimL] := aux;


          incisoA(dimL, v, aux);
        End;
    End;
End;



Procedure lR (Var SENTINELA:integer; Var v: arrLetras; Var aux:char);
{dimL = 0 en el caso base}
Begin
  readln (aux);
  If (aux <> '.') Then
    Begin
      lR(SENTINELA, v, aux);
      SENTINELA := SENTINELA+1;
    End;
End;
End;


Procedure leerV (dimL:integer; v:arrLetras);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      write('|');
      write(v[i]);
      write('|');
    End;
End;
Procedure leerVrecursivo (dimL:integer; V:arrLetras; i:integer);
Begin
  If (i >= 0) And (i < dimL)Then
    Begin
      i := i+1;
      write('|');
      write(V[i]);
      write('|');
      leerVrecursivo(dimL, V, i);
    End;
End;



{d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos.}

Procedure leerSecuencia (aux:integer ; car:char);
Begin
  readln(car);
  If (car <> '.') Then
    aux := aux + 1;
  leerSecuencia(aux)
End;

Var 
  v: arrLetras;
  dimL, i: integer;
  aux: char;
Begin
  dimL := 0;
  i := 0;
  lR(dimL, v, aux);
  leerV(dimL, v);
  writeln ();
  leerVrecursivo(dimL, v, i);
End.


Procedure potencia (num, n:integer; Var pot:integer);
Begin
  If (n = 0) Then pot := 1
  Else
    Begin
      potencia (num, (n-1), pot);
      pot := pot * num;
    End;
End;

