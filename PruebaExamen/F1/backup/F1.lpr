program F1;

Type
  TVS = Array[1..20] of string;
  TVW = Array[1..20] of Word;
  TVR = Array[1..20] of Real;

Var
  VNombre:TVS;
  VEscuderia,VVueltas:TVW;
  VTiempoPromedio:TVR;
  TamArchivo:Word;
  E:word;
  T:Real;

Procedure LeerArchivo(Var VNombre: TVS; Var VEscuderia: TVW; Var VTiempoPromedio: TVR;Var VVueltas:TVW; Var TamArchivo: Word);
Var
  Nombre: String[16];
  i,iDuplicado, Escuderia, Tiempo: Word;
  Arch: Text;
  Duplicado: Boolean;
begin
  Assign(Arch, 'Datos.txt');
  Reset(Arch);
  TamArchivo := 0;

  While not eof(Arch) do
  begin
    ReadLn(Arch, Nombre, Escuderia, Tiempo);

    Duplicado := False;
    for i := 1 to TamArchivo do
    begin
      if VNombre[i] = Nombre then
      begin
        Duplicado := True;
        iDuplicado:=i
      end;
    end;

    if Duplicado=False then
    begin
      TamArchivo := TamArchivo + 1;
      VNombre[TamArchivo] := Nombre;
      VEscuderia[TamArchivo] := Escuderia;
      VTiempoPromedio[TamArchivo] := Tiempo;
      VVueltas[TamArchivo] := 1;
    end
    Else
    begin
      VTiempoPromedio[iDuplicado]:=((VTiempoPromedio[iDuplicado]+Tiempo)/2);
      VVueltas[iDuplicado]:=VVueltas[iDuplicado]+1;
    end;
  end;

  Close(Arch);

  For i:=1 to TamArchivo do
  begin
    WriteLn(VNombre[i],' ',VEscuderia[i],' ',VTiempoPromedio[i]:2:2,' ',VVueltas[i]);
  end;
end;

{Procedure MostrarVueltas(VEscuderia,VVueltas:TVW;TamArchivo:Word);
Var
  i,j,VueltasTotales:Word;
begin
  VueltasTotales:=0;
  For i:=1 to TamArchivo do
  begin
    Case VEscuderia[i] of
    1:
      begin
        VueltasTotales:=VueltasTotales+VVueltas[i];
        WriteLn('Ferrari',':',VueltasTotales);
      end;
    2:
      begin
        VueltasTotales:=VueltasTotales+VVueltas[i];
      end;
    3:
      begin
        VueltasTotales:=VueltasTotales+VVueltas[i];
      end;
    4:
      begin
        VueltasTotales:=VueltasTotales+VVueltas[i];
      end;
    end;
    VueltasTotales:=0;
  end;

end;
}

Function Ganador(VNombre:TVS;VTiempoPromedio:TVR;VVueltas:TVW;TamArchivo:word):String;
Var
  i,iGanador,iEmpate:Word;
  MenorPromedio:Real;
  BoolEmpate,BoolGanador:Boolean;
begin
  MenorPromedio:=1000;
  BoolGanador:=False;
  BoolEmpate:=False;

  For i:=1 to TamArchivo do
  begin
    If (VTiempoPromedio[i]<MenorPromedio) and BoolGanador then
    begin
      BoolEmpate:=True;
      iEmpate:=i;
    end;

    If VTiempoPromedio[i]<MenorPromedio then
    begin
      MenorPromedio:=VTiempoPromedio[i];
      iGanador:=i;
      BoolGanador:=True;
      Ganador:=VNombre[i];
    end;

    If BoolEmpate then
    begin
      If VVueltas[iGanador]>VVueltas[iEmpate] then
      begin
        Ganador:=VNombre[iGanador];
      end
      else
      begin
        Ganador:=VNombre[iEmpate];
      end;
    end;
  end;
end;

Function PromedioMenor(E:Word;T:Real;VEscuderia:TVW;VTiempoPromedio:TVR;TamArchivo:word):Boolean;
Var
  i:word;
begin
  PromedioMenor:=True;
  For i:=1 to TamArchivo do
    If (VEscuderia[i] = E) and (T < VTiempoPromedio[i]) then
        PromedioMenor:=False;
end;

begin
  LeerArchivo(VNombre,VEscuderia,VTiempoPromedio,VVueltas,TamArchivo);
  //MostrarVueltas(VEscuderia,VVueltas,TamArchivo);
  WriteLn(Ganador(VNombre,VTiempoPromedio,VVueltas,TamArchivo));
  WriteLn('Ingrese E');
  ReadLn(E);
  WriteLn('Ingrese T');
  ReadLn(T);
  WriteLn(PromedioMenor(E,T,VEscuderia,VTiempoPromedio,TamArchivo));
  ReadLn();
end.

