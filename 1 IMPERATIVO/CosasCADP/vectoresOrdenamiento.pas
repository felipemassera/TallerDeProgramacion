
Program VectorOrdenamiento;

Const 
  tope = 10;

Type 
  vector = array [1..tope] Of integer;

Procedure carga(Var v: vector; Var dlog: integer);

Var 
  num: integer;
Begin
  readln(num);
  While ((num<>0) And (dlog<tope)) Do
    Begin
      dlog := dlog + 1;
      v[dlog] := num;
      readln(num);
    End;
End;


Procedure ordenArray(Var v :vector; dl:integer);
Var 
  i,p,j,item: integer;
Begin
  For i:=1 To dl-1 Do
    Begin
      p := i;
      For j:= i+1 To dl Do
        If (v[j]<v[p]) Then
          p := j;
      item := v[p];
      v[p] := v[i];
      v[i] := item;
    End;

End;

Procedure imprimir(v:vector; dl: integer);

Var 
  i: integer;
Begin
  For i:=1 To dl Do
    writeln (i, ' *: ', v[i]);
End;


Var 
  v : vector;
  dlog: integer;
Begin
  dlog := 0;
  carga(v,dlog);
  If (dlog <>0 ) Then
    Begin
      imprimir(v,dlog);
      ordenArray(v,dlog);
      imprimir(v,dlog);
    End;
End.



{
    BUSQUEDA DICOTOMICA:
    1- Se calcula el elemento que esta en la posición del medio
    2- Si es el elemento que busco, entonces la búsqueda termino
    Si NO es el elemento que busco, entonces comparo contra el valor del medio elijo del vector la mitad que me convenga 
}
Procedure busquedaDicotomica (Var vector: numeros; dimL: integer; bus:integer;
                              Var ok:boolean);
//Se pasa el vector como var en caso de tener que hacer algo, lol

Var 
  pri, ult, medio: integer;
Begin
  ok := false;
  //Ok chequea si lo encontró
  //calculamos las posiciones por primera vez
  pri := 1;
  ult := dimL;
  medio := (pri+ult) Div 2;
  While (pri <= ult) And (bus <> vec[medio]) Do
    //mientras no hayamos llegado al final y no hallamos encontrado el objeto 
    Begin
      If (bus < vec[medio]) Then
        ult := medio-1

//Si el busqueda esta del lado menor del vector entonces el ultimo tiene que pasarse alli
      Else pri := medio+1;
      //Lo mismo con le primero si esta en el lado mayor
      medio := (pri+ult) Div 2;
      //Reseteamos el medio
    End;
  If (pri <= ult) And (bus = vec[medio]) Then ok := True;


//Si esta en un posicion posible, y se encontró, entonces le devolvemos verdadero
End;
End;



{ 
    BUSQUEDA VECTOR ORDENADO:
    1-Si NO es el elemento que busco, entonces 
    2-Comparo contra el valor del medio
    3-Elijo del vector la mitad que me convenga 
}
Procedure busquedaOrdenado (vector:numeros; dimL:integer; bus:integer; ok:
                            Boolean);

Var 
  pos: integer;
Begin
  pos := 1;
  While (pos <= dimL) And (a[pos] < bus) Do
    Begin

{Mientras este ordenado menor va seguir moviendose, 
    esto sirve para cuando es de menor a mayor, ya que por ejemplo nos dan 
    el 8, y hay 3, 6, 7, 9: el 3 es menor entonces se mueve, el 6 tambien, etc, hasta llegar al 9}


{para cuando es de mayor a menor:
    while (pos <= dimL) and (a[pos] > bus) do begin
    ya que nos dan 9, 7, 6, 3 y hay que buscar el 6, el 9 es mayor, entonces se mueve, etc}
      pos := pos+1;
    End;
  If (pos <= dimL) And (a[pos] = num) Then ok := true;
End;


{   
    ELIMINAR VECTOR:
    1- Verificar que la posición sea válida (esté entre los valores de dimensión definida del vector y la dimensión lógica).
    2- Hacer el corrimiento a partir de la posición y hasta el final.
    3- Decrementar la cantidad de elementos actuales.
}
Procedure eliminarVector (Var vector:numeros; dimL:integer; bus:integer; ok:
                          boolean);

Var 
  i: integer;
Begin
  ok := false;
  If (bus >= 1) And (bus <= dimL) Then
    Begin
      For i:= bus To dimL-1 Do
        a[i] := a[i+1];
      ok := true;
      dimL := dimL-1;
    End;
End;
