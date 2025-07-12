program EJ4;
var
  Num,Exponente:Integer;

Function PotenciaEnesima (Num,Exponente:Integer):Integer;
var
  i:Integer;
begin
  PotenciaEnesima:=1;
  For i:=Exponente downto 1 do
  begin
    PotenciaEnesima:=PotenciaEnesima*Num
  end;
end;

begin
  WriteLn('Ingrese un numero');
  Read(Num);
  WriteLn('Ingrese un exponente');
  Read(Exponente);

  WriteLn(Num,' elevado a la ',Exponente,' es ',PotenciaEnesima(Num,Exponente));
  ReadLn();
end.

