program EJ16;

Var
  Patente:String;
  Combustible,CombustibleKm,LitrosMinimos,KMMinimos,Kilometros:Real;

begin
  LitrosMinimos:=10000;
  KMMinimos:=10000;

  Repeat
      WriteLn('Ingrese patente');
      ReadLn(Patente);
      WriteLn('Ingrese litros de combustible consumidos');
      ReadLn(Combustible);
      WriteLn('Ingrese kilometros recorridos (0 para finalizar)');
      ReadLn(Kilometros);

      If Kilometros <> 0 then
      begin
        CombustibleKm:=Combustible/Kilometros;
        WriteLn('Consumio ',CombustibleKm:5:2,'L/KM');
        If Kilometros<KMMinimos then
           LitrosMinimos:=Combustible;

      end;

  until Kilometros=0 ;
  WriteLn('El auto que realizo menos kilometros consumio ',LitrosMinimos:5:2.'L');
  ReadLn();
end.

