program EJ14;

var
  Arch: text;
  Cur: char;
  Psi: string;
  i: integer;
  Todos: string;
  Max: integer;

procedure Evaluat(Todos: string; mark: integer);
begin
  // Procedimiento para evaluar los resultados
end;

begin
  // Inicialización del archivo
  Assign(Arch, 'texto.txt');
  Reset(Arch);

  // Inicialización de variables
  Max := 0;
  Todos := '';

  // Leer primer carácter
  Read(Arch, Cur);

  // Procesar el archivo
  while not Eof(Arch) do
  begin
    // Saltar espacios en blanco
    while (Cur = ' ') and not Eof(Arch) do
      Read(Arch, Cur);

    // Inicializar para nueva palabra
    Psi := '';
    i := 0;

    // Construir palabra mientras no sea espacio o punto
    while (Cur <> ' ') and (Cur <> '.') and not Eof(Arch) do
    begin
      i := i + 1;
      Psi := Psi + Cur;
      Read(Arch, Cur);
    end;

    // Evaluar si es la palabra más larga
    if i > Max then
    begin
      Todos := Psi;
      Max := i;
    end
    else if i = Max then
    begin
      // Si tiene la misma longitud, agregar a la lista
      Todos := Todos + ', ' + Psi;
    end;
  end;

  // Cerrar archivo
  Close(Arch);

  // Mostrar resultados
  Evaluat(Todos, Max);
  Writeln('Las palabras más largas son: ', Todos);
  Writeln('Longitud: ', Max, ' caracteres');
end.
