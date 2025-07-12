program EJ8;

Type
  TV = Array[1..30] of integer;

Var
  VectorV,VectorW:TV;
  CantV,Num,iV:integer;

Procedure Frecuencia(VectorV:TV; var VectorW:TV);
var
  iW,CantW:integer;
  ElementoAnterior,ContElemento:integer;
begin
  ElementoAnterior:=VectorV[1];
  ContElemento:=1;
  iW:=1;
  CantW:=0;
  For iV:=2 to CantV do
  begin
    if VectorV[iV] = ElementoAnterior then
    begin
      ContElemento:=ContElemento+1;
    end
    else
    begin
      VectorW[iW]:=ContElemento;
      iW:=iW+1;
      ContElemento:=1;
      CantW:=CantW+1;
      ElementoAnterior:=VectorV[iV];
    end;
  end;
  VectorW[iW] := ContElemento;
  CantW := CantW + 1;

  For iW:=1 to CantW do
  begin
    Write(VectorW[iW],' ');
  end;
end;

begin
  VectorW:=0;
  WriteLn('Ingrese cantidad de elementos');
  ReadLn(CantV);

  For iV:=1 to CantV do
  begin
    WriteLn('Ingrese elemento numero ',iV);
    ReadLn(Num);
    VectorV[iV]:=Num;
  end;

  Frecuencia(VectorV,VectorW);
  ReadLn();
end.

