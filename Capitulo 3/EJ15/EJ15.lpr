program EJ15;

Var
  Caracter,CaracterAnterior,Letra:char;
  ArchPalabras: text;
  ContPrimeraLetra,ContLetra:Integer;
  BoolLetra:boolean;

begin
  CaracterAnterior:=' ';
  ContPrimeraLetra:=0;
  ContLetra:=0;
  BoolLetra:=False;
  Assign(ArchPalabras,'Palabras.txt');
  Reset(ArchPalabras);

  WriteLn('Ingrese una letra');
  ReadLn(Letra);
  Letra:=upcase(Letra);

  While not eof(ArchPalabras) do
  Begin
    Read(ArchPalabras,Caracter);
    Caracter:=upcase(Caracter);

    If Caracter=Letra then
       Begin
         If BoolLetra=False then
            begin
              BoolLetra:=True;
              ContLetra:=ContLetra+1;
            end;

         If CaracterAnterior=' ' then
            begin
              ContPrimeraLetra:=ContPrimeraLetra+1;
            end;
       end;
    If Caracter='.' then
       BoolLetra:=False;


  CaracterAnterior:=Caracter;
  end;


  WriteLn(ContPrimeraLetra,' Palabras comienzan con ',Letra);
  WriteLn(ContLetra,' Palabras contienen la letra ',Letra);
  ReadLn();
end.

