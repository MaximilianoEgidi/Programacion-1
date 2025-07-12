program EJ1;
Var
  x,n:integer;


Function Potencia(x,n:integer):integer;
begin
  If n = 0 then
    Potencia:=1
    else then
      Potencia:=x*Potencia(x,n-1);
end;

begin
  WriteLn('Ingrese X');
  ReadLn(x);
  WriteLn('Ingrese N');
  ReadLn(n);

  WriteLn(x,' elevado a la ',n,' es: ',Potencia(x,n));
  ReadLn();
end.

