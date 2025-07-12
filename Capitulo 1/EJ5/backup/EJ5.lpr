program EJ5;

uses unit1;

Var
  Largo, Ancho, Superficie,PorcentajeSuperficie,Baldosas: real;


Const
  LargoTotal=10;
  AnchoTotal=30;
  Baldosa=0.25;
  SuperficieTotal=(LargoTotal*AnchoTotal);
  SuperficieBaldosa=(Baldosa*Baldosa);

begin
  WriteLn('Ingrese metros de largo');
  ReadLn(Largo);
  WriteLn('Ingrese metros de Ancho');
  ReadLn(Ancho);
  Superficie:= (Largo*Ancho);
  PorcentajeSuperficie:= ((Superficie*100)/SuperficieTotal);
  Baldosas:=(Superficie/SuperficieBaldosa);
  WriteLn('La superficie ingresada representa el ',PorcentajeSuperficie:3:2,'% de la superficie total, son necesarias ', baldosas:3:2,' baldosas');
  ReadLn();
end.

