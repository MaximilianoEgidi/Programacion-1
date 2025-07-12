program EJ13;

Type
  TV = Array[1..30] of integer;
Var
  VectorCabina,VectorTipo,VectorHora:TV;
  Arch:Text;
  i,Cabina,Tipo,Hora,Cant:Integer;

Procedure VehiculosAtendidos(VectorCabina:TV; Cant:integer);
Var
  Anterior, i, Contador: integer;
begin
  Anterior := VectorCabina[1];
  Contador := 1;

  For i := 2 to Cant do
  begin
    If VectorCabina[i] = Anterior then
    begin
      Contador := Contador + 1;
    end
    else
    begin
      WriteLn('La cabina ', Anterior, ' atendio ', Contador, ' vehiculos');
      Contador := 1;
      Anterior := VectorCabina[i];
    end;
  end;
end;

Function Recaudacion(VectorCabina,VectorTipo,VectorHora:TV;Cant:Integer):Integer;
begin
  //
end;

begin
  i:=1;
  Cant:=0;
  Assign(Arch,'Vehiculos.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    Read(Arch,Cabina,Tipo,Hora);

    VectorCabina[i]:=Cabina;
    VectorTipo[i]:=Tipo;
    VectorHora[i]:=Hora;
    i:=i+1;
    Cant:=Cant+1;
  end;
  VehiculosAtendidos(VectorCabina,Cant);
  ReadLn();
end.

