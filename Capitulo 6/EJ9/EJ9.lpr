program EJ9;
Type
  TMC = array[1..200,1..200] of char;
  TMB = array[1..200,1..200] of byte;

Var
  T1: TMC;
  T2: TMB;
  N:byte;

Procedure CargarElementos (Var T1:TMC;Var T2:TMB;Var N:byte);
Var
  Arch:text;
  i,j,Fichas:byte;
  Car:char;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);
  ReadLn(Arch,N);

  For i:=1 to N do
  begin
    For j:=1 to N do
    begin
      ReadLn(Arch,Car,Fichas);
      T1[i,j]:=Car;
      T2[i,j]:=Fichas;
    end;
  end;
end;

Function ColorPredominante(T1:TMC;N:Byte):Char;
Var
  i,j,Rojas,Azules:byte;
begin
  Rojas:=0;
  Azules:=0;

  For i:=1 to N do
  begin
    For j:=1 to N do
    begin
      If T1[i,j] = 'R' then
      Rojas:=Rojas+1
      else
        Azules:=Azules+1;
    end;
  end;

  If Rojas>Azules then
  begin
    ColorPredominante:='R';
  end
  else
    ColorPredominante:='A';
end;

Function ColorMasFichas(T1:TMC;T2:TMB;N:byte):char;
Var
  i,j,Rojas,Azules:byte;
begin
  Rojas:=0;
  Azules:=0;

  For i:=1 to N do
  begin
    For j:=1 to N do
    begin
      If T1[i,j] = 'R' then
      Rojas:=Rojas+T2[i,j]
      else
        Azules:=Azules+T2[i,j];
    end;
  end;

  If Rojas>Azules then
  begin
    ColorMasFichas:='R';
  end
  else
    ColorMasFichas:='A';
end;

Function ColumnasIguales (T1:TMC;N:byte):byte;
Var
  i,j:byte;
  Anterior:char;
  Iguales:boolean;
begin
  ColumnasIguales:=0;

  For j:=1 to N do
  begin
    Iguales:=True;

    For i:=1 to N-1 do
    begin
      If T1[i,j] <> T1[i+1,j] then
         Iguales:=False;
    end;

    If Iguales then
    ColumnasIguales:=ColumnasIguales+1;
  end;
end;

begin
  CargarElementos(T1,T2,N);
  WriteLn('El color predominante es: ',ColorPredominante(T1,N));
  WriteLn();
  WriteLn('El color con mas fichas es: ',ColorMasFichas(T1,T2,N));
  WriteLn();
  WriteLn('Cantidad de columnas de un solo tipo: ',ColumnasIguales(T1,N));
  ReadLn();
end.

