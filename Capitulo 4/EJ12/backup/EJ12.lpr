program EJ12;

Function Fibonacci(Cota:Integer):Integer;
Var
  i,NumeroAnterior:Integer;
Begin
  For i:=1 to Cota do
  Begin
    Write(i+NumeroAnterior),' ');
    NumeroAnterior:=i;

  end;
end;

Var
  Cota:Integer;
begin
  Repeat
  WriteLn('Ingrese una cota (0 para finalizar)');
  ReadLn(Cota);
  If cota<> 0 then
  begin
    Fibonacci(Cota);
  end;
  until cota=0 ;
end.

