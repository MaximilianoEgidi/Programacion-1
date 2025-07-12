program EJ2;

Var
  CantEmpleados,i,Antiguedad:Integer;
  Sueldo,SueldoMayor,PromedioSueldos,SueldosTotales:Real;
  NombreEmpleado,NombreSueldoMayor:String;

Const
  SueldoBasico=15000;

begin
  SueldoMayor:=-9999;
  SueldosTotales:=0;

  WriteLn('Ingrese la cantidad de empleados');
  ReadLn(CantEmpleados);

  For i:=1 to CantEmpleados do
  Begin
    WriteLn('Ingrese nombre del empleado');
    ReadLn(NombreEmpleado);
    WriteLn('Ingrese antiguedad');
    ReadLn(Antiguedad);

    case Antiguedad of
         0..5: Sueldo:=SueldoBasico+(SueldoBasico*0.05);
         6..10: Sueldo:=SueldoBasico+(SueldoBasico*0.08);
         11..15: Sueldo:=SueldoBasico+(SueldoBasico*0.12);
         else Sueldo:=SueldoBasico+(SueldoBasico*0.20);
    end;

    Sueldo:=Sueldo-(Sueldo*0.11)-500;

    If Sueldo>SueldoMayor then
       Begin
         SueldoMayor:=Sueldo;
         NombreSueldoMayor:=NombreEmpleado
       end;

    WriteLn(NombreEmpleado, ' tiene un sueldo de ',Sueldo:5:2,'$');

    SueldosTotales:=SueldosTotales+Sueldo;
  end;

  PromedioSueldos:=SueldosTotales/CantEmpleados;

  WriteLn('El empleado con el mayor sueldo es ',NombreSueldoMayor);
  WriteLn('El promedio de todos los sueldos es ',PromedioSueldos:5:2,'$');
  ReadLn();
end.

