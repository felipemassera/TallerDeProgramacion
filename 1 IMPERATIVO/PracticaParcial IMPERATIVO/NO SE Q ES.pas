

procedure ordenarv(var v);
var 
 ijk:integer;
 aux : dato;
begin
  
  for i:=1 to diml-1 do begin
    k:=i;
    for j:= i+1 to diml do
       if(v[j]< v[k]) then
        k:=j;
    end;
    aux:= v[k];
    v[k]:= v[i]
    v[i]:= aux 
end;

procedure minimo(var v:vector,var min objeto)
 var
  i, imenor:= integer;
   begin
    
     min := 9999;
        for i := 1 to dimf do begin
          if (v[i]<>nil) then begin
            if(v[i]< min) then begin
              min:= v[i]
                imenor:= i             
          end;
            if (min<>9999) then
             v[i]:= v[i]^.sig
   end;

 procedure merge (v:vector ; var l : lista);

  var
    min, tot:intger
  begin
    minimo(v,min);
    while (min <>9999) do begin
    act := MIN.DATO;
    TOT:= 0;
        while(min<>9999) and (v = actual) then
             total:= total + act;
           minimo(v,min); 
    end;     
    agregarAdelante(l,o);

  end;

  PROCEDURE DICOTOOMICA( V, PRI,ULT,DATO,POS);
    Var
    MEDIO:=INTEGER;
    begin
     IF(PRI>ULT) THEN POS:= -1
     ELSE Begin
      MEDIO:= (PRI+ULT) DIV 2;
      IF (V[MEDIO] = DATO) THEN
       POS:= MEDIO
       ELSE 
        IF(V[MEDIO]>DATO ) THEN DICOTOOMICA(V, PRI, MEDIO-1,DATO,POS) 
        ELSE DICOTOOMICA(V,MEDIO+1,ULT,DATO,POS)


INSERTARORDENARDO

Var
NUE,ANT,ACT;
Begin
 NEW NUE
 NUE :=DATO
 NUE^.SIG :=Nil
 IF(L:= NIL)
  L:= NUE
   ELSE
    WHILE ()