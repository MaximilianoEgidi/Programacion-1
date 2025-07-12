program Estacionamiento;
Type
  TMW = array[1..200,1..200] of word;
  TMR = array[1..200,1..200] of real;

  Niveles = record
    Nivel,Total:word;
    TiempoPromedio:real;
  end;

  TVN = array[1..200] of Niveles;

Var
  MatAutos:TMW;
  MatHoras:TMR;
  VNiveles:TVN;
  N,M,x:word;

Procedure CargarElementos(Var MatAutos:TMW;MatHoras:TMR;Var N,M:word);
Var
  Arch:text;
  i,j:word;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  ReadLn(Arch,N,M);

  For i:=1 to N do
  For j:=1 to M do
  ReadLn(Arch,MatAutos[i,j],MatHoras[i,j]);
end;

Procedure GenerarVNiveles(Var VNiveles:TVN;MatAutos:TMW;MatHoras:TMR;N,M:word);
Var
  TodasOcupadas:boolean;
  i,j,k,TotalAutos:word;
  Promedio:real;
begin
  k:=0;
  TotalAutos:=0;
  Promedio:=0;
  TodasOcupadas:=True;
  For i:=1 to N do
  begin
    For j:=1 to M do
    begin
      If MatAutos[i,j] <> 0 then
      begin
        TotalAutos:=TotalAutos+MatAutos[i,j];
        Promedio:=Promedio+MatHoras[i,j];
      end
      else
      begin
        TodasOcupadas:=False;
      end;
    end;

    If TodasOcupadas then
    begin
      k:=k+1;
      VNiveles[k].Nivel:=i;
      VNiveles[k].Total:=TotalAutos;
      VNiveles[k].TiempoPromedio:=(Promedio/M);
    end;

    TotalAutos:=0;
    Promedio:=0;
    TodasOcupadas:=True;
  end;

  For k:=1 to N do
  begin
  Write(VNiveles[k].Nivel,' ',VNiveles[k].Total,' ',VNiveles[k].TiempoPromedio);
  WriteLN();
  end;

end;

Function CantPlazas(x: word; MatAutos: TMW; i, N, M: word): word;
Var
  j: word;
  FilaContada: boolean;
begin
  // Caso base: si hemos recorrido todas las filas
  if i > N then
  begin
    CantPlazas := 0;
    Exit;
  end;

  FilaContada := False;

  // Recorremos las columnas de la fila actual con un for
  for j := 1 to M do
  begin
    if MatAutos[i, j] > x then
    begin
      FilaContada := True;
      Break; // Salimos del for al encontrar un elemento > x
    end;
  end;

  // Llamada recursiva para la siguiente fila
  if FilaContada then
    CantPlazas := 1 + CantPlazas(x, MatAutos, i + 1, N, M)
  else
    CantPlazas := CantPlazas(x, MatAutos, i + 1, N, M);
end;

begin
  CargarElementos(MatAutos,MatHoras,N,M);
  GenerarVNiveles(VNiveles,MatAutos,MatHoras,N,M);
  WriteLn('Ingrese x');
  ReadLn(x);
  WriteLn(CantPlazas(x,MatAutos,1,1,N,M));
  ReadLn();
end.

