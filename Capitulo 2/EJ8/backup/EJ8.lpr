program EJ8;

Var
  Edad,Dia:Integer;
  Deporte:String;
  Cuota:real;

begin
  WriteLn('Ingrese dia en el que se realizo el pago');
  ReadLn(Dia);
  WriteLn('Ingrese edad del socio');
  ReadLn(Edad);
  WriteLn('Realiza deporte? (No,Pileta u Otro');
  ReadLn(Deporte);

  Case Edad of
       0..4:
         begin
           Cuota:=0;
           If (Deporte='Pileta') then
              Cuota:=Cuota+800
              else
                If (Deporte='Otro') then
                   Cuota:=Cuota+250;
         end;

       5..12:
         begin
           Cuota:=750;
           If (Deporte='Pileta') then
              Cuota:=Cuota+800
              else
                If (Deporte='Otro') then
                   Cuota:=Cuota+250;
         end;

       13..18:
         begin
           Cuota:=1200;
           If (Deporte='Pileta') then
              Cuota:=Cuota+800
              else
                If (Deporte='Otro') then
                   Cuota:=Cuota+250;
         end;
       else
         begin
           Cuota:=1800;
           If (Deporte='Pileta') then
              Cuota:=Cuota+800
              else
                If (Deporte='Otro') then
                   Cuota:=Cuota+250;
         end;

  end;


  If (Dia>15) then
     Cuota:=(Cuota)+(Cuota*0.05);


 WriteLn('El total a pagar es de: ',Cuota:15:2,' $');
 ReadLn();
end.

