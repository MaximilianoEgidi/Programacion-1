program EJ4;
Const
  Palabra='lamina';
Var
  Longitud:byte;

Function Invertir(Palabra:string;Longitud:byte):string;
begin
  If Longitud = 0 then
       Invertir:=''
     else
       Invertir:=Palabra[Longitud] + Invertir(Palabra,Longitud-1);
end;

begin
  Longitud:=Length(Palabra);

  WriteLn(Palabra,' ',Invertir(Palabra,Longitud));
  ReadLn();
end.

