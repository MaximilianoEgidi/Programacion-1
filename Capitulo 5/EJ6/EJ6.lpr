program EJ6;
Var
  Caracter:char;
  Arch:Text;
  Palabra,Op:String;
  ContPalabra:Integer;


Procedure NumPalabras();
begin
  ContPalabra:=1;
  Reset(Arch);
  While not eof(Arch) do
  begin
    Read(Arch,Caracter);
    If Caracter = ' ' then
    begin
      ContPalabra:=ContPalabra+1;
    end;
  end;
  WriteLn('La frase tiene ',ContPalabra,' palabras');
end;

Function PalabraMasLarga():integer;
var
  LongitudMayor:integer;
begin
  Palabra:='';
  LongitudMayor:=-10000;
  Reset(arch);
  While not eof(Arch) do
  begin
    Read(Arch,Caracter);
    If Caracter <> ' ' then
    begin
      Palabra:=Palabra+Caracter;
    end
    else
    begin
      WriteLn(length(Palabra));
      If (Length(Palabra)>LongitudMayor) then
      begin
           LongitudMayor:=Length(Palabra);
      end;
      Palabra:=' ';
    end;
  end;
  PalabraMasLarga:=LongitudMayor;
end;

Procedure Menu();
begin
  WriteLn('Ingrese una opcion');
  WriteLn('a) El numero de palabras que contiene');
  WriteLn('b) La longitud de la palabra mas larga');
  WriteLn('c) Cual aparece antes en el diccionario');
  WriteLn('d) Frecuencia de cada letra');

  ReadLn(Op);
  Op:=UpCase(Op);

  Case Op of
  'A':NumPalabras();
  'B': WriteLn('La longitud de la palabra mas larga es: ',PalabraMasLarga());
  end;
end;

begin
  Assign(Arch,'Frases.txt');

  Menu();
  ReadLn();
end.

