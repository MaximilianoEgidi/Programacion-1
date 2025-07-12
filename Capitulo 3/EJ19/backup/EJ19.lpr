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
  Suma := 0;       // Inicializado
  Cantidad := 0;   // Inicializado

  while not eof(ArchNum) do
  begin
    read(ArchNum, Num);

    if Num < 0 then
    begin
      // Si estábamos entre negativos y encontramos otro negativo
      if EntreNegativos then
      begin
        // Solo calcular si hay números positivos entre ellos
        if Cantidad > 0 then
        begin
          Promedio := Suma / Cantidad;
          write(round(Promedio), ' ');
        end;

        // Reiniciar para el próximo grupo
        Suma := 0;
        Cantidad := 0;
      end;

      // Verificar si el negativo anterior no es consecutivo
      if (PrevNeg < 0) then
        EntreNegativos := (Num - PrevNeg > 1)  // No consecutivos si hay al menos 1 número entre ellos
      else
        EntreNegativos := True;

      PrevNeg := Num;
    end
    else if EntreNegativos and (Num > 0) then
    begin
      // Acumular positivos distintos de cero
      Suma := Suma + Num;
      Cantidad := Cantidad + 1;
    end;
  end;

  close(ArchNum);
  readln;
end.
