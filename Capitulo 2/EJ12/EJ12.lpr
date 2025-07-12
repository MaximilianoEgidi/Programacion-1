program EJ12;

Var
   DiaIngresado,Dia:Integer;
begin
  WriteLn('Ingrese un dia');
  ReadLn(DiaIngresado);

  Dia:=DiaIngresado mod 7;

  Case Dia of
  1:WriteLn('Es Lunes');
  2:WriteLn('Es Martes');
  3:WriteLn('Es Miercoles');
  4:WriteLn('Es Jueves');
  5:WriteLn('Es Viernes');
  6:WriteLn('Es Sabado');
  0:WriteLn('Es Domingo');
  end;

  ReadLn();
end.

