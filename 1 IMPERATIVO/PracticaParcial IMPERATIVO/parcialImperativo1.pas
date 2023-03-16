
{1) Una obra social dispone de un árbol binario de búsqueda con la información de sus 
afiliados. De cada afiliado se conoce: Número de afiliado, Nro de DNI, Plan (1..5) y año de
anio af la obra social. El árbol se encuentra ordenado por número de afiliado. Se 
solicita:

Implementar un módulo que reciba el árbol de afiliados, Nro de DNI Num1, Nro de DNI 
Num2 y un número de Plan, y retorne un vector ordenado por Nro de DNI del afiliado.
 El vector debe contener el número de afiliado y DNI de aquellos afiliados cuyo Nro de DNI se encuentra comprendido entre Num1 y Num2 
 (siendo Num1 menor que Num2) 
 y el Plan se corresponda con el recibido por parámetro. Por norma de la obra social, cada Plan puede contar con af lo sumo 500 afiliados. }

program parcialimperativo1;
const 
  dimF = 5;
  dimF2 = 500;
type
  planes = 1..5;
  afiliado = record
    numAf: integer;
    numDNI: integer;
    plan: planes;
    anioA: integer;
  end;
  arbol = ^nodo;
  nodo= record 
    dato: afiliado;
    hi: arbol;
    hd: arbol;
  end;
    
  afiliado2 = record
    numAf: integer;
    numDNI: integer;
  end;
  lista = ^nodo2;
  nodo2 = record
    dato : afiliado2;
    sig: lista;
  end;
    
 vector = array [1..dimF] of lista;
 vector2 = array [1..dimF2] of afiliado2;
    
// fin TYPE

procedure crearArbol(var a: arbol);

 procedure insertarHoja(var a:arbol; af:afiliado);
  var
   x:integer; 
   nue :arbol;
  begin
    new(nue);
    nue^.dato:= af;
    nue^.hi:=nil;
    nue^.hd:=nil;
    if (a=nil) then
     a:=nue
    else
     if(nue^.dato.numAf < a^.dato.numAf) then
       insertarHoja(a^.hi,af)
       else
        if(nue^.dato.numAf>a^.dato.numAf)then
          insertarHoja(a^.hd,af);
  end;

   procedure leerAfiliado(var af: afiliado);
   begin
     af.numAf:=random(100);
     if(af.numAf<>0)then begin
      af.numDNI:= random(500);
      af.plan:= random(5)+1;
      af.anioA:= 2010 + random(12);  
    end;
   end;
 
 procedure mostrarArbol(a:arbol);
 begin
   if(a<>nil) then begin
    mostrarArbol(a^.hi);
    writeln('Num Afiliado: ',a^.dato.numAf,'. Num DNI: ',a^.dato.numDNI, '. Num PLAN: ',a^.dato.plan, '. Anio de afiliacion: ',a^.dato.anioA);
    mostrarArbol(a^.hd);
   end;
 end;

 var
  af:afiliado;
 begin
   Randomize;
   a:= nil;
   leerAfiliado(af);
    while (af.numAf <> 0) do begin
    insertarHoja(a,af);
    leerAfiliado(af);
    end;
    mostrarArbol(a);
end;

procedure incisoA(a:arbol; var v:vector); 

     procedure inicializarV(var v:vector);
      var
       i:integer;
      begin
        writeln('entro inicializar');
        for i:= 1 to dimF do
         v[i]:= nil;
        writeln('Salgo inicializar');
      end;
    
    procedure insertarOrdenado(var l:lista; numAf :integer ; dni: integer);
     var
      nue, act, ant : lista;
     begin
      new(nue);
      nue^.dato.numDNI := dni;
      nue^.dato.numAf := numAf;
      act:=l;
      ant:=l;
      if (l=nil) then
       l:= nue
      else 
       while (act <> nil) and (act^.dato.numDNI<dni) do begin
         ant:=act;
         act:= act^.sig;
       end;
        if (ant = act) then 
         l:=nue
        else
        ant^.sig := nue;
       nue^.sig:=act;
    end;     

    
    procedure busqueda (a: arbol; li: integer; ls: integer; var v: vector);
    begin  
      if (a <> nil) then begin;
        busqueda (a^.hi, li, ls, v);
        if (a^.dato.numDNI >= li) AND (a^.dato.numDNI <= ls) then begin
          insertarOrdenado (v[a^.dato.plan], a^.dato.numAf, a^.dato.numDNI);
        end;
        busqueda (a^.hd, li, ls, v);
        end;
    end;    
        
    procedure mostrarV (v: vector);

        procedure mostrarL (l: lista);
        begin 
          if (l <> nil) then begin
            writeln ('Numero de Afiliado: ',l^.dato.numAf,'. Numero de DNI del afiliado: ',l^.dato.numDNI);
            mostrarL (l^.sig);
          end;
        end;
        
     var
      i: integer;
     begin
      for i:= 1 to dimF do begin
       writeln ('PLAN: ', i);
       mostrarL (v[i]);
     end;
    end;

 var 
 dniSup,dniInf: integer;
 begin
    writeln ('Ingrese el dniInferior');
    readln (dniInf);
    writeln ('Ingrese el dniSup');
    readln (dniSup);
    inicializarV(v);
    busqueda (a, dniInf, dniSup, v);
    mostrarV (v);
end;


Procedure incisoB(a:arbol; Var v :vector2 ; var diml: integer);

    Procedure cargarV(Var v:vector2; numAF,numDNI : integer; var diml: integer); 
    Begin
    if(diml < dimf2 ) then begin
    diml:= diml+1;
    v[diml].numAf:=numAF;
    v[diml].numDNI:=numDNI;
    end else
    writeln('No hay espacio en el vector');
        End;


    Procedure busqueda (a: arbol; li: integer; ls: integer; numP: integer; Var v: vector2; var diml: integer);
    Begin
     If (a <> Nil) Then begin
        busqueda (a^.hi, li, ls,numP , v, diml);
        If (a^.dato.numDNI >= li) And (a^.dato.numDNI <= ls) AND (a^.dato.plan = numP) Then
            cargarV (v, a^.dato.numAf, a^.dato.numDNI, diml);
        busqueda (a^.hd, li, ls,numP, v, diml);
     end;
    End;

    procedure ordenarV (var v: vector2; diml: integer);
    var
    i,j,k:integer;
    aux : afiliado2;
    begin
    for i:= 1 to diml-1 do begin
        k:=i;
        for j:= i+1 to diml do begin
        if(v[j].numDNI < v[k].numDNI) then
          k:=j;
        end;
        aux:= v[k];
        v[k]:= v[i];
        v[i]:= aux;
    end;
    end;

    Procedure mostrarV (v: vector2; diml:integer);
    var
      i:integer;
    Begin
    For i:= 1 To diml Do
        Begin
        writeln (i,')  Numero de Afiliado: ', v[i].numAf, ' .Numero de DNI del afiliado: ', v[i].numDNI);
        End;
    End;

    Var 
    dniSup,dniInf,nPlan: integer;
    Begin
    writeln ('Ingrese el dniInferior');
    readln (dniInf);
    writeln ('Ingrese el dniSup');
    readln (dniSup);
    writeln ('Ingrese el numero de plan del que quiera buscar');
    readln (nPlan);
    busqueda (a, dniInf, dniSup, nPlan, v, diml);
    mostrarV (v,diml);
    ordenarV (v,diml);
    mostrarV (v,diml);
End;

var 
 a:arbol;
 v: vector;
 v2: vector2;
 dimL: integer;
begin
 dimL:= 0;
 crearArbol(a); 
 //incisoA(a,v); //MERGE COMPLETO que devuelve un VECOTr CON LISTAS DIVIDIDO EN PLANES CON LOS Numero de afiliados y DNi AFiliado;
 incisoB(a,v2,dimL); //MERGE DEL EXAMEN nos devuelve un VECTOR CARGADO CON REGISTROS ORdenados Por DNI de los datos de un NUMERO DE PLAN DETERMINADO;
end.