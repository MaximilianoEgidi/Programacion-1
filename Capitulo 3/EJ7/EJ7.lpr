program EJ7;

Var
  Nombre:String;
  Nota,PromedioAlumno,PromedioTotal:Real;
  CantAlumnos,i:Integer;

begin
  CantAlumnos:=0;
  PromedioAlumno:=0;
  PromedioTotal:=0;
  WriteLn('Ingrese nombre del alumno');
  ReadLn(Nombre);

  While Nombre <> '***' do
        begin
          For i:=1 to 3 do
          begin
            WriteLn('Ingrese nota numero: ',i);
            ReadLn(Nota);
            PromedioAlumno:=PromedioAlumno+Nota;
          end;
          PromedioAlumno:=(PromedioAlumno)/3;
          PromedioTotal:=PromedioTotal+PromedioAlumno;
          CantAlumnos:=CantAlumnos+1;
          WriteLn('El promedio de ',Nombre,' fue de ',PromedioAlumno:2:2);
          PromedioAlumno:=0;
          WriteLn('Ingrese nombre del alumno');
          ReadLn(Nombre);
        end;
  PromedioTotal:=PromedioTotal/CantAlumnos;
  WriteLn('El promedio de todos los alumnos fue de ',PromedioTotal:2:2);
  ReadLn();
end.

