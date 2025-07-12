program EJ11;

Type
  TVN = Array[1..30] of string;
  TVL = Array[1..30] of integer;
Var
  VNombre:TVN;
  VLanzamiento1,VLanzamiento2:TVL;
  Arch:Text;
  Cant:integer;

Procedure CargarVectores(Var VNombre:TVN;var VLanzamiento1:TVL;var VLanzamiento2:TVL;Var Cant:integer);
Var
  i,Lanzamiento1,Lanzamiento2:integer;
  Nombre:String;
begin
  i:=1;
  Cant:=0;
  reset(Arch);
  While not eof(Arch) do
  begin
    Read(Arch,Lanzamiento1);
    Read(Arch,Lanzamiento2);
    Read(Arch,Nombre);
    VNombre[i]:=Nombre;
    VLanzamiento1[i]:=Lanzamiento1;
    VLanzamiento2[i]:=Lanzamiento2;
    i:=i+1;
    Cant:=Cant+1;
  end;
end;

Function LanzamientoSupera(VLanzamiento1,VLanzamiento2:TVL;Cant:integer):integer;
var
  i,Superaron:integer;
begin
  Superaron:=0;
  For i:=1 to Cant do
  begin
    If VLanzamiento2[i]>VLanzamiento1[i] then
    begin
      Superaron:=Superaron+1;
    end;
  end;
  LanzamientoSupera:=Superaron;
end;

Function MejorMarca(VNombre:TVN;VLanzamiento1,VLanzamiento2:TVL;Cant:integer):string;
Var
  MayorMarca,i:integer;
begin
  MayorMarca:=-20000;

  For i:=1 to Cant do
  begin
    If VLanzamiento1[i]>MayorMarca then
    begin
      MayorMarca:=VLanzamiento1[i];
      MejorMarca:=VNombre[i];
    end;

    If VLanzamiento2[i]>MayorMarca then
    begin
      MayorMarca:=VLanzamiento2[i];
      MejorMarca:=VNombre[i]
    end;
  end;
end;

Procedure Buscar(VNombre:TVN;VLanzamiento1,VLanzamiento2:TVL;Cant:integer);
var
  i:integer;
  Nombre:String;
begin
  WriteLn('Ingrese nombre a buscar');
  ReadLn(Nombre);
  For i:=1 to Cant do
  begin
    If UpCase(Nombre) = UpCase(VNombre[i]) then
    begin
      WriteLn(VNombre[i],' primer lanzamiento: ',VLanzamiento1[i],' segundo lanzamiento: ',VLanzamiento2[i]);
    end;
  end;
end;

Procedure SemiFinal(VNombre:TVN;VLanzamiento1,VLanzamiento2:TVL;Cant:integer;Var VSemiFinal:TVN);
Var
  Marca,CantSemiFinal,i,j:Integer;
begin
  CantSemiFinal:=0;
  j:=1;
  WriteLn('Ingrese la marca de los que pasan a semifinal');
  ReadLn(Marca);
  For i:=1 to Cant do
  begin
    If (VLanzamiento1[i]>Marca) or (VLanzamiento2[i]>Marca) then
    begin
      VSemiFinal[j]:=VNombre[i];
      j:=j+1;
      CantSemiFinal:=CantSemiFinal+1;
    end;
  end;

  For j:=1 to CantSemiFinal do
  begin
    Write(VSemiFinal[j]);
  end;
end;

begin
  Assign(Arch,'Competidores.txt');
  CargarVectores(VNombre,VLanzamiento1,VLanzamiento2,Cant);
  WriteLn(LanzamientoSupera(VLanzamiento1,VLanzamiento2,Cant),' competidores superaron su primer lanzamiento con el segundo');
  WriteLn('El atleta que registro la mayor marca es:',MejorMarca(Vnombre,VLanzamiento1,VLanzamiento2,Cant));
  //Buscar(VNombre,VLanzamiento1,VLanzamiento2,Cant);
  SemiFinal(VNombre,VLanzamiento1,VLanzamiento2,Cant,VSemiFinal);
  ReadLn();
end.

