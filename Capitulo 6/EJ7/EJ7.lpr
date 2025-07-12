program EJ7;
Type
  TMB = array[1..50,1..50] of byte;

Var
  MSubieron,MBajaron:TMB;

Procedure CargarElementos(Var MSubieron,MBajaron:TMB; Var N,M:byte);
Var
  Arch:text;
  i,j,Suben,Bajan:byte;
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);
  ReadLn(Arch,N,M);

  While not eof(Arch) do
  begin
    ReadLn(Arch,Suben,Bajan);

  end;
end;

begin
end.

