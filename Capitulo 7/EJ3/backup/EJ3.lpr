program EJ3;

Type
  Puntos = Record
    X,Y:Integer;
    D:Real;
  end;

  TVPuntos = Array[1..200] of Puntos;

Var
  VPuntos: TVPuntos;
  Cant:byte;

Function Distancia (VPuntos:TVPuntos;i:byte):real;
begin
  Distancia:=Sqr(VPuntos[i].X)+Sqr(VPuntos[i].Y);
  Distancia:=Sqrt(Distancia);
end;

Procedure CargarElementos (Var VPuntos:TVPuntos;Var i:byte);
Var
  Arch:text;
  D:real;
  j:byte;
begin
  i:=0;

  Assign(Arch,'Datos.txt');
  Reset(Arch);
  While not eof(Arch) do
  begin
    i:=i+1;
    ReadLn(Arch,VPuntos[i].X,VPuntos[i].Y);
    D:=Distancia(VPuntos,i);
    VPuntos[i].D:=D;;
  end;
  Close(Arch);

  For j:=1 to 5 do
  begin
    WriteLn(VPuntos[j].X,' ',VPuntos[j].Y,' ',VPuntos[j].D:4:2);
  end;
end;

Procedure MasCercano (VPuntos:TVPuntos;Cant:byte);
Var
  i:byte;
  Cercano,Lejano:Real;
  XCercano,YCercano,XLejano,YLejano:integer;
begin
  Cercano:=10000;
  Lejano:=0;
  For i:=1 to Cant do
  begin
    If VPuntos[i].D > Lejano then
    begin
      Lejano:=VPuntos[i].D;
      XLejano:=VPuntos[i].X;
      YLejano:=VPuntos[i].Y;
    end;

    If VPuntos[i].D < Cercano then
    begin
      Cercano:=VPuntos[i].D;
      XCercano:=VPuntos[i].X;
      YCercano:=VPuntos[i].Y;
    end;
  end;

  WriteLn('El punto mas cercano es X: ',XCercano,' Y: ',YCercano);
  WriteLn('El punto mas lejano es X: ',XLejano,' Y: ',YLejano);
end;

Procedure Cuadrante (VPuntos:TVPuntos;Cant:byte);
Var
  i:byte;
  C1,C2,C3,C4:integer;
  Porc1,Porc2,Porc3,Porc4:Real;
begin
  C1:=0;
  C2:=0;
  C3:=0;
  C4:=0;
  For i:=1 to Cant do
  begin
    If (VPuntos[i].x>0) and (VPuntos[i].y>0) then
    C1:=C1+1;
    If (VPuntos[i].x<0) and (VPuntos[i].y>0) then
    C2:=C2+1;
    If (VPuntos[i].x<0) and (VPuntos[i].y<0) then
    C3:=C3+1;
    If (VPuntos[i].x>0) and (VPuntos[i].y<0) then
    C4:=C4+1;
  end;

  Porc1:=(C1*100)/Cant;
  Porc2:=(C2*100)/Cant;
  Porc3:=(C3*100)/Cant;
  Porc4:=(C4*100)/Cant;

  WriteLn('Los porcentajes de cada cuadrante son: Primer Cuadrante:',Porc1:3:2,'% Segundo Cuadrante:',Porc2:3:2,'% Tercer Cuadrante:',Porc3:3:2,'% Cuarto Cuadrante:',Porc4:3:2);
end;

begin
  CargarElementos(VPuntos,Cant);
  MasCercano(VPuntos,Cant);
  Cuadrante(VPuntos,Cant);
  ReadLn();
end.

