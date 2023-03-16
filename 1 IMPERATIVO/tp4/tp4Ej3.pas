{3.	Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. 
De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida.
 El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un programa que:
 
a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la
 cantidad total vendida para cada código de producto.}
program ejercicio3;
const
    dimF=4;
type
    venta=record
        fecha:integer;
        cod_prod:integer;
        cod_suc:integer;
        cant:integer;
    end;
    venta2 = Record
        cod_prod: integer;
        cant: integer;
    End;
    lista2=^nodo2;
    nodo2=record
        dato:venta2;
        sig:lista2;
    end;

  lista=^nodo;
  nodo=record
    dato:venta;
    sig:lista;
  end;
  vector=array[1..dimF]of lista;

procedure incisoA(var v: vector);

    procedure inicializar(var v:vector);
    var
    i:integer;
    begin
    for i:=1 to dimF do 
        v[i]:=nil;
    end;




    procedure cargarVector(var v:vector);
    
        procedure leerVenta(var p:venta);
        begin
            writeln('Ingrese codigo de sucursal:');
            readln(p.cod_suc);
            if(p.cod_suc<>0)then begin
                writeln('Ingrese fecha:');
                readln(p.fecha);
                writeln('Ingrese codigo de producto:');
                readln(p.cod_prod);
                writeln('Ingrese cantidad:');
                readln(p.cant);
            end;
        end;
        
        procedure leerVentaAuto(var p:venta);
        begin
            writeln('Ingrese cod de sucursal');
            readln(p.cod_suc);
            //p.cod_suc:= random(4);
            p.fecha:= random(12);
            p.cod_prod := random(25);
            p.cant := random(100);
        end;

        procedure insertarOrdendado(var l:lista; v:venta);
        var
        nue, ant,act : lista;
        begin
          new(nue);
          nue^.dato:= v;
          ant:= l; act:=l;
          while (act <>nil) and (act^.dato.cod_prod < v.cod_prod )do begin
            ant := act;
            act:= act^.sig;
          end;
          if (ant = act) then //en este caso nosotros al igualar ant y act significa que no entro nunca al while por ser NIL.
            l:= nue
          else 
            ant^.sig := nue;
          nue^.sig:= act;
        end;      
        
    var
        p:venta;
    begin
        Randomize;
        leerVentaAuto(p);
        while (p.cod_suc <> 0) do begin
            insertarOrdendado(v[p.cod_suc],p);
            leerVentaAuto(p);
        end;
    end;
begin
    inicializar(v);
    cargarVector(v);
end;


    
      

procedure incisoB(v:vector; var l: lista2);
    
    Procedure agregarAtras(var l: lista2;var ult: lista2; cant, cod_prod: integer);
    var 
        nue: lista2;
    begin
        writeln('entre AGregar ATRAS');
        new(nue);
        nue^.dato.cod_prod:= cod_prod;
        nue^.dato.cant:= cant;
        nue^.sig := nil;
        if (l=nil) then
            l:= nue
        else 
            ult^.sig:=nue;
        ult := nue;  
                  
        
       writeln('Salgo Agregar Atras');
    end;
    
    
    
    {Procedure agregarAtras(var l: lista2;var ult: lista2; cant, cod_prod: integer);
    var 
        nue: lista2;
    begin
        writeln('entre AGregar ATRAS');
        new(nue);
        nue^.dato.cod_prod:= cod_prod;
        nue^.dato.cant:= cant;
        nue^.sig := nil;
        if (l=nil) then begin
            l:= nue;
            ult:=nue;
        end
        else begin
            ult^.sig:=nue;
            ult := nue;  
        end;          
        
       writeln('Salgo Agregar Atras');
    end;}

    procedure minimo(var v:vector;var min:venta2);
    var
      indiceMin,i:integer;
    begin
        writeln('Entre Al Minimo');
        min.cod_prod:=9999;
        for i:=1 to dimF do 
            if(v[i]<>nil)then
                if(v[i]^.dato.cod_prod<=min.cod_prod)then begin
                    indiceMin:=i;
                    min.cod_prod:=v[i]^.dato.cod_prod;
                    min.cant:= v[i]^.dato.cant;
                end;
        if(min.cod_prod<>9999)then
            v[indiceMin]:=v[indiceMin]^.sig; 
        writeln('Salgo Del Minimo');
    end;

    procedure merge(v:vector;var l:lista2);  //aca el vector no se pasa como var 
    var 
        min:venta2;
        ult: lista2;
        act,cantTotal:integer;
    begin
        writeln('Entro al merge');
        ult:= nil;
        minimo(v,min);
        while(min.cod_prod<>9999) do begin  //ponemos 9999 ya que si minimo devuelve ese valor es por que todas las listas fueron NIL;
            act:= min.cod_prod;
            cantTotal:=0;
            while (min.cod_prod<>9999) and (min.cod_prod = act) do begin
              cantTotal:=cantTotal+min.cant; //acumulamos con el corte de control
              minimo(v,min);
            end;
        agregarAtras(l,ult,cantTotal,act);  //mandamos lista, ultimo nodo, cantidad todal y cod del producto.
        end;
        writeln('Salgo MERGE');

    end;

begin
  merge(v,l);  
end;





procedure mostrarV(v:vector);
    Procedure mostrarL(l:lista);
    Begin
        If (l<>Nil) Then
        Begin
            writeln ('Codigo de producto: ',l^.dato.cod_prod,'. Cantidad Vendida: ',l^.dato.cant);
            mostrarL(l^.sig);
        End;
    End;

var 
    i:integer;
begin
    for i:=1 to dimF do begin
      writeln('Sucursal: ',i);
      mostrarL(v[i]);
    end;
end;


procedure mostrarL2(l:lista2);
begin
  if(l<>nil) then begin
    writeln ('Codigo de producto: ',l^.dato.cod_prod,'. Cantidad Vendida: ',l^.dato.cant);
    mostrarL2(l^.sig);
  end;
end;


        {PROGRAMA PRINCIPAL}
var
    v:vector;
    l:lista2;
begin
    l:=nil;
    incisoA(v);
    incisoB(v,l);
    writeln('Inciso B Completado');
    Writeln('MUESTRO LISTAS ORIGINALES ');
    mostrarV(v);
    Writeln('MUESTRO LISTAS MERGE ');
    mostrarL2(l);
end.
