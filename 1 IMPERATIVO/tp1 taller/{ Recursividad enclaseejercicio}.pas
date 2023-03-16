{ Recursividad } 
function Maximo (x,y : integer): integer;

Maximo = 

procedure maxlista (l:lista);
 if l = nil then 
 maxlista := -999
 else
 maxlista = Maximo (l^.dato , maxlista(l^.sig))

end;
end;

function existe (l:lista ; x: integer) : boolean
if (l=nil) then 
existe := false
else
existe := (x = l^.dato) or existe(l^.sig,x);

{nota pregunta de final: que es mas efectivo un arbol o una lista en una busqueda? La respuesta es: DEPENDE YA QUE 
SI UNO REALIZA UNA BUSQUEDA ORDENADA POR EL TIPO DE DATO QUE ESTAMOS BUSCANDO ES MAS EFECTIVO EL ARBOL, YA QUE DE ESTA MANERA SE VAN DESCARTANDO RAMAS
DEL MISMO EN FUNCION DE MAYOR O MENOR, SIN EMBARGO SI EL DATO QUE ESTAMOS BUSCANDO ES DIFERENTE A LA CONDICION DE ORDENAMIENTO, VAMOS A TENER QUE
RECORRER TODO EL ARBOL EN BUSQUEDA DEL DATO, Y EN ESTE CASO DA IGUAL }