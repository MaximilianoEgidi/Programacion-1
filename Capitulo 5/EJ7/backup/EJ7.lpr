program EJ7;
Var
  Numero1, Numero2, SumaNumeros: longint;

Procedure Suma(Numero1, Numero2: longint; var SumaNumeros: longint);
begin
  SumaNumeros := Numero1 + Numero2;
end;

Procedure Mostrar(SumaNumeros: longint);
begin
  WriteLn('La suma es: ', SumaNumeros);
end;

begin
  SumaNumeros := 0;
  WriteLn('Ingrese un numero');
  ReadLn(Numero1);
  WriteLn('Ingrese otro numero');
  ReadLn(Numero2);

  Suma(Numero1, Numero2, SumaNumeros);
  Mostrar(SumaNumeros);
  ReadLn();
end.
