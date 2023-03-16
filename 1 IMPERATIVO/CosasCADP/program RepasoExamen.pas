program RepasoExamen
//MAXIMOS T MINIMOS
program DosMaximos; //de esta manera podemos realizar la extraccion de los dos numeros mas grandes dados por teclados 
var                 // HASTA QUE SE PONGA EL 0  que es la salida del WHILE Y QUE NO HAY QUE PRocesar
 max1, max2: integer;
 n: integer;
begin
 max1:=-1; max2:=-1; {inicializa los maximos con el valor mas chico posible}
 read(n);
 while (n <> 0) do begin
 if (n > max1) then begin {evalua máximo 1}
 max2:=max1; //EN ESTE CASO HAYQUE ALMACENAR PRIMERO EN MAX 2 EL VALOR DE MAX1 xq sino se pierde al actualizar
 max1:=n;
 end
 else
 if (n > max2) then {evalua máximo 2}
 max2:=n;
 read(n);
 end;
 writeln(‘Los 2 números mas altos fueron’, max1,‘y’, max2);
end.
 // Ejemplo 2 de MAX y min
If (altura > max1)Then
  Begin
    max2 := max1;
    dnimax2 := dnimax1;
    max1 := altura;
    dnimax1 := dni;
  End
Else
  If (altura > max2)Then
    Begin
      max2 := altura;
      dnimax2 := dni;
    End;

// DIV Y MOD,Procesar numeros par o impar
Procedure ParImpar(a: integer; Var par,impar:integer);
Var 
  dig : integer;
Begin
  While a<>0 Do
    Begin
      dig := a Mod 10;
      writeln('el digito mod 10 es ',dig);
      If (dig Mod 2 = 0) Then
        par := par+1
      Else
        impar := impar+1;
      a := a Div 10;
    End;
End;

abs(random(maxint)); //esta funcion sirve:"ABS como absoluto de un numero (en caso de ser- lo pasa a positivo).
// y random num al azar. maxint numero mas grande posible de integer.  