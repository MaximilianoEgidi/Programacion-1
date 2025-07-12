program ParcialUniversidad;

const
    MAX_PROVINCIAS = 24;
    MAX_RANGOS = 10; // Rangos de 10 en 10: 0-9, 10-19, ..., 90-99
    EDAD_MAX = 99;

type
    // Registro para almacenar información de una provincia
    TProvincia = record
        codigo: string[2];
        nombre: string[30];
        distancia: integer;
    end;

    // Registro para el par provincia-rango etario
    TProvinciaRango = record
        provincia: string[30];
        rango: integer;
    end;

    // Vectores y matrices necesarios
    TVectorProvincias = array[1..MAX_PROVINCIAS] of TProvincia;
    TMatrizInscriptos = array[1..MAX_PROVINCIAS, 0..MAX_RANGOS-1] of integer;
    TVectorProvinciaRango = array of TProvinciaRango;

var
    provincias: TVectorProvincias;
    inscriptos: TMatrizInscriptos;
    totalProvincias: integer;
    totalInscriptos: integer;

// Función recursiva para buscar una provincia por su código
function BuscarProvinciaPorCodigo(codigo: string; indice: integer): integer;
begin
    if indice > totalProvincias then
        BuscarProvinciaPorCodigo := -1
    else if provincias[indice].codigo = codigo then
        BuscarProvinciaPorCodigo := indice
    else
        BuscarProvinciaPorCodigo := BuscarProvinciaPorCodigo(codigo, indice + 1);
end;

// Función recursiva para calcular el total de inscriptos
function CalcularTotalInscriptos(fila, columna: integer): integer;
begin
    if fila > totalProvincias then
        CalcularTotalInscriptos := 0
    else if columna > MAX_RANGOS-1 then
        CalcularTotalInscriptos := CalcularTotalInscriptos(fila + 1, 0)
    else
        CalcularTotalInscriptos := inscriptos[fila, columna] + CalcularTotalInscriptos(fila, columna + 1);
end;

// Procedimiento para leer el archivo de provincias
procedure LeerProvincias(var archivo: text);
var
    linea: string;
    i: integer;
begin
    totalProvincias := 0;
    Reset(archivo);
    while not Eof(archivo) and (totalProvincias < MAX_PROVINCIAS) do
    begin
        totalProvincias := totalProvincias + 1;
        Readln(archivo, linea);

        // Extraer código (primeros 2 caracteres)
        provincias[totalProvincias].codigo := Copy(linea, 1, 2);

        // Extraer nombre (siguientes 30 caracteres)
        provincias[totalProvincias].nombre := Copy(linea, 3, 30);

        // Extraer distancia (resto de la línea)
        Val(Copy(linea, 33, Length(linea)-32), provincias[totalProvincias].distancia, i);
    end;
    Close(archivo);
end;

// Procedimiento para leer el archivo de inscriptos
procedure LeerInscriptos(var archivo: text);
var
    linea: string;
    dni: string[8];
    edad, codProv, i, j, indiceProv, rango: integer;
begin
    Reset(archivo);
    totalInscriptos := 0;

    // Inicializar matriz
    for i := 1 to MAX_PROVINCIAS do
        for j := 0 to MAX_RANGOS-1 do
            inscriptos[i, j] := 0;

    while not Eof(archivo) do
    begin
        Readln(archivo, linea);
        totalInscriptos := totalInscriptos + 1;

        // Extraer DNI (primeros 8 caracteres)
        dni := Copy(linea, 1, 8);

        // Extraer edad (siguientes 2 caracteres)
        Val(Copy(linea, 9, 2), edad, i);

        // Extraer código de provincia (siguientes 2 caracteres)
        codProv := Copy(linea, 11, 2);

        // Buscar índice de la provincia
        indiceProv := BuscarProvinciaPorCodigo(codProv, 1);

        if indiceProv <> -1 then
        begin
            // Calcular rango etario
            rango := edad div 10;
            if rango > MAX_RANGOS-1 then rango := MAX_RANGOS-1;

            // Incrementar contador
            inscriptos[indiceProv, rango] := inscriptos[indiceProv, rango] + 1;
        end;
    end;
    Close(archivo);
end;

// Función para el inciso a: Cantidad de rangos etarios sin inscriptos en X
function RangosSinInscriptos(codProv: string): integer;
var
    indiceProv, i, count: integer;
begin
    indiceProv := BuscarProvinciaPorCodigo(codProv, 1);
    if indiceProv = -1 then
    begin
        RangosSinInscriptos := MAX_RANGOS;
        Exit;
    end;

    count := 0;
    for i := 0 to MAX_RANGOS-1 do
        if inscriptos[indiceProv, i] = 0 then
            count := count + 1;

    RangosSinInscriptos := count;
end;

// Función para el inciso b: Provincia con menos inscriptos entre rangos R y T
function ProvinciaMenosInscriptos(R, T: integer): string;
var
    i, j, minInscriptos, suma, indiceMin: integer;
begin
    // Ajustar rangos si están fuera de los límites
    if R < 0 then R := 0;
    if T > MAX_RANGOS-1 then T := MAX_RANGOS-1;

    minInscriptos := MaxInt;
    indiceMin := 1;

    for i := 1 to totalProvincias do
    begin
        suma := 0;
        for j := R to T do
            suma := suma + inscriptos[i, j];

        if suma < minInscriptos then
        begin
            minInscriptos := suma;
            indiceMin := i;
        end;
    end;

    ProvinciaMenosInscriptos := provincias[indiceMin].nombre;
end;

// Procedimiento para el inciso c: Generar arreglo con pares provincia-rango > 10%
procedure GenerarArregloSuperan10Porc(var arreglo: TVectorProvinciaRango; var tam: integer);
var
    i, j, total: integer;
    porcentaje: real;
begin
    total := CalcularTotalInscriptos(1, 0);
    if total = 0 then
    begin
        tam := 0;
        Exit;
    end;

    tam := 0;
    SetLength(arreglo, 1); // Inicializar con tamaño 1

    for i := 1 to totalProvincias do
    begin
        for j := 0 to MAX_RANGOS-1 do
        begin
            porcentaje := (inscriptos[i, j] / total) * 100;
            if porcentaje > 10.0 then
            begin
                if tam > 0 then
                    SetLength(arreglo, tam + 1);

                arreglo[tam].provincia := provincias[i].nombre;
                arreglo[tam].rango := j * 10;
                tam := tam + 1;
            end;
        end;
    end;
end;

// Procedimiento para mostrar el arreglo generado en el inciso c
procedure MostrarArreglo(arreglo: TVectorProvinciaRango; tam: integer);
var
    i: integer;
begin
    if tam = 0 then
    begin
        Writeln('No hay pares provincia-rango que superen el 10% del total.');
        Exit;
    end;

    Writeln('Pares provincia-rango que superan el 10% del total:');
    for i := 0 to tam-1 do
    begin
        Writeln('Provincia: ', arreglo[i].provincia, ' - Rango: ',
                arreglo[i].rango, '-', arreglo[i].rango + 9);
    end;
end;

var
    archProv, archInsc: text;
    codProv: string;
    R, T: integer;
    arreglo: TVectorProvinciaRango;
    tamArreglo: integer;

begin
    // Leer archivos
    Assign(archProv, 'PROVINCIAS.TXT');
    Assign(archInsc, 'INSCRIPTOS.TXT');

    LeerProvincias(archProv);
    LeerInscriptos(archInsc);

    // Inciso a
    Writeln('Inciso a)');
    Write('Ingrese codigo de provincia: ');
    Readln(codProv);
    Writeln('Cantidad de rangos sin inscriptos: ', RangosSinInscriptos(codProv));
    Writeln;

    // Inciso b
    Writeln('Inciso b)');
    Write('Ingrese edad de inicio del rango R: ');
    Readln(R);
    Write('Ingrese edad de inicio del rango T: ');
    Readln(T);
    R := R div 10;
    T := T div 10;
    Writeln('Provincia con menos inscriptos entre los rangos: ',
            ProvinciaMenosInscriptos(R, T));
    Writeln;

    // Inciso c
    Writeln('Inciso c)');
    GenerarArregloSuperan10Porc(arreglo, tamArreglo);
    MostrarArreglo(arreglo, tamArreglo);
end.
