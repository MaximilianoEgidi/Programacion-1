program SuperMercado;
Type
  Registro = record
    Rubro:string[8];
    Margen:word;
  end;

  TVReg = array[1..200] of Registro;

  TMW = array[1..200,1..200] of Word;

Var
  VProductos:TVReg;
  MCajas:TMW;
  N,M:word;
  R:String[8];

Procedure CargarElementos (Var VProductos:TVReg;Var MCajas:TMW;Var N,M:word);
Var
  Arch:text;
  i,Rubro,Importe:word;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);
  ReadLn(Arch,N,M);

  For i:=1 to M do
  begin
    ReadLn(Arch,VProductos[i].Rubro,VProductos[i].Margen);
  end;

  i:=1;

  While not eof(Arch) do
  begin
    Read(Arch,Rubro,Importe);
    If (Rubro<>0) and (Importe<>0) then
    begin
      MCajas[i,Rubro]:=MCajas[i,Rubro]+Importe;
    end
    else
    begin
      ReadLn(Arch);
      i:=i+1;
    end;
  end;

end;

function PromedioVenta(R: string; VProductos: TVReg; MCajas: TMW; i, N, M: word): real;
var
  Indice: word;
  SumaTotal: real;
  Contador: word;

  function SumarVentas(j: word): real;
  begin
    if j > N then
      SumarVentas := 0
    else
      SumarVentas := MCajas[Indice, j] + SumarVentas(j + 1);
  end;

begin

  if i > M then
  begin
    PromedioVenta := 0;
    Exit;
  end;

  if VProductos[i].Rubro = R then
  begin
    Indice := i;
    SumaTotal := SumarVentas(1);
    PromedioVenta := SumaTotal / N;
  end
  else

    PromedioVenta := PromedioVenta(R, VProductos, MCajas, i + 1, N, M);
end;

begin
  CargarElementos(VProductos,MCajas,N,M);
  WriteLn('Ingrese R');
  ReadLn(R);
  WriteLn(PromedioVenta(R,VProductos,MCajas,1,N,M):4:2);
  ReadLn();
end.

