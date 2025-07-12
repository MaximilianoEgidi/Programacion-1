program EJ1;

Type
  TEmpleado = record
    Nombre: string[10];
    Dia, Mes, Anio: byte;
  end;

  TEmpleados = array[1..100] of TEmpleado;

Var
  Empleados: TEmpleados;
  Cant: byte;

Procedure CargarElementos(Var ListaEmpleados: TEmpleados; Var Cant: byte);
Var
  i: byte;
  Arch: text;
  Nombre: string[10];
  Dia, Mes, Anio: byte;
begin
  i := 0;
  Assign(Arch, 'Datos.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    ReadLn(Arch, Nombre);
    ReadLn(Arch, Dia, Mes, Anio);

    i := i + 1;
    ListaEmpleados[i].Nombre := Nombre;
    ListaEmpleados[i].Dia := Dia;
    ListaEmpleados[i].Mes := Mes;
    ListaEmpleados[i].Anio := Anio;
  end;

  Cant := i;
  Close(Arch);
end;

Function Analisis (ListaEmpleados:TEmpleados;Cant:byte):String;
Var
  i,Mes,Dia,Verano,Primavera,Invierno,Otonio:byte;
begin
  Invierno:=0;
  Verano:=0;
  Primavera:=0;
  Otonio:=0;
  For i:=1 to Cant do
  begin
    Mes:=ListaEmpleados[i].Mes;
    Dia:=ListaEmpleados[i].Dia;
    Case Mes of
    1, 2: Verano:=Verano+1;
    3: if dia < 21 then
          Verano := Verano+1
       else
          Otonio := Otonio+1;
    4, 5: Otonio := Otonio+1;
    6: if dia < 21 then
          Otonio := Otonio+1
       else
          Invierno := Invierno+1;
    7, 8: Invierno := Invierno+1;
    9: if dia < 21 then
          Invierno := Invierno+1
       else
          Primavera := Primavera+1;
    10, 11: Primavera := Primavera+1;
    12: if dia < 21 then
          Primavera := Primavera+1;
       else
          Verano := Verano+1;
    end;

  end;
  Analisis:='Verano';
  If Otonio > Verano then
      Analisis := 'Otonio';
  If Invierno > Verano then
      Analisis := 'Invierno';
  If Primavera > Verano then
      Analisis := 'Primavera';
end;

begin
  CargarElementos(Empleados, Cant);
  WriteLn('La estacion con mas cumpleanios es: ',Analisis(ListaEmpleados,Cant));
  ReadLn();
end.
