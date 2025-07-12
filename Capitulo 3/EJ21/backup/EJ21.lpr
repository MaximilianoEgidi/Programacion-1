program EJ21;

uses unit1, unit2;

Var
  Numero1,Numero2,Maximo,SubConjunto:Integer;
  FinDatos:Boolean;
begin
  Numero1:=-9999;
  Maximo:=-9999;
  SubConjunto:=1;

  Repeat
    WriteLn('Ingrese numero');
    ReadLn(Numero2);

    If Numero2<>0 then
       begin
         If Maximo<Numero2 then
            Maximo:=Numero2;
       end
    else
        begin
          WriteLn('Subconjunto ',SubConjunto,' maximo ',Maximo);
          SubConjunto:=SubConjunto+1;
          Maximo:=0;
        end;

    If (Numero1=0) and (Numero2=0) then
       FinDatos:=True;
    Numero1:=Numero2;
  until FinDatos ;
end.

