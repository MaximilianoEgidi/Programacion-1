program EJ1;
Type
  Vector = Array[1..30] of integer;
Var
  Cant,N,i:Integer;
  VectorElementos:Vector;
  //Op:Char;


Function Suma(VectorElementos:Vector;Cant:Integer):Integer;
begin
  Suma:=0;
  For i:=0 to Cant do
  begin
    Suma:=Suma+VectorElementos[i];
  end;
end;

Procedure ElementosPares(VectorElementos:Vector;Cant:Integer);
begin
  WriteLn('Los elementos pares del vector son: ');
  For i:=0 to Cant do
  begin
    If not(Odd(VectorElementos[i])) then
    begin
         Write(VectorElementos[i],' ');
    end;
  end;
end;

Procedure MinyMax (VectorElementos:Vector;Cant:Integer);
Var
  Min,Max:Integer;
begin
  Min:=10000;
  Max:=-10000;

  For i:=1 to Cant do
  begin
    if VectorElementos[i]>=Max then
       Max:=VectorElementos[i];
    if VectorElementos[i]<=Min then
       Min:=VectorElementos[i];
  end;

  WriteLn('Elemento minimo: ',Min,' elemento maximo: ',Max);
end;

Procedure VectorPermutado(VectorElementos:Vector;Cant:Integer);
Var
  VectorPer:Vector;
begin
  For i:=1 to Cant do
  begin
    VectorPer[Cant-i+1]:=VectorElementos[i];
  end;

  Write('Vector Original: ');
  For i:=1 to Cant do
  begin
  Write(VectorElementos[i],' ');
  end;

  Write('Vector Permutado: ');
  For i:=1 to Cant do
  begin
  Write(VectorPer[i],' ');
  end;

end;

Procedure Menu();
Var
  Op:Char;
begin
  repeat
  WriteLn('Ingrese una opcion');
  WriteLn('A) Calcular suma de los elementos');
  WriteLn('B) Mostrar los elementos que se encuentran en posiciones pares');
  WriteLn('C) Calcular el máximo y el mínimo elemento');
  WriteLn('D) Generar un arreglo B con los elementos de A permutado');
  WriteLn('F) Para finalizar');
  ReadLn(Op);
  Op:=UpCase(Op);

  Case Op of
  'A':WriteLn('La suma es ',Suma(VectorElementos,Cant));
  'B':ElementosPares(VectorElementos,Cant);
  'C':MinyMax(VectorElementos,Cant);
  'D':VectorPermutado(VectorElementos,Cant);
  end;

  until Op='F' ;

end;

begin
  WriteLn('Ingrese cantidad de elementos');
  ReadLn(Cant);
  for i:=1 to Cant do
  begin
    WriteLn('Ingrese elemento numero ',i);
    ReadLn(N);
    VectorElementos[i]:=N;
  end;

  Menu();
  ReadLn();
end.

