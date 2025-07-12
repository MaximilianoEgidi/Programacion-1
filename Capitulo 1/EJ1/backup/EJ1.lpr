program EJ1;

var
   TipoPintura: string;
   Cant, CantNecesaria: real;
begin
  WriteLn ('Ingrese tipo de pintura');
  ReadLn(TipoPintura);
  WriteLn ('Ingrese cantidad de pintura ', TipoPintura,' que tiene');
  ReadLn(Cant);
  If TipoPintura='Blanca' then
     //Total 14
     //67,85% negro y 32,15%
     CantNecesaria:=Cant*0.3215;
     WriteLn(CantNecesaria);
     ReadLn();
   Else
   WriteLn('Negro');

end.

