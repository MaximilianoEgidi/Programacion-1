program EJ4;

Type
  TRE = record
    Nombre:string[10];
    CantPartidos:byte;
    Resultados: array [1..200] of char;
  end;

  TVRE = array[1..200] of TRE;

Var
  Equipos:TVRE;
  Cant:byte;

Procedure CargarElementos (Var Equipos:TVRE;Var Cant:byte);
Var
  Arch:text;
  i,k:byte;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  ReadLn(Arch,Cant);

  For i:=1 to Cant do
  begin
    Read(Arch,Equipos[i].Nombre,Equipos[i].CantPartidos);

    For k:=1 to (Equipos[i].CantPartidos)*2 do
    begin
      Read(Arch,Equipos[i].Resultados[k]);
    end;
    ReadLn(Arch);
  end;


  For i:=1 to Cant do
  begin
    Writeln(Equipos[i].Nombre);
    WriteLn(Equipos[i].CantPartidos);
    begin
      For k:=1 to Equipos[i].CantPartidos do
      begin
        Writeln(Equipos[i].Resultados[k]);
      end;
    end;
  end;

end;

begin
  CargarElementos(Equipos,Cant);
  ReadLn();
end.

