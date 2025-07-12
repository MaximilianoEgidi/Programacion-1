program EJ5;

Var
  K,Q,i,Multiplos:Integer;

begin
  WriteLn('Ingrese el numero del que desea los multiplos');
  ReadLn(K);
  WriteLn('Ingrese el tope');
  ReadLn(Q);

  For i:=1 to Q do
      begin
           Multiplos:= K*i;
           If Multiplos<Q then
              Write(Multiplos,' ');
      end;
  ReadLn();
end.

