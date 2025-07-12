program EJ9;

var
  ArchNumeros: Text;
  PrimerNumero,SegundoNumero:Integer;
  OrdenAscendente: boolean;

begin
  Assign(ArchNumeros,'Numeros.txt');
  Reset(ArchNumeros);

  ReadLn(ArchNumeros,PrimerNumero);

  While not Eof(ArchNumeros) do
  begin
  ReadLn(ArchNumeros,SegundoNumero);

  If PrimerNumero<SegundoNumero then
     OrdenAscendente:=True
     else
       OrdenAscendente:=False;
  PrimerNumero:=SegundoNumero;

  {
  begin
    ReadLn(ArchNumeros,SegundoNumero);
    If PrimerNumero<SegundoNumero then
       WriteLn('Estan ordenados de forma ascendente')
    else
        WriteLn('No estan ordenados de forma ascendente');

    PrimerNumero:=SegundoNumero;
  end;
  }
  end;
  If OrdenAscendente = True then
     WriteLn('Estan ordenados de forma ascendente')
  else
      WriteLn('No estan ordenados de forma ascendente');

  ReadLn();
end.

