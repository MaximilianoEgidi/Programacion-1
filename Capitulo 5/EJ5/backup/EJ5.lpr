program EJ5;

Type
  TV=Array[1..30] of integer;

Var
  Arch:Text;
  Num,i,CantDiv,Max:integer;
  VectorNumeros,VectorDivisores:TV;
{
Procedure DivMax (Max:integer);
begin
  For i:=1 to 9 do
  begin
       if (Max mod i = 0) then
  begin
       WriteLn(i,' es divisor de ',max);
  end;
  end;
end;
}

Procedure DivMax (Max:Integer;Var VectorDivisores:TV);
var
  j:integer;
begin
  j:=1;

  For i:=1 to 9 do
  begin
    if Max mod i=0 then
    begin
      VectorDivisores[j]:=i;
      j:=j+1;
      CantDiv:=CantDiv+1;
    end;
  end;

  For j:=1 to CantDiv do
  begin
    WriteLn(VectorDivisores[j]);
  end;
end;

Function Promedio(VectorDivisores:TV;CantDiv:integer):Real;
var
  Suma,j:integer;
begin
  For j:=1 to CantDiv do
  begin
    Suma:=Suma+VectorDivisores[j];
  end;
  Promedio:=Suma/CantDiv;
end;

begin
  Max:=-10000;
  i:=0;
  Assign(Arch,'Numeros.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    i:=i+1;
    Read(Arch,Num);
    VectorNumeros[i]:=Num;

    If VectorNumeros[i] > Max then
    begin
      Max:=VectorNumeros[i];
    end;
  end;

  DivMax(Max,VectorDivisores);
  WriteLn('El promedio de los divisores es: ',Promedio(VectorDivisores,CantDiv):4:2);
  ReadLn();
end.

