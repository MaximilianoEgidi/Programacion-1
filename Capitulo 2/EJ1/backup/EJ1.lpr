program EJ1;

Var
  Letra:char;

begin
  WriteLn('Ingrese letra');
  ReadLn(Letra);

  if (Letra>='A') and (Letra<='Z') Then
     WriteLn('Es mayuscula')
     else
       if (Letra>='a') and (Letra<='a') Then
         WriteLn('Es minuscula')
         else
           WriteLn('Es otro');
  ReadLn();
end.

