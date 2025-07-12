program EJ7;

Var
  Talle,Sexo:string;
  Cantidad:Integer;
  PrecioInicial,PrecioFinal:real;

Const
  PrecioBaseHombre=1000;
  PrecioBaseMujer=1200;

begin

  WriteLn('Ingrese el sexo (H o M)');
  ReadLn(Sexo);
  WriteLn('Ingrese talle (S, M, L o X');
  ReadLn(Talle);
  WriteLn('Ingrese cantidad');
  ReadLn(Cantidad);

  If (Sexo)='H' then
     begin
          PrecioInicial:=(PrecioBaseHombre*Cantidad);
          If (Talle='S') then
             PrecioFinal:=(PrecioInicial)-(PrecioInicial*0.05)
             else
               PrecioFinal:=PrecioInicial;
      end;

  If (Sexo)='M' then
     begin
          PrecioInicial:=(PrecioBaseMujer*Cantidad);
          If (Talle='X') then
             PrecioFinal:=(PrecioInicial)-(PrecioInicial*0.05)
             else
               PrecioFinal:=PrecioInicial;
      end;

  PrecioFinal:=(PrecioFinal)+(PrecioFinal*0.21);

  If (Cantidad>12) then
     PrecioFinal:=(PrecioFinal)-(PrecioFinal*0.07);


  WriteLn(PrecioFinal:4:2);
  ReadLn();


end.

