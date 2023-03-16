


{Realice un programa que lea de teclado la información de ciudades turísticas (
provincia,nombredeciudad,cantidad de actividades cantidad visitantes, ORDENADA POR PROVINCIA, que termina con la provincia ‘fin’.
Obtener cuál es la provincia con más visitantes a sus ciudades turísticas.}

Program cortecontrol;

Type 
  turist = Record
    prov : string [30];
    nombreciudad : string [30];
    act: integer;
    visitantes: integer;
  End;

procedure actualizarMAX(prv:String;vistot:integer; Var Xvis:integer; Var Xprov: String );
begin
if (vistot>Xvis) then begin
  Xvis:= vistot;
  Xprov:= prv;
end;
end;

Procedure carga (r : turist; Var Xvis:integer; Var Xprov: String );

Var 
  vistot : integer;
  provAct : String[30];
Begin
  provAct := '';
  writeln ('Ingrese la provincia ');
  readln(r.prov);
  While (r.prov <> 'fin') Do // como corta la salida
    Begin
      provAct := r.prov;
      vistot := 0;
      While (provAct = r.prov) Do //evaluacion de prov act con la lectura (salida de while al cambiar de prov)
        Begin
          writeln('Ciudad:');
          readln (r.nombreciudad);
          writeln('Cant de actividades:');
          readln (r.act);
          writeln('Cant de visitas:');
          readln (r.visitantes);
        vistot := vistot + r.visitantes;
        writeln ('Ingrese la provincia: ');
        readln(r.prov);
        End;
    actualizarMAX(provAct,vistot,Xvis,Xprov); //prestar atencion que si pasaba r.prov era laa nueva (la salida del while) y ahi me comia un chotazo/ 
    End;
End;


Var 
  ciudadTuristica : turist;
  maxVis : integer;
  maxprov : string [30];
Begin
  maxVis := 0 ;
  maxprov := '';
  carga(ciudadTuristica,maxVis,maxprov);
  writeln ('La provicia ', maxprov, ' fue la que tuvo mas visitantes y fueron ' , maxVis);  
End.
