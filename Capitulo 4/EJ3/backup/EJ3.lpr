program EJ3;
var
  n:integer;

Function SumaNaturales(n:integer):integer;
Var
  i:integer;
begin
      SumaNaturales:=0;
      For i:=n downto 1 do
      begin
        SumaNaturales:=SumaNaturales+i;
      end;
end;

1begin
  WriteLn('Ingrese un numero');
  ReadLn(n);

  WriteLn('La suma con sus ',n,' numeros anteriores es: ',SumaNaturales(n));
  ReadLn();
end.

