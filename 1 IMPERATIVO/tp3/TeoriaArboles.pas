{
}
Programa arboles;

Type
  arbol = ^nodo;
  tipo = ...;
  nodo = record
          dato: tipo;
          HI: arbol;
          HD: arbol;
         end;

Procedure crear (var A:árbol; num:integer);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.dato:= num; A^.HI:= nil; A^.HD:= nil;
   end
   else if (num < A^.dato) then crear(A^HI,num)
    else crear(A^.HD,num)   
End;


Procedure enOrdenCresciente ( a : arbol );  {Si quiero hacerlo decreciente debo inverit Hi con HD}
begin
   if ( a<> nil ) then begin
    enOrdenCresciente (a^.HI);
    write (a^.dato);
    enOrdenCresciente (a^.HD);
   end;
end;

Procedure preOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    write (a^.dato);   
    preOrden (a^.HI);
    preOrden (a^.HD);
   end;
end;

Procedure posOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    posOrden (a^.HI);
    posOrden (a^.HD);
    write (a^.dato);

   end;
end;

Function Buscar (a:arbol; x:elemento): arbol; 
 begin
  if (a=nil) then 
      Buscar:=nil
  else if (x = a^.dato) then Buscar:=a
       else 

        if (x < a^.dato) then 
          Buscar:= Buscar(a^.hi ,x)
        else  
          Buscar:=Buscar(a^.hd ,x)
end;


Var
 abb:arbol; x:integer;
Begin
 abb:=nil;
 read (x);
 while (x<>0)do
  begin
   crear(abb,x);
   read(x);
  end;
End.

