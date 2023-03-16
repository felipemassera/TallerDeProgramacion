{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program tp2Ej4;
const
dimf =10;
type
vector = array [1..dimf] of integer;

procedure cargarVector(var v: vector; i: integer);
begin
    if (i<=dimf) then begin
    v[i]:= random(100);
    cargarVector(v,i+1);
    end;
end;

function maxV(v:vector;indice,dF:integer):integer;
var
	ant:integer;
begin
	if(indice<=dF)then begin
		ant:=maxV(v,indice+1,dF);
		if(v[indice]>ant)then begin
			maxV:=v[indice];
		end else begin
			maxV:=ant;
		end;
	end;
end;

function minimoValorVector(v:vector;indice,dF:integer):integer;  {El DF es la constante pero hay que pasarlo como Paramentro}
var
	ant:integer;
begin
	if(indice<=dF)then begin
		ant:=minimoValorVector(v,indice+1,dF);
		if(v[indice]<ant)then begin // < = minimo \\ > maximo
			minimoValorVector:=v[indice];
		end else begin
			minimoValorVector:=ant;
		end;
	end;
end;

procedure verVector(v: vector; i:integer);
begin
for i:=1 to dimf do
  writeln (i,') ',v[i]);  
end;

procedure sumaTotalArr(arr: vector ; var pos: integer ; var total: integer);
begin
	if (pos < dimF) then begin
		pos:= pos + 1;
		total:= total + arr[pos];
		
		writeln(pos,') ',total);
		sumaTotalArr(arr, pos, total);
	end;	
end;

var
v: vector;
i,total:integer;
begin
total:=0;
i:=1;
Randomize;
{Inciso A } cargarVector(v,i);
verVector(v,i);
{Inciso B } Writeln('el max  es: ',maxV(v,i,dimF));
writeln ('El min es: ', minimoValorVector(v,i,dimF));
i:=0;
{Inciso C } sumaTotalArr(v,i,total);
writeln('La suma de todos los digitos es igual a ', total);
end.


