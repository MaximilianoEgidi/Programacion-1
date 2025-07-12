program EJ2;
Var
  i:integer;

Function f(i:integer):integer;
begin
  If i=0 then
     f:=1
  else if not odd(i) then
          f:=1+f(i-1)
          else
            f:=f(i-1);
end;

begin
  WriteLn('Ingrese i');
  ReadLn(i);
  WriteLn(f(i));
end.

