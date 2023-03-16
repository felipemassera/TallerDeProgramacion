{Se lee desde teclado una secuencia de sitios turísticos hasta que llegue el sitio con
nombre ‘fin’. De cada sitio se conoce: nombre, provincia a la que pertenece,cantidad de actividades, cantidad de
personas que lo visitaron en un mes.Se pide:
    a) El nombre del sitio conmayor cantidad deactividades.
    b) La cantidad de sitios conmás de 20.000 personas que lo visitaron en unmes.}
Program Registro;

Type 
  numeritos = 0..100;
  lugar = Record
    name: String[30];
    prov : string [30];
    act: numeritos;
    visit: integer;
  End;

Procedure actualizarMax(regact : numeritos; regname :String; Var act: numeritos; Var nombre:String);
Begin
  If (regact> act) Then
    Begin
      act := regact;
      nombre := regname;
    End;
End;


Procedure carga ();

Var 
  x: lugar;
  masActName: string[30];
  maxAct, aux : numeritos;
Begin
  aux := 0;
  maxAct := 0;
  writeln ('ingrese el nombre del lugar de destino');
  readln (x.name);
  While x.name <> 'fin' Do
    Begin
      writeln ('ingrese la provincia');
      readln (x.prov);
      writeln ('ingrese la cantidad de actividades');
      readln (x.act);
      writeln ('ingrese la cantidad de visitas');
      readln (x.visit);
      actualizarMax(x.act,x.name,maxAct,masActName);
      If (x.visit>20000)Then
        aux := aux+1;
      writeln ('ingrese el nombre del lugar de destino');
      readln (x.name);
    End;
  writeln('El lugar con mayor cantidad de actividades es: ', masActName, ' con '
          , maxAct , ' actividades.' );
  writeln('La cantidad de lugares con mas de 20.000 visitas es de: ', aux, '.');
End;

Begin
  carga ();
End.
