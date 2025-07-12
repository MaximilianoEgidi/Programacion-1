program EJ2;
Type
  TMW = array[1..100,1..100] of word;
  TVS = array[1..100] of string[10];

Var
  MatrizNotas:TMW;
  VNombre,VPromocionados:TVS;
  Cant:word;

Procedure CargarElementos(Var MatrizNotas:TMW;Var VNombre:TVS;Var Cant:word);
Var
  i,j,Nota:word;
  Arch:text;
  Nombre:string[10];
begin
  Assign(Arch,'Datos.txt');
  Reset(Arch);
  ReadLn(Arch,Cant);

  For i:=1 to Cant do
  begin
    Read(Arch,Nombre);
    VNombre[i]:=Nombre;

    For j:=1 to Cant do
    begin
      Read(Arch,Nota);
      MatrizNotas[i,j]:=Nota;
    end;
    ReadLn(Arch);
  end;
  Close(Arch);
end;

Procedure AprobaronTodo(MatrizNotas:TMW;VNombre:TVS;Cant:word);
Var
  i,j:word;
  AproboTodo:boolean;
begin
  WriteLn('Los alumnos que aprobaron todos son:');
  For i:=1 to Cant do
  begin
    AproboTodo:=False;

    For j:=1 to Cant do
    begin
      If MatrizNotas[i,j]>=5 then
         AproboTodo:=True
         Else
           AproboTodo:=False;
    end;
    If AproboTodo then
       begin
         WriteLn(VNombre[i],' ');
       end;
  end;
end;

Procedure Situacion (MatrizNotas:TMW;VNombre:TVS;Var VPromocionados:TVS;Cant:word);
Var
  i,j:word;
  Promedio:real;
begin
  WriteLn();
  WriteLn('Condiciones Finales:');
  For i:=1 to Cant do
  begin
    Promedio:=0;
    For j:=1 to Cant do
    begin
      Promedio:=Promedio+MatrizNotas[i,j];
    end;
    Promedio:=Promedio/Cant;
    If Promedio >=7 then
       begin
         WriteLn(VNombre[i],' Promociona');
         VPromocionados[i]:=VNombre[i];
       end
    else
    If (Promedio >=5) and (MatrizNotas[i,Cant]>=5) then
       begin
         WriteLn(VNombre[i],' Habilita');
       end;
  end;
end;



begin
  CargarElementos(MatrizNotas,VNombre,Cant);
  AprobaronTodo(MatrizNotas,VNombre,Cant);
  Situacion(MatrizNotas,VNombre,VPromocionados,Cant);
  ReadLN();
end.

