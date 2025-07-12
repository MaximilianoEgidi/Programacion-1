program Lactea;

Type
  TVS=array[1..20] of String;
  TVR=array[1..20] of Real;

Var
  VCod:TVS;
  VTot,VProm:TVR;
  Cant:Word;
  x:Real;
  Codigo:String;

Procedure CargarVectores(Var VCod:TVS; Var VTot, VProm:TVR;Var Cant:Word);
Var
  i:word;
  Cod:String[4];
  Tot,Litros,Dias:word;
  Arch:Text;
begin
  Tot:=0;
  Dias:=0;
  i:=1;

  Assign(Arch,'Datos.txt');
  Reset(Arch);

  while not eof(Arch) do
  begin
    ReadLn(Arch, Cod);
    repeat
      Read(Arch, Litros);
      if Litros <> 0 then
      begin
        Tot:=Tot+Litros;
        Dias:=Dias+1
      end;
    until (Litros = 0);
    VTot[i]:=Tot;
    VProm[i]:=Tot/Dias;
    VCod[i]:=Cod;
    i:=i+1;
    Tot:=0;
    Dias:=0;
    ReadLn(Arch);
  end;
  Cant:=i;
end;

Function TamboMasLeche(VCod:TVS;VTot:TVR;Cant:integer):string;
Var
  i,iMaximo:word;
  Maximo:Real;
begin
  Maximo:=0;
  For i:=1 to Cant do
  begin
    If VTot[i]>Maximo then
    begin
      Maximo:=VTot[i];
      iMaximo:=i;
    end;
  end;
  TamboMasLeche:=VCod[iMaximo];
end;

Function PromedioMasX (X:Real;VProm:TVR;Cant:integer):integer;
var

i,ContadorPromedios:word;
begin
  ContadorPromedios:=0;
  For i:=1 to Cant do
  begin
    if VProm[i]>x then
    begin
      ContadorPromedios:=ContadorPromedios+1;
    end;
  end;
  PromedioMasX:=ContadorPromedios;
end;

Procedure Buscar(Codigo:String;VCod:TVS;VTot,VProm:TVR;Cant:integer);
Var
   i,iCod:word;
begin
  iCod:=0;
  For i:=1 to Cant do
  begin
    If Codigo=VCod[i] then
    begin
      ICod:=I;
    end;
  end;
  If iCod <> 0 then
  begin
    WriteLn('Codigo: ',Codigo,' Total: ',VTot[iCod],' Promedio: ',VProm[iCod]);
  end
  else
  begin
    WriteLn('El codigo ingresado no existe');
  end;
end;

begin
  CargarVectores(VCod,VTot,VProm,Cant);
  WriteLn('El tambo que mas leche entrego fue ',TamboMasLeche(VCod,VTot,Cant));
  //WriteLn('Ingrese x');
  //ReadLn(x);
  //WriteLn(PromedioMasX(X,VProm,Cant),' Superaron los ',x:2:2,' litros');

  WriteLn('Ingrese un codigo');
  ReadLn(Codigo);
  Buscar(Codigo,VCod,Vtot,VProm,Cant);
  ReadLn();
end.

