program EJ5;

Type
  TVI = array[1..1000] of Integer;

Var
  VEnteros:TVI;
  Cant:byte;

Procedure CargarElementos (Var VEntero:TVI; Var Cant:byte);
Var
  Arch:text;
  i:byte;
begin
  i:=0;
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  While not eof (Arch) do
  begin
    i:=i+1;
    Read(Arch,VEntero[i]);
  end;

  Cant:=i;
  Close(Arch);

  For i:=1 to Cant do
  begin
    Write(VEntero[i],' ');
  end;
end;
{
Function Suma(VEnteros:TVI;Cant:byte):integer;
begin
  If Cant <> 0 then
     Suma:=Suma + Suma(VEnteros,Cant-1);
end;
}

Procedure MostrarElementosInversos (VEnteros:TVI;Cant:byte);
begin
  If Cant <> 0 then
     begin
       Write(VEnteros[Cant],' ');
       MostrarElementosInversos(VEnteros,Cant-1);
     end;
end;

Procedure MostrarElementos (VEnteros:TVI;Cant:byte);
begin
  If Cant <> 0 then
     begin
       MostrarElementosInversos(VEnteros,Cant-1);
       Write(VEnteros[Cant],' ');
     end;
end;

Function Maximo (VEnteros:TVI;Cant:byte):integer;
begin
  If Cant <> 0 then
     If Maximo < Maximo(VEnteros,Cant-1) then
        Maximo:=Maximo(VEnteros,Cant-1);
end;

begin
  CargarElementos (VEnteros,Cant);
  WriteLn();
  //WriteLn(Suma(VEnteros,Cant));
  MostrarElementosInversos(VEnteros,Cant);
  WriteLn();
  MostrarElementos(VEnteros,Cant);
  WriteLn();
  WriteLn(Maximo(VEnteros,Cant));

  ReadLn();
end.

