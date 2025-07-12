program EJ2;

Var
  n:Integer;

function Factorial(n:integer):integer;
var
  i:integer;

begin
  Factorial:=0;
  if n<>0 then
  begin
    for i:=1 to n do
    begin
      Factorial := n * Factorial(n - 1);
    end;
  end
  else
      Factorial:=1;

end;


begin

  WriteLn('Ingrese un numero');
  ReadLn(n);
  WriteLn('El factorial de ',n,' es ',Factorial(n));
  ReadLn();
end.

