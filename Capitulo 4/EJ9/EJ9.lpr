program EJ9;

Procedure SumaFraccion(N1, D1, N2, D2: integer; var Numerador, Denominador: integer);
begin
  if (N1<>0) and (D1<>0) and (N2<>0) and (D2<>0) then
  begin
    Numerador:=(D1*N2)+(D2*N1);
    Denominador:=D1*D2;
  end;
end;

Procedure MultiplicacionFraccion(N1, D1, N2, D2: integer; var Numerador, Denominador: integer);
begin
  if (N1<>0) and (D1<>0) and (N2<>0) and (D2<>0) then
  begin
    Numerador:=(N1*N2);
    Denominador:=D1*D2;
  end;
end;

Var
  N1,D1,N2,D2,Numerador,Denominador:Integer;
  Arch:Text;

begin
  Numerador:=0;
  Denominador:=0;
  Assign(Arch,'Numeros.txt');
  Reset(Arch);
  While not eof(Arch) do
  begin
    Read(Arch,N1,D1,N2,D2);
    SumaFraccion(N1,D1,N2,D2,Numerador,Denominador);
    if (N1<>0) and (D1<>0) and (N2<>0) and (D2<>0) then
       WriteLn('La suma de (',N1,'/',D1,')+(',N2,'/',d2,') es ',Numerador,'/',Denominador);

    MultiplicacionFraccion(N1,D1,N2,D2,Numerador,Denominador);
    if (N1<>0) and (D1<>0) and (N2<>0) and (D2<>0) then
       WriteLn('La multiplicacion de (',N1,'/',D1,')*(',N2,'/',d2,') es ',Numerador,'/',Denominador);
  end;
  Close(Arch);
 ReadLn();
end.

