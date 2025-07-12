program EJ3;

Var
  Temp:Real;
  {
begin
  ReadLn(temp);
  If temp<0 then WriteLn('No salgo de casa...')
  Else If (temp>=0) and (temp<20) then WriteLn('Hace Frio')
  Else If (temp>=20) and (temp<25) and (temp<29) then WriteLn('Barbaro')
  Else if (temp>=29) then WriteLn('Que calor!!');
end.
}

begin

  WriteLn('Ingrese la temperatura');
  ReadLn(Temp);

  If (Temp<0) then
     WriteLn('No salgo de casa...')
     Else
       If (Temp<20) then
          WriteLn('Hace frio')
          Else
            If (Temp<29) then
               WriteLn('Barbaro')
               Else
                 WriteLn('Que calor!!');

end.

