program EJ13;

Var
   Tipo:Char;
   Precio:Real;

begin
  Repeat
      WriteLn('Ingrese tipo y precio');
      ReadLn(Tipo,Precio);
  until (Tipo = 'P') or (Tipo = 'F') or (Tipo = 'A')
end.





{begin
  Readln(Tipo, Precio);
  Tipo := Upcase(Tipo);
  // P = panadería, F = fiambrería, A = almacén
  While (Tipo <> 'P') and (Tipo <> 'F') and (Tipo <> 'A') do
        Begin
             Readln(Tipo);
             Tipo := Upcase(Tipo);
        End;
end.
}
