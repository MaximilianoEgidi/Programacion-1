program Universidad;

Type
  RegInscriptos = Record
    DNI:String[8];
    Edad:word;
    Codigo:string[2];
  end;

  RegProvincia = Record
    Codigo:string[2];
    Nombre:string[30];
    Distancia:real;
  end;

  TVIns = array[1..2000] of RegInscriptos;
  TVProv = array[1..2000] of RegProvincia;

Var
  Inscriptos:TVIns;
  Provincia:TVProv;
  NI,NP:word;
  x:string[3];

Procedure CargarElementos(Var Inscriptos:TVIns;Var Provincia:TVProv;Var NI,NP:word);
Var
  ArchI,ArchP:text;
begin
  NI:=0;
  NP:=0;
  Assign(ArchI,'Inscriptos.txt');
  Reset(ArchI);
  Assign(ArchP,'Provincias.txt');
  Reset(ArchP);

  While not eof(ArchI) do
  begin
    NI:=NI+1;
    ReadLn(ArchI,Inscriptos[NI].DNI,Inscriptos[NI].Edad,Inscriptos[NI].Codigo);
  end;

  While not eof(ArchP) do
  begin
    NP:=NP+1;
    ReadLn(ArchP,Provincia[NP].Codigo,Provincia[NP].Nombre,Provincia[NP].Distancia);
  end;

  Close(ArchI);
  Close(ArchP);
end;

begin
  CargarElementos(Inscriptos,Provincia,NI,NP);
  WriteLn('Ingrese un codigo de provincia X');
  ReadLn(x);
end.

