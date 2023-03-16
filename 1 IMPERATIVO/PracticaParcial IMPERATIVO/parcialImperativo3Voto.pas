program pruebaImperativa;
const
  dimF = 31;
type
    entrada = record
        titulo: integer;
        horario: integer;
        precio: integer;
        dia: integer;
    end;
    entrada2 = record
        titulo: integer;
        precio: integer;
    end;
    lista=^nodo;
    nodo=record
        dato:entrada;
        sig:lista;
    end;

    arbol = ^nodo2;
    nodo2 = record
      dato: entrada2;
      hi: arbol;
      hd: arbol;
    end;

    vector = array [1..dimF] of lista;

   
procedure cargarEntradas(var V: vector);
    
    procedure insertarOrdenado(var l:lista; e:entrada);
        var
        nue,act,ant:lista;
        begin
        new(nue);
        nue^.dato:= e;
        ant:= l;
        act:= l;
        if (l=nil) then 
          l:=nue
        else 
          while (act<>nil) and (act^.dato.titulo < e.titulo) do begin
           ant:=act;
           act:= act^.sig;
           end;
          if (ant=act) then
           l:= nue
          else
            ant^.sig:=nue;
          nue^.sig:=act; 
        end;

    procedure inicializar (var v: vector);
    var 
        i: integer;
    begin
    writeln('ingreso');
        for i:= 1 to dimF do 
            v[i]:= nil;
    writeln('salgo');

    end;

    procedure leerEntrada(var e:entrada);
    begin
        e.dia:= (random(31)+1);
        
        e.precio:= random(100);   
          
        e.titulo:=random(10);
        
        e.horario:=random(24);
    end;
    
    
var
    E: entrada;
begin
    Randomize;
    inicializar(V);
    leerEntrada (E);
    writeln('Titulo: ',E.titulo, '. Horario: ',E.horario,'. Precio: ',E.precio,'DIA',E.dia);
    while (E.precio <> 0) do begin
        insertarOrdenado(V[E.dia], E);
        leerEntrada(E);
    end;
end;


procedure incisoB(v: vector; var a: arbol);

  Procedure mostrarArbol( a:arbol );
    Begin
    If (a<>Nil)Then
    Begin
      mostrarArbol(a^.hi);
      writeln('Titulo: ',a^.dato.titulo,' .Pecio: ',a^.dato.precio);
      mostrarArbol(a^.hd);
    End;
    End;


  procedure insertarHoja(var a: arbol ; titulo: integer ; montoTotal:integer);
   begin
    if (a=nil) then begin
     new(a);
     a^.dato.titulo:=titulo;
     a^.dato.precio:=montoTotal;
     a^.hi:=nil;
     a^.hd:=nil;
     end
     else if (a^.dato.precio > montoTotal )then insertarHoja(a^.hi,titulo,montoTotal)
     else insertarHoja(a^.hd,titulo,montoTotal);
   end;
   
        procedure minimo (var min: entrada; var v: vector);
        var
          i, posMin: integer;
        begin
            min.titulo:= 9999;
            for i:= 1 to dimF do
                if (v[i] <> nil) then begin
                    if (v[i]^.dato.titulo < min.titulo) then begin
                        min.titulo:= v[i]^.dato.titulo;
                        min.horario:= v[i]^.dato.horario;
                        min.precio:= v[i]^.dato.precio;
                        posMin:= i;
                    end;
                end;
            if (min.titulo <> 9999) then
                v[posMin]:= v[posMin]^.sig;
        end;


    procedure mergeAcumulador(v:vector; var a: arbol);
    var
        actual,montoTotal:integer;
        min : entrada;
    begin
        minimo(min,v);
        while(min.titulo<>9999)do begin
            actual:=min.titulo;
            montoTotal:=0;
            while(min.titulo<>9999) and (actual=min.titulo)do begin
                if(min.horario=21)then
                    montoTotal:= montoTotal + min.precio;
                minimo(min,v);
            end;
            insertarHoja(a , actual , montoTotal);
            end;
        end;        
begin
    mergeAcumulador(v, a);
    if(a=nil)then
        writeln('Arbol vacio')
    else
        mostrarArbol(a);
end;

procedure mostrarV(v:vector);
    procedure mostrarLista(l:lista);
    begin
    if(l<>nil) then begin
    writeln('Titulo: ',l^.dato.titulo, '. Horario: ',l^.dato.horario,'. Precio: ',l^.dato.precio);
    mostrarLista(l^.sig);
    end;
 end;
  var
  i:integer;
 begin
  for i:=1 to dimF do begin
    writeln('DIA ',i);
    mostrarLista(v[i]);
  end;
   
end;

{PROGRAMA PRINCIPAL}

var
  v: vector;
  a:arbol;
begin
  a:=nil;
  cargarEntradas(v);
  mostrarV(v);
  incisoB(v,a);   
end.
    {Un cine desea analizar las ventas de entradas del último mes. Para ello dispone de
    un módulo “cargarEntradas” que lee la información de las entradas vendidas y
    genera una estructura donde por cada dia del mes (1..31) se tienen agrupadas
    todas las entradas vendidas dicho día. 
    De cada entrada se almacena: título de la película, horario de la función y precio. Para cada cada día del mes, las ventas se
    encuentran ordenadas por el título de la película.
    Se pide implementar un programa en Pascal que:
    a) invoque al módulo “cargarEntradas”.
    b) Implemente e invoque a un módulo que reciba la estructura generada en a)
    y retorne un ABB, donde por cada película se tenga el título de la película y
    el monto recaudado por dicha película en las funciones de las 21:00 hs. El
    ABB debe estar ordenado por el monto recaudado calculado  }

