program EJ14;
  Var
    Bool:boolean;
    Sum,x:Integer;

    Begin
      Bool:=False;
      Sum:=0;
      WriteLn('Ingrese x');
      ReadLn(x);
      While (x <> 0) and (Bool=False) do
      begin
        Sum:=Sum+x;
        if Sum>100 then
           Bool:=True;
        WriteLn(Sum,Bool);
        WriteLn('Ingrese otro valor de x');
        ReadLn(x);
      end;
      Writeln('Resultado ', Sum);
      ReadLn();
    end.

{
begin
  Bool := false;
  Sum := 0;
  WriteLn('Ingrese x');
  Readln(x);
  If x <> 0 then
      Repeat
          Sum := Sum + x;
          If Sum > 100 then
              Bool := true;
          WriteLn('Ingrese otro x');
          Readln(x);
      Until (x = 0) or Bool;
  Writeln('Resultado ', Sum);
  ReadLn()
end.
}





// Lote 1: 0         Resultado:0

// Lote 2: 70 40 20  Resultado:110

// Lote 3: 70 0      Resultado:70

//El programa te pide valores de X hasta que la suma de los X supere 100 o
//Hasta que el X ingresado sea 0

