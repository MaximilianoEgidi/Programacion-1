program EJ9;

Var
  MontoVentas,MontoASuperar,Comision,Sueldo:Real;
  Faltas:Integer;

Const
  SueldoBasico=8000;
  Presentismo=1000;

begin
  WriteLn('Ingrese el monto a superar');
  Read(MontoASuperar);
  WriteLn('Ingrese ventas realizadas');
  ReadLn(MontoVentas);
  WriteLn('Ingrese dias faltados');
  ReadLn(Faltas);

  if (MontoVentas>MontoASuperar) then
     Comision:=(MontoVentas*0.08)
     else
       Comision:=(MontoVentas*0.05);

  if (MontoVentas*0.02)>Presentismo then
     Comision:=Comision+(MontoVentas*0.02)
     else
       Comision:=Comision+1000;

   Sueldo:=SueldoBasico+Comision;

   if faltas>2 then
      Sueldo:=(Sueldo)-(Sueldo*0.07);

   WriteLn('El sueldo del empleado es de ',Sueldo:5:2);
   ReadLn();
end.

