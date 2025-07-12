program EJ18;
    var
        arch : text;
        nombre, prom, nombreMayorOfertas : string;
        precio, precioBase , descuentoTotal : real;
        contCompraOfertas, mayorCompraOfertas, contClientesSoloOfertas : integer;
        leido : string;
        guardarNombre , soloOfertas: boolean;


    const
        DESC = 0.1;

begin
    precioBase := 0;
    descuentoTotal := 0;
    contCompraOfertas := 0;
    mayorCompraOfertas := 0;
    contClientesSoloOfertas := 0;
    soloOfertas := true;
    guardarNombre := true;
    assign(arch, 'datos.txt');
    reset(arch);

    while not eof(arch) do
    begin
        readln(arch, leido);
        if guardarNombre = true then
        begin
            nombre := leido;
            guardarNombre := false;
        end
        else
            if leido = '***' then
                begin

                    writeln(nombre,' monto venta: ',
                    precioBase:0:2,
                    ' descuento: ',
                    descuentoTotal:0:2,
                    ' Precio final: ',
                    (precioBase - descuentoTotal):0:2);


                    if soloOfertas = true then
                        contClientesSoloOfertas := contClientesSoloOfertas + 1;

                    if contCompraOfertas > mayorCompraOfertas then
                        begin
                            nombreMayorOfertas := nombre;
                            mayorCompraOfertas := contCompraOfertas;
                        end;


                    precioBase := 0;
                    descuentoTotal := 0;
                    soloOfertas := true;
                    contCompraOfertas := 0;
                    guardarNombre := true;
                end
        else
            begin
                prom := leido;
                prom := upcase(prom);
                readln(arch, precio);
                precioBase:= precioBase + precio;

                if prom = 'S' then
                    begin
                        contCompraOfertas := contCompraOfertas + 1;
                        descuentoTotal := descuentoTotal + (precio * DESC);
                    end
                else
                    if prom = 'N' then
                        soloOfertas := false;
            end;




    end;

    writeln(nombreMayorOfertas, ' compro la mayor cantidad de articulos en ofertas.');


    writeln(contClientesSoloOfertas ,' clientes compraron solo articulos en oferta.');

    close(arch);
    readln();

end.


