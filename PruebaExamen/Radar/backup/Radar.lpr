program Radar;

Type
  TVW = Array[1..20] of word;
  TVS = Array[1..20] of string;
  TVB = Array[1..3] of byte;
  TVR = Array[1..20] of Real;

Var
  VVelocidad:TVW;
  VFactor:TVR;
  VZona,VPatente,VZonaZ:TVS;
  VTipo:TVB;
  VPantenteMaxima:TVS;
  VPatMasPago: TVS;
  Cant,CantZona,NoInfracciones:integer;
  ArchRadar,ArchZonas:Text;

Procedure CargarDatos(Var VTipo:TVB;Var VVelocidad:TVW; Var VZona,VPatente:TVS;Var Cant:integer; Var NoInfracciones:integer);
Var
  i:integer;
  Tipo:Byte;
  Velocidad:Word;
  Patente:String[7];
  Zona:String[3];
  aux:char;

begin
  i:=0;
  Cant:=0;
  NoInfracciones:=0;
  Assign(ArchRadar,'Radar.txt');
  Reset(ArchRadar);

  While not eof(ArchRadar) do
  begin
    ReadLn(ArchRadar,Tipo,Velocidad,aux,Zona,aux,Patente);
    NoInfracciones:=NoInfracciones+1;
    Case Tipo of
    1: If Velocidad>100 then
           begin
             i:=i+1;
             VTipo[i]:=Tipo;
             VVelocidad[i]:=Velocidad;
             VZona[i]:=Zona;
             VPatente[i]:=Patente;
           end;

    2:If Velocidad>110 then
           begin
             i:=i+1;
             VTipo[i]:=Tipo;
             VVelocidad[i]:=Velocidad;
             VZona[i]:=Zona;
             VPatente[i]:=Patente;
           end;

    3:If Velocidad>90 then
           begin
             i:=i+1;
             VTipo[i]:=Tipo;
             VVelocidad[i]:=Velocidad;
             VZona[i]:=Zona;
             VPatente[i]:=Patente;
           end;
    end;
  end;
  Cant:=i;
  NoInfracciones:=NoInfracciones-Cant;
  WriteLn(NoInfracciones,' lecturas no corresponden a infracciones');
  Close(ArchRadar);

end;

Procedure LeerZonas(Var VZonaZ:TVS;Var VFactor:TVR;Var CantZona:integer);
Var
  i:integer;
  Zona:String[3];
  Factor:Real;
begin
  i:=1;
  Assign(ArchZonas,'Zonas.txt');
  Reset(ArchZonas);
  While not eof(ArchZonas) do
  begin
    ReadLn(ArchZonas,Zona,Factor);
    VZonaZ[i]:=Zona;
    VFactor[i]:=Factor;
    i:=i+1;
  end;
  CantZona:=i;

end;


Function BuscarMulta(Zona:String;VZona:TVS;Cant:integer):Integer;
Var
  i,CantMultas:integer;
begin
  CantMultas:=0;
  For i:=1 to cant do
  begin
    If VZona[i] = Zona then
    begin
      CantMultas:=CantMultas+1;
    end;
  end;
  BuscarMulta:=CantMultas;
end;

procedure bbb( VPatente: TVS; VZona,VZonasZ: TVS; Cant,CantZona:integer; VTipo: TVB; VFactor:TVR; VAR VPatMasPago: TVS);
VAR
   i,k: word; ///i para para los vectores radar y k para los vectores zona
   MaxPago: TVR;
   multa:real;
begin
  for k:=1 to CantZona do
      MaxPago[k]:=0;
  for i:=1 to Cant do
     begin
      k:=1;
      While VZona[i]<>VZonasZ[k] do
            k:=k+1;
      case VTipo[i] of
        1: multa:= 1000 * VFactor[k];
        2: multa:= 2000 * VFactor[k];
        3: multa:= 5000 * VFactor[k];
      end;
      if multa> MaxPago[k] then
         begin
              MaxPago[k]:= multa;
              VPatMasPago[k]:= VPatente[i];
         end;
     end;
end;


begin
  CargarDatos(VTipo,VVelocidad,VZona,VPatente,Cant,NoInfracciones);
  LeerZonas(VZonaZ,VFactor,CantZona);
  bbb(VPatente,VZona,VZonaZ,Cant,CantZona,VTipo,VFactor,VPatMasPago);

  {
  WriteLn('Ingrese una zona');
  ReadLn(Zona);

  If BuscarMulta(Zona,VZona,Cant) <> 0 then
  begin
    WriteLn('Para la zona:',Zona,', Cantidad de multas: ',BuscarMulta(Zona,VZona,Cant));
  end
  else
  begin
    WriteLn('No existe la zona ingresada');
  end;
  }
  ReadLn();
end.

