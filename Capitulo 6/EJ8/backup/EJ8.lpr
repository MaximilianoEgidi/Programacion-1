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
  // Validación básica
  if Cant = 0 then Exit;

  // Calcular la matriz de divisibilidad
  for i := 1 to Cant do
  begin
    for j := 1 to Cant do
    begin
      // Versión con if explícito
      if B[j] = 0 then
        R[i,j] := 0  // Manejo de división por cero
      else if A[i] mod B[j] = 0 then
        R[i,j] := 1  // División exacta
      else
        R[i,j] := 0; // No es divisible exactamente
    end;
  end;

  // Mostrar resultados
  WriteLn('Matriz de Divisibilidad (usando if):');
  Write('A\B|');
  for j := 1 to Cant do
    Write(B[j]:5);
  WriteLn;

  WriteLn('----+', StringOfChar('-', Cant*5));

  for i := 1 to Cant do
  begin
    Write(A[i]:3, ' |');
    for j := 1 to Cant do
      Write(R[i,j]:5);
    WriteLn;
  end;
end;

begin
  CargarElementos(A,B,Cant);
  Divisibilidad (A,B,R,Cant);
  ReadLn();
end.

