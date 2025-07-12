program EJ16;

Type
  TV=array[1..30] of integer;

Var
  Vector:TV;
  Cant,i,N:Integer;


Procedure Compactar(Var Vector: TV; Var Cant: Integer);
var
  i, j: Integer;
begin
  i := 1;
  for i:=1 to cant do
  begin
    if Vector[i] = 0 then
    begin
      for j := i to Cant - 1 do
        Vector[j] := Vector[j + 1];
      Cant := Cant - 1;
    end
  end;

  for i := 1 to Cant do
    WriteLn(Vector[i]);
end;


begin
  WriteLn('Ingrese cantidad de elementos');
  ReadLn(Cant);

  For i:=1 to Cant do
  begin
    WriteLn('Ingrese elemento numero ',i);
    ReadLn(N);
    Vector[i]:=N;
  end;
  Compactar(Vector,Cant);
  ReadLn();
end.

