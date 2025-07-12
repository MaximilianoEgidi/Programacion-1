program EJ10;

Type
  TVI = array[1..200] of integer;

Var
  VectorA,VectorB,VectorC:TVI;
  N,k:word;

Procedure CargarElementos (Var VectorA,VectorB:TVI;Var N:word);
Var
  Arch:text;
begin
  N:=0;
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    N:=N+1;
    ReadLn(Arch,VectorA[N],VectorB[N]);
  end;
end;

Procedure ArmarC(VectorA, VectorB: TVI; Var VectorC: TVI; i, j: word; Var k: word; N: word);
begin
  if (i <= N) and (j <= N) then
  begin
    if VectorA[i] = VectorB[j] then
    begin
      VectorC[k] := VectorA[i];
      k := k + 1;
      ArmarC(VectorA, VectorB, VectorC, i + 1, j + 1, k, N);
    end
    else if VectorA[i] > VectorB[j] then
    begin
      VectorC[k] := VectorB[j];
      k := k + 1;
      ArmarC(VectorA, VectorB, VectorC, i, j + 1, k, N);
    end
    else
    begin
      VectorC[k] := VectorA[i];
      k := k + 1;
      ArmarC(VectorA, VectorB, VectorC, i + 1, j, k, N);
    end;
  end

  else if i <= N then
  begin
    VectorC[k] := VectorA[i];
    k := k + 1;
    ArmarC(VectorA, VectorB, VectorC, i + 1, j, k, N);
  end

  else if j <= N then
  begin
    VectorC[k] := VectorB[j];
    k := k + 1;
    ArmarC(VectorA, VectorB, VectorC, i, j + 1, k, N);
  end;
end;

Procedure MostrarC(VectorC:TVI;N:word);
Var
  i:word;
begin
  For i:=1 to N do
      Write(VectorC[i],' ');
end;

begin
  CargarElementos(VectorA,VectorB,N);
  ArmarC(VectorA,VectorB,VectorC,1,1,k,N);
  MostrarC(VectorC,N);
  ReadLn();
end.

