program HomeBanking;

type
  TVW = Array[1..100] of word;
  TVS = Array[1..100] of string;

Var
  VNombre:TVS;
  VDireccion,VLatencia:TVW;
  Cant:word;
  NombreBuscar:String[8];

Procedure LeerArchivo(Var VNombre:TVS;Var VDireccion,VLatencia:TVW;Var Cant:word);
Var
  i,Direccion,Latencia:word;
  Arch:text;
  Nombre:String[8];
begin
  i:=0;
  Assign(Arch,'Bank.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    ReadLn(Arch,Nombre,Direccion,Latencia);
    i:=i+1;
    VNombre[i]:=Nombre;
    VDireccion[i]:=Direccion;
    VLatencia[i]:=Latencia;

  end;
  Close(Arch);
  Cant:=i;
end;

Function TiempoAcceso(NombreBuscar:String;VNombre:TVS;VLatencia:TVW;Cant:word):Word;
Var
  i:word;
begin
  For i:=1 to Cant do
  begin
    If NombreBuscar=VNombre[i] then
    begin
      TiempoAcceso:=VLatencia[i];
    end;
  end;
end;

Function PromedioInternacional(VDireccion,VLatencia:TVW;Cant:word):real;
Var
  i,Extranjeros:word;
  Promedio:real;
begin
  Promedio:=0;
  Extranjeros:=0;
  For i:=1 to Cant-2 do
  begin
    If (VDireccion[i]<>192) and (VDireccion[i]<>276) and (VDireccion[i]<>381) then
    begin
      Promedio:=Promedio+VLatencia[i];
      Extranjeros:=Extranjeros+1;
    end;
  end;
  PromedioInternacional:=(Promedio/Extranjeros);
end;

Function UsuarioMasLatencia(VNombre:TVS;VLatencia:TVW;Cant:word):String;
Var
  i,MayorLatencia:word;
  NombreMayorLatencia:String;
begin
  MayorLatencia:=0;
  For i:=1 to Cant do
  begin
    If VLatencia[i] > MayorLatencia then
    begin
      MayorLatencia:=VLatencia[i];
      UsuarioMasLatencia:=VNombre[i];
    end;
  end;
end;

Begin
  LeerArchivo(VNombre,VDireccion,VLatencia,Cant);

  WriteLn('Ingrese un nombre a buscar');
  //ReadLn(NombreBuscar);
  //WriteLn('El tiempo de acceso de ',NombreBuscar,' fue de ',TiempoAcceso(NombreBuscar,VNombre,VLatencia,Cant));
  WriteLn(PromedioInternacional(VDireccion,VLatencia,Cant):4:2);
  WriteLn(UsuarioMasLatencia(VNombre,VLatencia,Cant);
  ReadLn();
end.
