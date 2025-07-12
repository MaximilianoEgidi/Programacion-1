program EJ4;

Type
  TV=array[1..30] of integer;

Var
  VectorOriginal,VectorCompacto:TV;
  Cant,i,CantCompacto,N:Integer;


Procedure Compactar(Var VectorCompacto:TV;VectorOriginal; Cant:Integer);
begin
  CantCompacto:=0;
  For i:=1 to Cant do
  begin
    If VectorOriginal[i] <> 0 then
    begin
      VectorCompacto[i]:=VectorOriginal[i];
      CantCompacto:=CantCompacto+1;
    end;
  end;

  For i:=1 to CantCompacto do
  Begin
    WriteLn(VectorCompacto[i]);
  end;
end;


begin
  WriteLn('Ingrese cantidad de elementos');
  ReadLn(Cant);

  For i:=1 to Cant do
  begin
    WriteLn('Ingrese elemento numero ',i);
    ReadLn(N);
    VectorOriginal[i]:=N;
  end;
  Compactar(VectorOriginal,VectorCompacto,Cant);
  ReadLn();
end.

