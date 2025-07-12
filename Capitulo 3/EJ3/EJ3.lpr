program EJ3;

Var
  CantNumeros,Numero,i,ContadorSupera,NumeroMaximo:Integer;

begin
  ContadorSupera:=0;
  NumeroMaximo:=-9999;

  WriteLn('Ingrese cantidad de numeros');
  ReadLn(CantNumeros);

  For i:=1 to CantNumeros do
      Begin
        WriteLn('Ingrese numero');
        ReadLn(Numero);

        if Numero>NumeroMaximo then
           Begin
             NumeroMaximo:=Numero;
             ContadorSupera:=ContadorSupera+1;
           end;
      end;
  WriteLn(ContadorSupera,' veces los numeros ingresados superaron al anterior');
  ReadLn();
end.

