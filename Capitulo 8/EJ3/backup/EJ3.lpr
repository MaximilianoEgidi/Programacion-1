program EJ3;

Function Confuso(a,b:integer):integer;
begin
  If (b=0) then
     Confuso:=0
  else
      if b mod 2 = 0 then
         Confuso:=Confuso(a+a,b div 2)
      else
          Confuso:=Confuso(a+a,b div 2) + a;
end;

begin
  WriteLn(Confuso(2,17),' ',Confuso(4,25));
  ReadLn();
end.

