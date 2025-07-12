program EJ3;
type
  TV = array[1..30] of integer;

Var
  VectorV:TV;
  K,Cant,i,N:integer;


Procedure Cambio(VectorV:TV;Cant,K:integer);
begin
  For i:=1 to Cant do
  begin
    If VectorV[i]=K then
    begin
      VectorV[i]:=0;
    end;
  end;

  For i:=1 to Cant do
  begin
    WriteLn(' ',VectorV[i]);
  end;
end;


begin

  WriteLn('Ingrese cantidad de elementos');
  ReadLn(Cant);

  For i:=1 to Cant do
  begin
    WriteLn('Ingrese elemento numero ',i);
    ReadLn(N);
    VectorV[i]:=N;
  end;

  WriteLn('Ingrese un K a remplazar');
  ReadLn(K);

  Cambio(VectorV,Cant,K);

end.

