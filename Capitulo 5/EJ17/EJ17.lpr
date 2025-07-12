program EJ17;
Type
  TVW = Array[1..100] of Word;
  TVS = Array[1..100] of String[30];
Var
  Arch:Text;
  VNumero:TVW;
  VNombre:TVS;
  Cant:Word;

Procedure CargarVectores (Var VNumero:TVW; Var VNombre:TVS; Var Cant:Word);
Var
  i:word;
  Nombre:string[30];
  Numero:word;
  Arch:text;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  i:=1;

  While not eof(Arch) do
  begin
    ReadLn(Arch,Numero,Nombre);
    If (Nombre[2]>='A') and (Nombre[2]<='F') then
    begin
      VNumero[i]:=Numero;
      VNombre[i]:=Nombre;
      i:=i+1;
    end;
  end;
  Cant:=i;
end;

Procedure MostrarOriginal (VNumero:TVW;VNombre:TVS;Cant:Word);
Var
  i:word;
begin
  WriteLn('DESORDENADO');
  WriteLn();
  For i:=1 to Cant do
  begin
    WriteLn(VNumero[i],VNombre[i]);
  end;
end;

Procedure Ordenar(Var VNumero: TVW; Var VNombre: TVS; Cant: Word);
Var
  i, j: word;
  AuxNumero: word;
  AuxNombre: String[30];
begin
  for i := 1 to Cant do
  begin
    for j := i+1 to Cant do
    begin
      if VNombre[i] > VNombre[j] then
      begin
        AuxNombre := VNombre[i];
        VNombre[i] := VNombre[j];
        VNombre[j] := AuxNombre;

        AuxNumero := VNumero[i];
        VNumero[i] := VNumero[j];
        VNumero[j] := AuxNumero;
      end;
    end;
  end;
end;

Procedure MostrarOrdenado (VNumero:TVW;VNombre:TVS;Cant:Word);
Var
  i:word;
begin
  WriteLn('ORDENADO');
  WriteLn();
  For i:=1 to Cant do
  begin
    WriteLn(VNumero[i],VNombre[i]);
  end;
end;

begin
  CargarVectores(VNumero,VNombre,Cant);
  MostrarOriginal(VNumero,VNombre,Cant);
  Ordenar(VNumero,VNombre,Cant);
  MostrarOrdenado(VNumero,VNombre,Cant);
  ReadLn();
end.

