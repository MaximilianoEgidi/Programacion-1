program EJ11;

Procedure EjeSimetria(a,b,c:Real;var Eje,Vertice:Real);
begin
  Eje:=(-b)/(2*a);
  Vertice:=a*sqr((eje))+(b*eje)+(c);
end;

Procedure Discriminante(a,b,c:real;var D,Raiz1,Raiz2:real);
begin
  D:=sqr(b)-(4*a*c);
  If (D <> 0) and (D>0) then
  begin
    Raiz1:=(-b+sqrt(D))/2;
    Raiz2:=(-b-sqrt(D))/2;
  end;
end;

Function Imagen(a,b,c,x:real):real;
begin
  Imagen:=a*sqr(x)+(b*x)+(c)
end;

var
  a,b,c,D,x,Eje,Vertice,Raiz1,Raiz2:Real;

begin
  Vertice:=0;
  Eje:=0;
  Raiz1:=0;
  Raiz2:=0;
  D:=0;

  WriteLn('Parabola y=ax^2+bx+c');
  WriteLn('Ingrese "a"');
  ReadLn(a);
  WriteLn('Ingrese "b"');
  ReadLn(b);
  WriteLn('Ingrese "c"');
  ReadLn(c);

  WriteLn('Ingrese un x');
  ReadLn(x);

  EjeSimetria(a,b,c,Eje,Vertice);
  If a>0 then
  begin
    WriteLn('La parabola tiene un minimo en el punto(',Eje:4:2,',',Vertice:4:2,')');
    WriteLn('Abre hacia arriba');
  end
  else
  begin
    WriteLn('La parabola tiene un maximo en el punto(',Eje:4:2,',',Vertice:4:2,')');
    WriteLn('Abre hacia abajo');
  end;

  Discriminante(a,b,c,D,Raiz1,Raiz2);
  WriteLn('Raices en x=',Raiz1:4:2,' y en x=',Raiz2:4:2);
  WriteLn('Imagen en x=',x:4:2,' es ',Imagen(a,b,c,x):4:2);
  ReadLn();
end.

