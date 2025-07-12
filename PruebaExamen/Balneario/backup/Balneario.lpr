program Balneario;
Type
  TVW = array[1..1000] of word;
  TVS = array[1..1000] of string;

Var
  VCarpa:TVW;
  VDias:TVW;
  VTipoCliente:TVS;
  PrecioDia,i,Cant:integer;
  Carpa,Dias:Word;
  TipoCliente:string;
  Arch:Text;

Procedure Analizar(VCarpa,VDias:TVW;VTipoCliente:TVS;PecioDia,Cant:integer);
begin
end;


begin
  i:=1;
  Cant:=0;
  Assign(Arch,'Alquileres.txt');
  Reset(Arch);
  ReadLn(Arch,PrecioDia);

  While not eof(Arch) do
  begin
    ReadLn(Arch, Carpa, Dias, TipoCliente);
    VCarpa[i]:=Carpa;
    VDias[i]:=Dias;
    VTipoCliente[i]:=TipoCliente;
    i:=i+1;
    Cant:=Cant+1;
  end;


  ReadLn();
end.

