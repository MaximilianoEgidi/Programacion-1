program EJ10;

Var
  Peliculas,Deportes,Internet,VelocidadInternet,Grabar:string;
  Costo:Real;

Const
  PlanBasico=1350;
  PaquetePeliculas=200;
  PaqueteDeportes=270;
  PlanInternet=800;
  FuncionGrabar=150;

begin
  WriteLn('Quiere agregar el paquete de peliculas? (S o N)');
  ReadLn(Peliculas);
  Peliculas:= UpCase(Peliculas);

  WriteLn('Quiere agregar el paquete de deporte? (S o N)');
  ReadLn(Deportes);
  Deportes:= UpCase(Deportes);

  WriteLn('Quiere agregar la funcion de grabar programas? (S o N)');
  ReadLn(Grabar);
  Deportes:= UpCase(Grabar);

  WriteLn('Quiere agregar internet? (S o N)');
  ReadLn(Internet);
  Internet:= UpCase(Internet);

  Costo:=PlanBasico;

  If (Internet='S') then
     begin
          WriteLn('Que velocidad de internet desea? (6 o 10)');
          ReadLn(VelocidadInternet);
          If (VelocidadInternet)='10' then
             Costo:=Costo+((PlanInternet)+(PlanInternet*0.20))
             else
             Costo:=Costo+PlanInternet;
     end;

   If (Peliculas)='S' then
      Costo:=Costo+PaquetePeliculas;

   If (Deportes)='S' then
      Costo:=Costo+PaqueteDeportes;

   If (Grabar)='S' then
      Costo:=Costo+FuncionGrabar;

   WriteLn('El total a pagar es de: ',Costo,'$');
   ReadLn();

end.

