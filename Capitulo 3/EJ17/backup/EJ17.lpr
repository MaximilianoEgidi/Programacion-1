program ventas;
    var
        nombre, prom, nombreMayorOfertas : string;
        precio, precioBase , descuentoTotal : real;
        contCompraOfertas, mayorCompraOfertas, contClientesSoloOfertas, num, i : integer;
        soloOfertas: boolean;


    const
        DESC = 0.1;

begin
    i := 0;
    precioBase := 0;
    descuentoTotal := 0;
    contCompraOfertas := 0;
    mayorCompraOfertas := 0;
    contClientesSoloOfertas := 0;
    soloOfertas := true;


    writeln('Ingrese nombre del cliente:');
    readln(nombre);
    while nombre <> '***' do
    begin

        writeln('Cantidad de articulos comprados:');
        readln(num);
        for i:= 1 to num do
            begin
                writeln('Ingrese precio: ');
                readln(precio);
                writeln('Esta en oferta? (S / N)');
                readln(prom);
                prom := upcase(prom);

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


        writeln(nombre,' monto venta: ',precioBase:0:2,' descuento: ',descuentoTotal:0:2,' Precio final: ',(precioBase - descuentoTotal):0:2);

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

        writeln('Ingrese nombre del siguiente cliente o ***** para terminar:');
        readln(nombre);

    end;


    writeln(nombreMayorOfertas, ' compro la mayor cantidad de articulos en ofertas.');


    writeln(contClientesSoloOfertas ,' clientes compraron solo articulos en oferta.');

    readln();

end.


