{1.	Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda.
*  De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 
* y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba 
* el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído
*  y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo 
* que retorne la suma de las edades de los socios.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra 
* entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. 
}
Program tp3Ej1;

Type

	socio = record
	nSocio : integer;
	nombre : String [30];
	edad: integer;
	end;

	arbol = ^nodo;
	nodo = record
          dato: socio;
          hi: arbol;
          hd: arbol;
         end;
	procedure incisoA (var a:arbol);
	
		procedure crearArbol (var a:arbol; s: socio);
		begin
		if (a=nil) then begin
		new(a);
		a^.dato:=s ; a^.hi := nil; a^.hd := nil; 
		end else if (s.nSocio < a^.dato.nSocio) then crearArbol(a^.hi,s)
		else crearArbol(a^.hd,s);
		end;
		
		procedure leerSocio(var s: socio);
		begin	
			writeln('Ingrese el numero de socio');
			read(s.nSocio);
			if (s.nSocio<>0) then begin
			
				writeln('Ingrese la edad del socio');
				readln(s.edad);
				
				writeln('Ingrese el nombre del socio: ');
				readln(s.nombre);
			end;
		end;
		
		procedure cargarSocio(var a:arbol);
		var
		s:socio;
		begin
		leerSocio(s);
		while (s.nSocio<>0) do begin
		crearArbol(a,s);
		leerSocio(s);
			end;
		end;
		
	begin
	cargarSocio(a);
	end;


	Function nSocioMAX(a:arbol):integer;
	begin
	if (a=nil)then nSocioMAX:= -1 //aca no se encuentra el numero
	else if (a^.hd=nil) then
		nSocioMAX:= a^.dato.nSocio
	else nSocioMAX:=nSocioMAX(a^.hd);	
	end;
	
	Function nSocioMIN(a:arbol):integer;
	begin
	if (a=nil)then nSocioMIN:= +9999 //aca no se encuentra el numero
	else if (a^.hi=nil) then
		nSocioMIN:=a^.dato.nSocio
	else nSocioMIN:=nSocioMIN(a^.hi);	
	end;
	
	procedure biii (a:arbol);
var
	maxEdad, maxNum:integer;
	procedure buscarMasEdad(a:arbol; var maxE:integer; var maxN:integer);
	begin
	   if ( a <> nil ) then begin
		writeln(a^.dato.nSocio);
		if (a^.dato.edad > maxE) then begin
			maxE:=a^.dato.edad;
			maxN:=a^.dato.nSocio;
		end;
		buscarMasEdad (a^.hi, maxE, maxN);
		buscarMasEdad (a^.hd, maxE, maxN);
   end;
end;

begin
	maxEdad:=-1;
	buscarMasEdad(a, maxEdad, maxNum);
	writeln('Edad mas grande ',maxEdad);
	writeln('Edad mas grande (numero de club) ',maxNum);
end;
	
	procedure aumentarEdad(a:arbol);
	begin
	if (a<>nil)then
		a^.dato.edad:=a^.dato.edad+1;
	aumentarEdad(a^.hi);
	aumentarEdad(a^.hd);
	end;
	
	procedure incisoBpuntoV(a:arbol);
		Function BuscarNumSocio (a:arbol; x:integer): boolean; 
		begin
		  if (a=nil) then 
			  BuscarNumSocio:=false
		  else if (x = a^.dato.nSocio) then BuscarNumSocio:= true
			   else if (x < a^.dato.nSocio) then 
				  BuscarNumSocio:= BuscarNumSocio(a^.hi ,x)
				else  
				  BuscarNumSocio:=BuscarNumSocio(a^.hd ,x)
		end;
		
	var
	x:integer;
	begin
	writeln('Ingrese el numero de socio que desea buscar');
	read(x);
	if (BuscarNumSocio(a,x)=false)then
	writeln('El numero de socio no se encuentra!')
	else writeln('El numero de socio Se encontro en el arbol');
	end;

	function existeElNombre(a:arbol;x: string):boolean;
	begin
	if (a=nil) then existeElNombre:= false
	else existeElNombre:=(a^.dato.nombre = x) or existeElNombre(a^.hi, x) or existeElNombre(a^.hd, x);
	end;

	function contar(a:arbol):integer;
		begin
			if (a = nil) then
				contar:=0
			else begin
				contar:= 1 + contar(a^.hd) + contar(a^.hi); //aca cuenta por cada recursion hacia las ramas
			end;
		end;
	function sumaEdad(a:arbol):integer;
		begin
		if (a=nil) then sumaEdad:=0 
		else begin
		sumaEdad:=  a^.dato.edad + sumaEdad(a^.hi)+ sumaEdad(a^.hd);
			 end;
		end;
	function sociosEntreValores(a:arbol; inf,sup:integer):integer;
	begin
	writeln('comienza a iterar E/valores');
	if (a=nil) then begin sociosEntreValores:= 0;
	writeln('llego al final'); 
	end
	else if ( a^.dato.nSocio>sup) then //verifico que el 1er nodo no sea mas grande que el sup,si es asi vamos a la izq
		sociosEntreValores:= sociosEntreValores(a^.hi,inf,sup)
		else if (a^.dato.nSocio>=inf) and (a^.dato.nSocio<=sup) then //verifico si el 1er nodo esta entre valores, si es asi sumo uno y llamo a los dos laterales
		sociosEntreValores:=1+sociosEntreValores(a^.hi,inf,sup)+sociosEntreValores(a^.hd,inf,sup)
		else sociosEntreValores(a^.hd,inf,sup); //si no esta entre valores, y no supera el superior significa que esta por debajo del inf, entonces va a la derecha(mayor puntaje)
	writeln('N socios entre rangos es', sociosEntreValores);
	end;
	
	Procedure enOrdenCresciente ( a : arbol ); 
	begin
		if ( a<> nil ) then begin
		enOrdenCresciente (a^.hi);
		write (a^.dato.nSocio,' ');
		enOrdenCresciente (a^.hd);
		end;
	end;
	Procedure enOrdenDecrescientePar ( a : arbol ); 
	begin
		if ( a<> nil ) then begin
		enOrdenDecrescientePar (a^.hd);
		if (a^.dato.nSocio mod 2 = 0) then write(a^.dato.nSocio,' ');
		enOrdenDecrescientePar (a^.hi);
		end;
	end;
	
	
Var
 a:arbol; 
 nombre:String;
inf,sup,totSocios:integer;
Begin
a:=nil;
{A} incisoA(a);
{b1} writeln ('El numero de socio mayor es el: ', nSocioMAX(a));
{b2} writeln ('El numero de socio Menor es el: ', nSocioMin(a));
{b3} biii(a);
//{b4} aumentarEdad(a);
//{b5} incisoBpuntoV(a);
// write('Ingrese el nombre que desea buscar en el arbol');
// readln(nombre);
//{b6} writeln('Existe el nombre buscado? ',existeElNombre(a,nombre),'!!!');
//totSocios:=contar(a)-1;
//{b7} writeln ('La cantidad de socios que hay es: ',totSocios);
//{b8} writeln('El promedio de las edades de los socios es: ', (sumaEdad(a)/totSocios):2:2);
//write('Ingrese el valor inferior de busqueda: ');
// readln(inf);
// write('Ingrese el valos superior de busqueda: ');
// readln(sup);
//{b9} writeln('La candidad de socios entre los valores es de: ', sociosEntreValores(a,inf,sup));
//informar los numeros de socio de forma cresciente
//writeln('ORDEN CRESCIENTE');
//{b10} enOrdenCresciente (a); 
//writeln('ORDEN DECRESCIENTE');
//{b11} enOrdenDecrescientePar(a); 

End.

