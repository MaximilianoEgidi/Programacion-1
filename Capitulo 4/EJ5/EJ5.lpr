program EJ5;

Function Cramer(a,b,d,e,Ti1,Ti2:integer):String;
var
  DeterminanteP,DeterminanteX,DeterminanteY:integer;
  X,Y:real;

begin
  DeterminanteP:=(a*e)-(b*d);
  DeterminanteX:=(Ti1*e)-(b*Ti2);
  DeterminanteY:=(a*Ti2)-(Ti1*d);
  X:=DeterminanteX/DeterminanteP;
  Y:=DeterminanteY/DeterminanteP;

  //Cramer:='El sistema tiene solucion con X: '+X,' Y: '+Y;
  WriteLn('El sistema tiene solucion con X: ',X:4:2,' Y: ',Y:4:2);


end;


var
  a,b,d,e,Ti1,Ti2:integer;
begin
  WriteLn('| a  b Ti1 |');
  WriteLn('| d  e Ti2 |');

  WriteLn('Ingrese a y b');
  ReadLn(a,b);
  WriteLn('Ingrese d y e');
  ReadLn(d,e);
  WriteLn('Ingrese dos terminos independientes');
  ReadLn(Ti1,Ti2);

  WriteLn(Cramer(a,b,d,e,Ti1,Ti2));
  ReadLn();
end.

