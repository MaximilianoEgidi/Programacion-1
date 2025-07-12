program EJ1;
Type
  TMW = array[1..20,1..20] of word;
  TVW = array[1..20] of word;

Var
  MatrizElementos:TMW;
  VMaximo:TVW;
  N,M,X:word;

Procedure CargarMatriz(Var MatrizElemetos:TMW;Var N,M:word);
Var
  i,j:word;
  Arch:text;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  ReadLn(Arch,N,M);

  For i:=1 to N do
  For j:=1 to M do
  begin
    Read(Arch,MatrizElementos[i,j]);
  end;
  Close(Arch);
end;

Procedure MaximoFila(MatrizElementos:TMW;N,M:word;Var VMaximo:TVW);
Var
  i,j,k,CantV,Maximo:word;
begin
  Maximo:=0;
  k:=0;

  For i:=1 to N do
  begin
    For j:=1 to M do
    begin
      If MatrizElementos[i,j] > Maximo then
      begin
        Maximo:=MatrizElementos[i,j];
      end;
    end;

    k:=k+1;
    VMaximo[k]:=Maximo;
    Maximo:=0;

  end;
  CantV:=k;

  Write('Vector maximo de cada fila ');
  For k:=1 to CantV do
  Write(VMaximo[k],' ');

end;

Function Promedio (X,M:word;MatrizElementos:TMW):real;
Var
  i,Prom:word;
begin
  Prom:=0;
  For i:=1 to M do
  begin
    Prom:=Prom + MatrizElementos[i,x];
  end;
  Promedio:=Prom/N;
end;

Begin
  CargarMatriz(MatrizElementos,N,M);
  MaximoFila(MatrizElementos,N,M,VMaximo);
  WriteLn();

  WriteLn('Ingrese una columna');
  ReadLn(X);

  WriteLn(Promedio(X,M,MatrizElementos):4:2);

  ReadLn();
end.

