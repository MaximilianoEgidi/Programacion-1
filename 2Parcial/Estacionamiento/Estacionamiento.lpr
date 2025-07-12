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

Function CantPlazas(x:word;MatAutos:TMW;i,j,N,M:word):word;
Var
  Contador:word;
  FilaContada:boolean;
begin

  FilaContada:=False;
  If i<=N then
  begin
    If j<=M then
    begin
      If MatAutos[i,j] > x then
      begin
        If FilaContada = False then
        begin
          Contador:=Contador+1;
          FilaContada:=True;
        end;
      end
      else
        CantPlazas(x,MatAutos,i,j+1,N,M);
    end
    else
    CantPlazas(x,MatAutos,i+1,j,N,M);
  end;
  CantPlazas:=Contador;
end;

begin
  CargarElementos(MatAutos,MatHoras,N,M);
  GenerarVNiveles(VNiveles,MatAutos,MatHoras,N,M);
  WriteLn('Ingrese x');
  ReadLn(x);
  WriteLn(CantPlazas(x,MatAutos,1,1,N,M));
  ReadLn();
end.

