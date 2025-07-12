program EJ6;

Var
  Codigo: String;
  Monto,Saldo: Real;
  Error:Integer;

Const
  SaldoInicial=2500;

begin

  Error:=0;
  Saldo:=SaldoInicial;

  WriteLn('Ingrese codigo de movimiento (D, R o F)');
  ReadLn(Codigo);
  Codigo:=upcase(Codigo);

  While (Codigo='D') or (Codigo='R') do
        Begin
          If Codigo='D' then
             Begin
               WriteLn('Ingrese monto a depositar');
               ReadLn(Monto);
             end;
           If Codigo='R' then
              Begin
                WriteLn('Ingrese monto a retirar');
                ReadLn(Monto);
                If Monto>Saldo then
                   Begin
                     WriteLn('No tiene fondos suficientes');
                     Error:=Error+1;

                   end
                else
                         Saldo:=Saldo-Monto;
              end;

          WriteLn('Ingrese codigo de movimiento (D, R o F)');
          ReadLn(Codigo);
          Codigo:=upcase(Codigo);
        end;
  WriteLn('Saldo de la cuenta: ',Saldo:5:2,'$');
  WriteLn(Error,' veces no pudo retirar dinero por fondos insuficientes');
  ReadLn();

end.

