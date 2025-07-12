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

  TVA = array[1..2000] of RegAeropuerto;
  TVV = array[1..2000] of RegVuelo;

Var
  Aeropuerto:TVA;
  Vuelo:TVV;


Procedure CargarElementos (Var Aeropuerto:TVA;Var Vuelo:TVV;Var N:word);
begin
end;

begin
end.

