program EJ3;

Var
  CantHoras: single;
  SueldoBruto,SueldoNeto: single;
begin
  WriteLn('Ingrese cantidad de horas trabajadas');
  ReadLn(CantHoras);

  SueldoBruto:=CantHoras*200;

  SueldoNeto:=SueldoBruto - (SueldoBruto*0.16); //0.11 previsional y 0.5 medico

  WriteLn('El sueldo bruto es de ',SueldoBruto:7:3,'$ y el sueldo neto es ',SueldoNeto:7:3,'$');
  ReadLn();

end.

