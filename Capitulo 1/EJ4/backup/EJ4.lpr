program EJ4;
 Const
   LimInf = 10;
   LimSup = 255;


 Var
    X,Y: real;
    N,M: integer;
    Cadena: string;
    Car: char;
    Mayus, Cumple, Ok: boolean;
begin
{
(A) Correcta
(B) Error semantico
(C) Error semantico
(D) Error semantico
(E) Error sintatico (Tipo de dato incorrecto)
(F) Error sintatico (?)
}

{
  Mayus := upcase(car)=car;
  WriteLn(Mayus);


  Cumple := (X<=LimInf) and (X>=LimSup);
  WriteLn(Cumple);

  Mayus:= 'A'=car or car='B' or TRUE;



    Cumple := length(cadena)>LimSup;
    WriteLn(Cumple);
    ReadLn();


   M := N / LimInf;
   WriteLn(M);
   ReadLn();


   Ok := LimInf< M and M <LimSup;
   WriteLn(Ok);
   ReadLn();

  }
  Ok := Odd (n * (n-1));
  WriteLn(Ok);
  ReadLn();
 end.
