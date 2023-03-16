program untitled;

type
	lista=^puntero;
	puntero=record
		elem:integer;
		sig:lista;
	end;
procedure leer(var x:integer);
begin
	read(x)
end;

{------------------------}
procedure agregarAdelante(var l:lista;x:integer);
var
	aux:lista;
begin
	new(aux); aux^.elem:=x; aux^.sig:=nil;
	if(l=nil)then
		begin
		l:=aux;
		end
	else	
		begin
		aux^.sig:=l;
		l:=aux;
		end;
end;

procedure crearAdelante(var l:lista);
var
	x:integer;aux:lista;
begin
	leer(x);
	while(x<>-1)do
		begin
		agregarAdelante(l,x);
		leer(x);
		end;
end;

{------------------------}
procedure agregarFinal(var l:lista;x:integer); //// COPIAR MODULO PARA MAÑANA;	
var
	nuevo,aux:lista;
begin
	new(aux); aux^.elem:=x; aux^.sig:=nil;
	if(l=nil)then
		l:=aux
	else
		begin
		nuevo:=l;
		while(nuevo^.sig<>nil)do
			nuevo:=nuevo^.sig;
		nuevo^.sig:=aux;	
		end;
end;


procedure crearFinal(var l:lista);
var
	x:integer;aux:lista;
begin
	leer(x);
	while(x<>-1)do
		begin
		agregarFinal(l,x);
		leer(x);
		end;
		
end;
	
function buscar(l:lista;x:integer):boolean;
var
	ok:boolean;
begin
	ok:=false;
	while((l<>nil) and (ok=false))do
		begin
		if(l^.elem=x)then
			ok:=true
		else
			l:=l^.sig;
		end;
end;
		
		
procedure informar(l:lista);
begin
	while(l<>nil)do
		begin
		writeln(l^.elem);
		l:=l^.sig;
		end;
end;

procedure eliminar(var l:lista;x:integer);  //// COPIAR MODULO PARA MAÑANA;	
var
	ant,act:lista;
begin
	ant:=l;
	act:=l;
	while((act<>nil) and (act^.elem<>x))do
		begin
		ant:=act;
		act:=act^.sig;
		end;
	if(act<>nil)then
		begin
		if(act=l)then
			begin
			l:=l^.sig;
			dispose(act);
			end
		else
			begin
			ant^.sig:=act^.sig;
			dispose(act);
			end;
		end;
end;

procedure insertar(var l:lista;x:integer); //// COPIAR MODULO PARA MAÑANA;	
var
	nuevo,act,ant:lista;
begin
	new(nuevo);nuevo^.elem:=x;nuevo^.sig:=nil;
	if(l=nil)then
		begin
		l:=nuevo;
		end
	else
		begin
		ant:=l;
		act:=l;
		while((act<>nil) and (act^.elem < nuevo^.elem))do  //donde dice (act^.elem < nuevo^.elem) hay que cambiar el mayor o menor en funcion de como se agrega a la lista, atras o adelante.
			begin
			ant:=act;
			act:=act^.sig;
			end;
			
		if(act=l)then
			begin
			nuevo^.sig:=l;
			l:=nuevo;
			end
		else
			if(act<>nil)then
				begin
				ant^.sig:=nuevo;
				nuevo^.sig:=act;
				end
			else
				begin
				ant^.sig:=nuevo;
				nuevo^.sig:=nil;
				end;
		end;
end;


var
	valor,x:integer;
	l:lista;
BEGIN
	l:=nil;
	{crearAdelante(l);}
	crearFinal(l);
	informar(l);
	writeln('Ingrese el numero a eliminar');
	read(valor);
	if(buscar(l,valor))then
		eliminar(l,valor)
	else
		writeln('El numero no se encontro');
	informar(l);
	
	
	writeln('Escriba el numero a insertar');read(x);
	writeln('entro a insertar');
	insertar(l,x);
	
	informar(l);
	
	
END.


