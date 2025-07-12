program EJ7;

Function Impuesto(ImporteTotal:Real ;RI:String):Real;
begin
  If RI = 'S' then
  Impuesto:=ImporteTotal*0.21
  else
  Impuesto:=ImporteTotal*0.31;
end;

Var
  Nombre,MenosFacturo,RI:String;
  Meses,i:integer;
  Importe,ImporteTotal,MenosImporte:Real;

begin
  MenosImporte:=9999;
  Repeat
    ImporteTotal:=0;

    WriteLn('Ingrese nombre (*** para finalizar)');
    ReadLn(Nombre);

    If Nombre <> '***' then
    begin
         WriteLn('Es responsable inscripto? (S o N)');
         ReadLn(RI);
         RI:=Upcase(RI);
         WriteLn('Ingrese cantidad de meses');
         ReadLn(Meses);
         For i:=1 to meses do
         begin
           WriteLn('Importe facturado del mes ',i);
           ReadLn(Importe);
           ImporteTotal:=ImporteTotal+Importe;
         end;

         If (ImporteTotal<MenosImporte) and (RI='S') then
         begin
              MenosImporte:=ImporteTotal;
              MenosFacturo:=Nombre;
              WriteLn(MenosFacturo);
         end;

         WriteLn('Durante los ',Meses,' meses ',Nombre,' pago ',Impuesto(ImporteTotal,RI):5:2,'$ de IVA');
    end;
  until Nombre='***' ;
  WriteLn('El responsable inscripto que menos facturo fue: ',MenosFacturo);
  ReadLn();
end.

