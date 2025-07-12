program EJ22;

Var
  ArchEntrada:text;
  Palabra,PalabraInvertida,PalabraMaxVocales:String;
  Letra:Char;
  Vocales,MaxVocales,ContCapicua:Integer;

begin
  Vocales:=0;
  ContCapicua:=0;
  MaxVocales:=0;
  Palabra:='';
  PalabraInvertida:='';
  Assign(ArchEntrada,'PalabrasEntrada.txt');
  Reset(ArchEntrada);

  While not eof(ArchEntrada) do
  begin
       Read(ArchEntrada,Letra);
       Letra:=upcase(Letra);

       if Letra <> ' ' then
       begin
         Palabra:=Palabra+Letra;
         PalabraInvertida:=Letra+PalabraInvertida;

         if (Letra='A') or (Letra='E') or (Letra='I') or (Letra='O') or (Letra='U') then
            Vocales:=Vocales+1;
       end
       else
           begin
                if Length(PalabraInvertida)>=4 then
                   begin
                     WriteLn(Palabra, ' ',PalabraInvertida);
                   end;

                if Vocales>MaxVocales then
                begin
                  MaxVocales:=Vocales;
                  PalabraMaxVocales:=Palabra;
                end;

                If Palabra=PalabraInvertida then
                   ContCapicua:=ContCapicua+1;

                Palabra:='';
                PalabraInvertida:='';
                Vocales:=0;
           end;
  end;

   WriteLn(PalabraMaxVocales,' es la palabra con mas vocales, con un total de ',MaxVocales,' vocales');
   WriteLn('Hay ',ContCapicua,' palabras palindromas (Capicuas)');
   ReadLn();

end.

