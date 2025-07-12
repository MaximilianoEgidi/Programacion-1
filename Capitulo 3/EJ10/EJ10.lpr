program EJ10;

Var
  ArchNum:Text;
  PrimerNumero,SegundoNumero,Frecuencia:Integer;

begin
  Frecuencia:=1;
  Assign(ArchNum,'Numeros.txt');
  Reset(ArchNum);
  ReadLn(ArchNum,PrimerNumero);

  While not Eof(ArchNum) do
  begin
    ReadLn(ArchNum,SegundoNumero);

    If PrimerNumero=SegundoNumero then
       Frecuencia:=Frecuencia+1
    else
    begin
      WriteLn('Numero: ',PrimerNumero,' Frecuencia: ',Frecuencia);
      Frecuencia:=1;
    end;
    PrimerNumero:=SegundoNumero;
  end;
  close(ArchNum);
  WriteLn('Numero: ',SegundoNumero,' Frecuencia: ',Frecuencia);
  ReadLn();
end.

