program EJ1;

var
  Caracter:Char;

Function CheckLetra (Caracter:Char):boolean;
begin
  Caracter:=Upcase(Caracter);
  If (Caracter>'A') and (Caracter<'Z') then
     CheckLetra:=True;
end;


begin
  WriteLn('Ingrese un caracter');
  ReadLn(Caracter);

  If CheckLetra(Caracter) then
       WriteLn('Es una letra')
       else
         WriteLn('No es una letra');

  ReadLn();
end.

