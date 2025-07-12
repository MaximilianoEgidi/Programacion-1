program EJ6;

var
  Numero,PrimerCifra,Centena:Integer;
  Distancia,NumeroString:String;


begin
  WriteLn('Ingrese numero de mas de 3 cifras');
  ReadLn(Numero);

  If Numero >= 1000 Then
     begin
          PrimerCifra:= round(int(Numero/1000));
          WriteLn(PrimerCifra);


          Str(Numero,NumeroString);
          Centena:=NumeroString[Length(NumeroString)-2];
          WriteLn(Centena);
          ReadLn();
     end
  else
      WriteLn('El numero ingresado es incorrecto');
      ReadLn();
end.

