program EJ7;

Type
  TVI = array[1..1000,1..1000] of integer;
Var
  VInteger:TVI;
  N:byte;

Procedure CargarElementos (Var VInteger:TVI; Var N:byte);
Var
  Arch:text;
  i,j:byte;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);
  ReadLn(Arch,N);

  For i:=1 to N do
  begin
    For j:=1 to N do
    begin
      Read(Arch,VInteger[i,j]);
    end;
  end;
end;

function Minimo(VInteger: TVI; N, Fila: byte): byte;
var
  Menor, j: byte;
begin
  Menor := 255;

  for j := 1 to N do
  begin
    if VInteger[Fila, j] < Menor then
      Menor := VInteger[Fila, j];
  end;

  if Fila < N then
  begin
    j := Minimo(VInteger, N, Fila + 1);
    if j < Menor then
      Menor := j;
  end;
  Minimo := Menor;
end;

begin
  CargarElementos(VInteger,N);
  WriteLn(Minimo(VInteger,N,1));
  ReadLn();
end.

