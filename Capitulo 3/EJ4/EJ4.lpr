program EJ4;

Var
  CantNumeros,i,Primero,Segundo,Diferencia,DiferenciaMaxima,Posicion:Integer;

begin
  WriteLn('Ingrese cantidad de numeros');
  ReadLn(CantNumeros);

  WriteLn('Ingrese el numero 1');
  ReadLn(Primero);

  DiferenciaMaxima:=0;
  Posicion:=0;

  For i:=2 to CantNumeros do
      begin
        WriteLn('Ingrese el numero ',i);
        ReadLn(Segundo);
        Diferencia:=Primero-Segundo;

        If Diferencia>DiferenciaMaxima then
           begin
             DiferenciaMaxima:=Diferencia;
             Posicion:=i-1;
           end;

        Primero:=Segundo;
      end;
  WriteLn('La maxima diferencia es de ', DiferenciaMaxima,' y esta en el par ', Posicion);
  ReadLn();

end.

