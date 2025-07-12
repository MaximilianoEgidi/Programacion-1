program EJ6;

Function NumAleatorio(A,B:Integer):Integer;
  Var
    Diferencia:Integer;

Begin
  Diferencia:=(B-A);
  NumAleatorio:=(Random(Diferencia));
end;

Var
  A,B:Integer;

begin
  Randomize();

  Repeat
    WriteLn('Ingrese un numero A');
    ReadLn(A);
    WriteLn('Ingrese un numero B');
    ReadLn(B);

    If A>=B then
       WriteLn('B tiene que ser mayor al numero A');
  until A<B ;

  WriteLn('Un numero aleatorio entre ',A,' y ',B,' es ',NumAleatorio(A,B));
  ReadLn();
end.

