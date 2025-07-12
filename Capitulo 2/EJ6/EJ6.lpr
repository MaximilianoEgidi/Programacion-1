program EJ6;

Var
  a,b,c:Char;

begin

  WriteLn('Ingrese la primera letra');
  ReadLn(a);
  WriteLn('Ingrese la segunda letra');
  ReadLn(b);
  WriteLn('Ingrese la tercera letra');
  ReadLn(c);

  //a<b<c y a<c<b
  if (a<b) and (a<c) then
     if (b<c) then
        WriteLn(a,' ',b,' ',c)
        else
          WriteLn(a,' ',c,' ',b);

  //b<a<c y b<c<a
  if (b<a) and (b<c) then
     if (a<c) then
        WriteLn(b,' ',a,' ',c)
        else
          WriteLn(b,' ',c,' ',a);

  //c<a<b y c<b<c
  if (c<b) and (c<a) then
     if (a<b) then
        WriteLn(c,' ',a,' ',b)
        else
          WriteLn(c,' ',b,' ',a);
  ReadLn();
end.

