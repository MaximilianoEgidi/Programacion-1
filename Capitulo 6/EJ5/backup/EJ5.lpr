program EJ5;

Type
  TMW = array[1..100,1..4] of word;
  TVW = array[1..100] of word;

Var
  VCliente:TVW;
  MCompras:TMW;
  N:word;


Procedure CargarElementos(Var MCompras:TMW;Var VCliente:TVW;Var N:word);
Var
  i,j,Cliente,Tipo,Monto:word;
  Arch:text;
begin
  i:=0;
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    i:=i+1;
    ReadLn(Arch,Cliente,Tipo,Monto);
    VCliente[i]:=Cliente;
    MCompras[Cliente,Tipo]:=MCompras[Cliente,Tipo]+Monto;
  end;
  N:=i;
end;

Procedure TotalRubro (MCompras:TMW;N:word);
Var
  i,TotalSuper,TotalCombustible,TotalIndumentaria,TotalOtro:word;
begin
  WriteLn('Total de compras en cada rubro:');
  TotalSuper:=0;
  TotalCombustible:=0;
  TotalIndumentaria:=0;
  TotalOtro:=0;

  For i:=1 to N do
  begin
    TotalSuper:=TotalSuper+MCompras[i,1];
    TotalCombustible:=TotalCombustible+MCompras[i,2];
    TotalIndumentaria:=TotalIndumentaria+MCompras[i,3];
    TotalOtro:=TotalOtro+MCompras[i,4];
  end;
  WriteLn('Supermercado: ',TotalSuper);
  WriteLn('Combustible: ',TotalCombustible);
  WriteLn('Indumentaria: ',TotalIndumentaria);
  WriteLn('Otro: ',TotalOtro);
end;

Procedure SupermercadoSuperoIndumentaria (MCompras:TMW;VCliente:TVW;N:word);
Var
  i:word;
begin
  For i:=1 to N do
  begin
    If MCompras[i,1] > MCompras[i,3] then
    begin
      WriteLn(VCliente[i]);
    end;
  end;
end;

begin
  CargarElementos(MCompras,VCliente,N);
  TotalRubro(MCompras,N);
  SupermercadoSuperoIndumentaria(MCompras,VCliente,N);
  ReadLn();
end.

