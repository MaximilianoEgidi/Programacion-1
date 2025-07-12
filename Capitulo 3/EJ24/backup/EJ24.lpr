program EJ24;

Var
  ArchO,ArchD:text;
  Car1,Car2:Char;
  c:char;
begin
  Assign(ArchO,'Origen.txt'); Reset(ArchO);
  Assign(ArchD,'Destino.txt'); ReWrite(ArchD);

  Read(ArchO,Car1);
  While Car1 <>'.' do
  begin
    Read(ArchO,Car2);
    if (Car1 in ['0'..'9']) and (Car2 in ['a'..'z']) then
    begin
      for c:='1' to Car1 do
          Write(ArchD,Car2);
      read(ArchO,Car2);
    end
    else
        Write(ArchD,Car1);
    Car1:=Car2;
  end;
  Close(ArchO);Close(ArchD);
  Reset(ArchD);
  While not eof(ArchD) do
  Begin
    Read(ArchD,Car1);Write(Car1);
  end;
  Close(ArchD);
end.

