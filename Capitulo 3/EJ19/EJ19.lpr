program EJ20;

var
  ArchNum: Text;
  Num, Suma, Cantidad, PrevNeg: Integer;
  Promedio: Real;
  EntreNegativos: Boolean;

begin
  assign(ArchNum, 'Numeros.txt');
  reset(ArchNum);

  PrevNeg := 0;
  EntreNegativos := False;
  Suma := 0;
  Cantidad := 0;

  while not eof(ArchNum) do
  begin
    read(ArchNum, Num);

    if Num < 0 then
    begin

      if EntreNegativos then
      begin

        if Cantidad > 0 then
        begin
          Promedio := Suma / Cantidad;
          write(round(Promedio), ' ');
        end;


        Suma := 0;
        Cantidad := 0;
      end;


      if (PrevNeg < 0) then
        EntreNegativos := (Num - PrevNeg > 1)
      else
        EntreNegativos := True;

      PrevNeg := Num;
    end
    else if EntreNegativos and (Num > 0) then
    begin
      Suma := Suma + Num;
      Cantidad := Cantidad + 1;
    end;
  end;

  close(ArchNum);
  readln;
end.
