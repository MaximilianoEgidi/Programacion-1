program EJ6;

Type
  TVR = array[1..1000] of real;

Var
  VReales:TVR;
  x:Real;
  N:byte;
Procedure CargarElementos (Var VReales:TVR;Var N:byte);
Var
  Arch:text;
  i:byte;
begin
  N:=0;
  Assign(Arch,'Datos.txt');
  Reset(Arch);

  While not eof (arch) do
  begin
    N:=N+1;
    Read(Arch,VReales[N]);
  end;

  For i:=1 to N do
  Write(VReales[i]:2:2,' ');
end;

function Buscar(VReales: TVR; N: byte; x: real; posActual: byte): real;
begin
  if posActual > N then
    Buscar := -1
  else if VReales[posActual] = x then
    Buscar := x
  else
    Buscar := Buscar(VReales, N, x, posActual + 1);
end;


begin
  CargarElementos(VReales,N);
  WriteLn();
  WriteLn('Ingrese un valor a buscar');
  ReadLn(x);
  WriteLn(Buscar(VReales,N,x,1));
  ReadLn();
end.

