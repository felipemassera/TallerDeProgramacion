
Program uno;

Type 

  alumno = Record
    dni: longint;
    nomyAp: string[30];
    edad: integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato : alumno;
    sig: lista;




{agregar nodos: 
ADELANTE, es a la inversa de como se van a mostrar;
Atras: mantiene el orden de carga; 
INSERTAR : es para generar un orden logico}

    Procedure agregarAdelante (Var l: lista; num:alumno);

    Var 
      nueva: lista;
    Begin
      new (nueva); {creo un nodo}
      nueva^.dato := alumno; {cargo dato}
      nueva^.sig = l;
      l := nueva;
    End;
  End;

Procedure agregarAtras(Var l, ultimo:lista ; num:alumno );
Var 
  nuevo : lista;
Begin
  new (nuevo);
  nuevo^.dato := num;
  nuevo^.sig := Nil;
  If (l=Nil) Then
    Begin
      l := nuevo {actualiza el inicio}
      Else
        ultimo^.sig := nuevo; {si la lista NO esta vacia}
      ultimo := nuevo; {actualiza el ultimo}
    End;
End;


Procedure insertarOrdenado(Var L:lista; j:alumno); //

Var 
  nue: lista;
  act, ant: lista; {punteros auxiliares para recorrido}
Begin
  new (nue);
  nue^.dato := j;
  act := L; {ubico act y ant al inicio de la lista}
  ant := L;
  While ( act <> Nil)And(j.edad > act^.dato.edad) Do
    {el el orden va a ser por la edad}
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then {al inicio o lista vacía}
    L := nue;
  Else {al medio o al final}
    ant^.sig := nue;
  nue^.sig := act;
End;




Procedure leeralumno (a:alumno);

Var 
Begin
  writeln('ingrese dni');
  readln(a.dni);
  If (a.dni<>-1) Then
    Begin
      //puse esto para que si lee -1 no cargue los otros datos al pedo
      writeln('ingrese nombre y apellido');
      readln (a.nomyAp);
      writeln('ingrese edad');
      readln (a.edad);
    End;
End;

Procedure cargarlista (Var l:lista);

Var 
  ult : lista;
  alum: alumno;
Begin
  ult := Nil;
  leer(alum); {lee un registro de alumno}
  While (alum.dni <> -1 ) Do
    Begin{ tome como corte de carga el -1}
      agregarAtras(l,ult,alum);
      //agregarAdelante(l,alum);
      readln(alum);
    End;
End;

//se utiliza el puntero l yaque al estar pasado x valor no se modifica
Procedure recorrerlista(l: lista);

Begin
  While (l <>Nil) Do
    Begin
      writeln (l^.dato.dni);
      //ACA VA EL MODULO QUE QUERRAMOS PROCESAR
      l := l^.sig;
    End;
End;

Function buscar (L: lista; valor:integer): boolean;  /// COPIAR PARA MANANA
VAR
ok: boolean;
Begin
ok:= false;
  While ((L <> Nil) And (aux^.elem <> valor) Do
    L := L^.sig;

if(l<>nil) then
ok:= true;
buscar  := ok;    
End;

Procedure eliminar(Var l:lista; valor:longint; var ok: boolean); //ok := iniciado en falso
//buscas en una lista un valor y si existe lo elimina
Var 
  actual ,ant: lista;
Begin
  ant := l;
  actual := l;
  While (actual <> Nil) Do
    Begin
      If (actual^.dato.dni <> valor) Then
        Begin
          ant := actual;
          actual := actual^.sig
        End
      Else
        Begin
          If (actual <> Nil) Then
            If (actual = l) Then
                l := l^.sig
              Else
                ant^.sig := actual^.sig;
              dispose (actual);
              actual := ant;
            End;
        End;
    End;


  Var 
    l: lista;
    num: integer;
  Begin
    l := Nil; { de esta manera decimos que la lista l esta vacia}
    cargarlista(l);
    recorrerlista(l);
  End.






{
    INSERTAR UN ELEMENTO EN UNA LISTA ORDENADA:
    • Se necesita que la estructura tenga un orden e implica agregar el elemento a la lista de manera que la misma siga ordenada.
    • Generar un nuevo nodo.
    • Cargar el nuevo nodo con el dato que corresponda y la dirección siguiente ‘nil’
    • Verificar que la lista no esté vacía
    • Si la lista está vacía, asigna al nuevo nodo la dirección del puntero inicial.
    • Si la lista no está vacía, buscar la posición a insertar recorriéndola con dos punteros auxiliares que indiquen 
    el nodo actual y el anterior.
    • Hacer que campo siguiente del puntero anterior apunte a la dirección del nuevo nodo, 
    y que el campo siguiente del nuevo nodo apunte a la dirección del puntero actual.
}
Procedure insertarOrdenado (Var L:lista; N:dato);

Var 
  nue, act, ant: lista;
Begin
  new (nue);
  nue^.sig := Nil;
  nue^.dato := N;
  act := L;
  ant := L;
  While (act <> Nil) And (act^.dato.code < nue^.dato.code ) Do
    Begin
      //recuerden que va de menor a mayor asi
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then L := nue
   //Si no se movio, hacemos que el puntero de lista sea el nuevo (va al inicio)
  Else ant^.sig := nue;

//Si se movio, el siguiente de anterior es el nuevo, para agregar entre medio del anterior y actual
  nue^.sig := act;
{En ambos casos, el siguiente del nuevo tiene que ser el actual 
    (si esta al inicio, el actual es L, sino es el siguiente del ant}
End;

{
        ELIMINAR DE UNA LISTA:
        • Inicializar dos punteros auxiliares (anterior y actual) con la dirección del puntero inicial de la lista
        • Recorrer con ellos la lista nodo por nodo mientras no se llegue a final y no se encuentre el elemento a eliminar.
        • Si el elemento a eliminar resultara ser el primero de la lista, se actualiza el puntero inicial y se hace un dispose del nodo a eliminar.
        • Si el elemento a eliminar estuviera en el medio de la lista, el campo siguiente del puntero auxiliar anterior pasa a tener la dirección del 
        campo siguiente del puntero auxiliar actual y se elimina con un dispose el nodo actual.
}
Procedure eliminar(Var PI: lista; num: integer);
//Elimina 1 solo

Var 
  act, ant: lista;
Begin
  act := PI;
  While ((act <> Nil) And (act^.num <> num)) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act^.num = num) Then
    Begin
      If (act = PI) Then
        PI := PI^.sig
      Else
        ant^.sig := act^.sig;
      dispose(actual);
    End;
End;
End;

Procedure eliminar(Var l:lista; valor:Integer);
//buscas en una lista un valor y si existe lo elimina

Var 
  actual ,ant: lista;
Begin
  ant := l;
  actual := l;
  While (actual <> Nil) Do
    //Mientras no nos caigamos
    Begin
      If (actual^.dato <> valor)  Then
        //Mientras no encuentre lo que quiere eliminar
        Begin
          ant := actual;
          actual := actual^.sig
        End
      Else
        Begin
          If (actual <> Nil) Then
            If (actual = l) Then
              Begin
                l := l^.sig;
                dispose (actual);
                actual := l;
              End
          Else
            Begin
              ant^.sig := actual^.sig;
              dipose (actual);
              actual := ant;
            End;
        End;
    End;
End;
{   ELIMINAR CON LA LISTA ORDENADA     }
Procedure eliminar (Var L:lista; valor:Integer; Var ok:boolean);

Var 
  actual, ant: lista;
Begin
  actual := L;
  ok := true;
  While (actual <> Nil) And (ok = true) Do
    Begin
      If (actual^.dato < valor) Then
        Begin
          //Si la lista va de menor a mayor, es así sino al reves
          ant := actual;
          actual := ant^.sig;
        End;
      If (actual^.dato > valor) Then ok := false;
      //Si la lista va de menor a mayor, es así sino al reves
      If (actual <> Nil) And (actual^.dato = valor) Then
        Begin
          If (actual = L) Then
            Begin
              L := L^.sig;
              dispose(actual);
              actual := L;
            End
          Else
            Begin
              ant^.sig := actual^.sig;
              dispose(actual);
              actual := ant;
            End;
        End;
    End;
End;
