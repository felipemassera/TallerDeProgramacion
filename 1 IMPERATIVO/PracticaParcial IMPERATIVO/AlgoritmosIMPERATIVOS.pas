program AlgoritmosIMPERATIVO;

{Listas}

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
  
  procedure agregarAtras(var l:lista;var ult:lista; o:objeto);
        var
        nue:lista;
        begin
        new(nue);
        nue^.dato:= o;
        nue^.sig:=nil;
        if (l=nil) then 
          l:=nue
        else 
          ult^.sig:=nue;
        ult:=nue; 
  end;

 Procedure agregarAdelante(var l:lista; o: objeto);
 var
  nue:lista;
  begin
    new(nue);
    nue^.dato:= o;
    nue^.sig:=l
    l:=nue;
  end;


procedure inciso(v:vector; var a:arbol);
procedure minimo (var min: OBJETO; var v: vector);
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
                    montoTotal:= montoTotal + min.precio;
                minimo(min,v);
            end;
            crearArbol(a , actual , montoTotal);  //O puede ser el llamado a un AGREGAR A UNA LISTA
            end;
        end;
    end;


    procedure MERGECOMUN (l1, l2: lista; var l3: lista);

    procedure minimo (l1, l2: lista; var min: dato);
    begin
        min.cod:= 9999
        if (l1 <> nil) and (l2 <> nil)then
          if (l1.dato.cod <= l2.dato.cod ) then
            min:= l1^.dato;
          else
            min:= l1^.dato;
        else (l1 <> nil) and (l2 = nil) then
          min:= l1^.dato
        else (l1 = nil) and (l2 <> nil) then
          min:= l2^.dato;
    end;

    procedure merge (l1, l2: lista; var l3: lista);
    var
      min: dato;
    begin
      minimo (l1, l2, min);
      while (min <> 9999) do begin
        agregarAtras (l3, min);
        minimo (l1, l2, min);
      end;
    end;


{VECTORES}


procedure ordenacionSeleccion (var v: vector);
var
  i, j, p: integer;
  aux: dato;
begin
  for i:= i to diml-1 do begin
    j:= i;
    for p:= i+1 to diml do begin
      if (v[p] < v[j]) then
        j:= p;
    aux:= v[j];
    v[j]:= v[i];
    v[i]:= aux;
end;

Procedure ordenInsercion ( Var v: vector; dimL: integer );

Var i, j: integer;
  actual: oficina;

Begin
  For i:=2 To dimL Do
    Begin
      actual := v[i];
      j := i-1;
      While (j > 0) And (v[j].codigo > actual.codigo) Do
        Begin
          v[j+1] := v[j];
          j :=  j - 1;
        End;
      v[j+1] := actual;
    End;
End;



procedure busquedaDicotomica (v:vector; pri:integer; ult:integer; dato:integer; var pos :integer; var ok:boolean);
  var 
   medio:integer;
  begin
   if (pri> ult) then begin 
     pos:=-1;
     ok:=false;
   end
   else begin
     medio:= (pri+ult) div 2;
     if(v[medio] = dato ) then begin
       pos:= medio;
       ok:=true;
     end
     else
       if ( v[medio] > dato ) then busquedaDicotomica(v,pri, medio-1, dato,pos,ok)
          else busquedaDicotomica(v,medio+1,ult, dato,pos,ok);
    end;
  end;
end;

{ARBOLES}

procedure maximoA (a: arbol; var numMax: integer);
begin
  if (a = nil) then
    numMax:= 0
  else
    if (a^.hd = nil) then numMax:= a^.dato.numero
    else maximoA:= (a^.hd)
end;


procedure crearArbol(var a:arbol; objeto: objeto);
begin
  if(a=nil) then begin
    new(a); a^.dato:= objeto; a^.hi:=nil; a^.hd := Nil;
  end else (a^.dato.num > objeto.num )then crearArbol(a^.hi,objeto)
  else crearArbol(a^.hd,objeto);
end;

procedure imprimirA(a:arbol);
begin
 if(a<>nil) then begin
   imprimirA(a^.hi);
   write('Dato',a^.dato);
   imprimirA(a^.hd);
 end;
end;

function buscarEntreValoresArbol (a: arbol; li: integer; ls: integer): integer;
begin
    if (a = nil) then
      buscarEntreValores:= 0
    else
      if (a^.dato.num >= li) AND (a^.dato.num <= ls) then
        buscarEntreValores:= 1 + buscarEntreValores(a^.hi, li, ls) + buscarEntreValores (a^.hd, li, ls)
      else
        if (a^.dato.num > ls) then
          buscarEntreValores:= buscarEntreValores (a^.hi, li, ls)
        else
          if (a^.dato.num < li) then
            buscarEntreValores:=  buscarEntreValores (a^.hd, li, ls);  
end;

