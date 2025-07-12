program EJ13;

Var
  Pesos,Cambio:Real;
  Moneda:String;

Const
  Dolar=120.80;
  Euro=150.10;
  Real=26.50;

begin
  WriteLn('Ingrese la cantidad de pesos');
  ReadLn(Pesos);
  WriteLn('Ingrese la moneda a cambiar (D, E o R)');
  ReadLn(Moneda);

  Moneda := UpCase(Moneda);

  Case Moneda of
  'D':
    Cambio:=Pesos/Dolar;
  'E':
    Cambio:=Pesos/Euro;
  'R':
    Cambio:=Pesos/Real;
  end;

  WriteLn('Puede comprar ',Cambio:5:2,'$');
  ReadLn();
end.

