program EJ1;

Var
  CantNumeros,Numero,i,NumeroMaximo,Ocurrencias,NumeroMinimo,IndiceMaximo:Integer;

begin
  NumeroMaximo:=-9999;
  NumeroMinimo:=9999;
  WriteLn('Ingrese la cantidad de numeros a calcular');
  ReadLn(CantNumeros);
  For i:=1 to CantNumeros do
  begin
    WriteLn('Ingrese un numero');
    ReadLn(Numero);

    if Numero>NumeroMaximo then
       begin
            NumeroMaximo:=Numero;
            Ocurrencias:=0;
            IndiceMaximo:=i;
       end;

    if NumeroMaximo=Numero then
       Ocurrencias:=Ocurrencias+1;

    if (Numero<NumeroMinimo) and (Numero mod 2 <> 0) then
       NumeroMinimo:=Numero;

  end;
  WriteLn('El numero maximo es ',NumeroMaximo,' Se encuentra en la posicion ',IndiceMaximo,' y tiene ',Ocurrencias,' ocurrencias');
  WriteLn('El numero minimo es ',NumeroMinimo);
  ReadLn();
end.

