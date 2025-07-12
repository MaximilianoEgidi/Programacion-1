program Aeropuertos;

Type
  RegAeropuerto = record
    Codigo:String[3];
    Costo:word;
  end;

  RegVuelo = record
    CodigoOrigen:String[3];
    CodigoDestino:String[3];
    Distancia:word;
  end;

  TVAeropuerto = array[1..2000] of RegAeropuerto;
  TVVuelo = array[1..2000] of RegVuelo;

Var
  Aeropuerto:TVAeropuerto;
  Vuelo:TVVuelo;

begin
end.

