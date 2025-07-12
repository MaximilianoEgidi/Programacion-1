program EJ8;

Type
  TMB = array[1..100,1..100] of byte;
  TVB = array[1..100] of byte;
Var
  A:TVB;
  B:TVB;
  R:TMB;
  Cant:byte;

Procedure CargarElementos (Var A,B:TVB;Var Cant:byte);
Var
  Arch:text;
  i,Elemento:byte;
begin
  i:=0;
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    i:=i+1;
    ReadLn(Arch,Elemento);

    A[i]:=Elemento;
    B[i]:=Elemento;
  end;

  Cant:=i;

end;

procedure Divisibilidad(A, B: TVB; var R: TMB; Cant: byte);
var
  i, j: byte;
begin
  for i := 1 to Cant do
  begin
    for j := 1 to Cant do
    begin
      if A[i] mod B[j] = 0 then
        R[i,j] := 1
      else
        R[i,j] := 0;
    end;
  end;


  for i := 1 to Cant do
  begin
    for j := 1 to Cant do
    begin
      Write(R[i,j], ' ');
    end;
    WriteLn();
  end;
end;

begin
  CargarElementos(A,B,Cant);
  Divisibilidad (A,B,R,Cant);
  ReadLn();
end.

