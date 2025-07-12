program EJ4;

Var
  Dia1,Mes1,Anio1,Dia2,Mes2,Anio2,MesTrimestre: integer;
begin
  //Ingreso fechas
  WriteLn('Ingrese el fecha (D M A) numero uno');
  ReadLn(Dia1,Mes1,Anio1);

  WriteLn('Ingrese el fecha (D M A) numero dos');
  ReadLn(Dia2,Mes2,Anio2);

  //Verificacion fechas

  If (Anio1<Anio2) then
     WriteLn(Dia1,'/',Mes1,'/',Anio1,' es la fecha mas antigua')
     else
       if (Anio1>Anio2) then
          WriteLn(Dia2,'/',Mes2,'/',Anio2,' es la fecha mas antigua')
          else
            if (Mes1<Mes2) then
               begin
                 WriteLn(Dia1,'/',Mes1,'/',Anio1,' es la fecha mas antigua');
                 MesTrimestre:=Mes1;
               end
               else
                 if (mes1>mes2) then
                    begin
                      WriteLn(Dia2,'/',Mes2,'/',Anio2,' es la fecha mas antigua');
                      MesTrimestre:=Mes2;
                    end
                    else
                      if (Dia1<Dia2) then
                         WriteLn(Dia1,'/',Mes1,'/',Anio1,' es la fecha mas antigua')
                         else
                           if (Dia1>Dia2) then
                              WriteLn(Dia2,'/',Mes2,'/',Anio2,' es la fecha mas antigua')
                              else
                                WriteLn('Las fechas ingresadas son iguales');

 //Trimestre

 Case MesTrimestre of
      1..3: WriteLn('1er Trimestre');
      4..6: WriteLn('2do Trimestre');
      7..9: WriteLn('3er Trimestre');
      10..12: WriteLn('4to Trimestre');
 end;
 ReadLn();
end.

