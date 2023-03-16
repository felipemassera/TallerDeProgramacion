
Program TeoriaMerge;

Type 
  lista = ^nodo;
  nodo = Record
    dato: string;
    sig: lista;
  End;
  estantes = array [1..5] Of lista;

procedure minimo(var e1,e2:lista; var min:string);
Begin
  min := 'ZZZ';
  if (e1 <> nil) and (e2 <> nil)then
       if (e1^.dato <= e2 ^.dato ) then 
         begin
           min:= e1^.dato;
           e1:= e1 ^.sig; 
         end 
       else begin
         min:= e2 ^.dato;
         e2:= e2 ^.sig;
       end 
  else 
    if (e1 <> nil) and (e2 = nil) then begin
      min:= e1^.dato;
      e1:= e1 ^.sig;
    end 
    else 
      if (e1 = nil) and (e2 <> nil) then begin
         min:= e2 ^.dato;
         e2:= e2 ^.sig; 
       end;

Procedure merge( todos : estantes ; Var Enuevo:lista);
Begin
  Enuevo := Nil;
  minimo (todos,min);
  While (min <> ‘ZZZ’) Do
    Begin
      agregarAtras (Enuevo,min);
      minimo (todos,min);
    End;
End;

Var 
  todos: estantes;
  estanteNuevo: lista;
Begin
  generarEstantes (todos);
  merge (todos,estanteNuevo);
End.



