program EJ5;

Var
  Numero1,Numero2,Numero3:Integer;

begin
   WriteLn('Ingrese numero 1');
   ReadLn(Numero1);
   WriteLn('Ingrese numero 2');
   ReadLn(Numero2);
   WriteLn('Ingrese numero 3');
   ReadLn(Numero3);

   // Solucion secuencial

   If (Numero1>Numero2) and (Numero1>Numero3) then
      WriteLn(Numero1,' es el mayor');
   If (Numero2>Numero1) and (Numero2>Numero3) then
      WriteLn(Numero2,' es el mayor');
   If (Numero3>Numero1) and (Numero3>Numero2) then
      WriteLn(Numero3, ' es el mayor');


   // b) Solucion compuesta y anidada

   If (Numero1>Numero2) and (Numero1>Numero3) then
      WriteLn(Numero1,' es el mayor')
      else
        If (Numero2>Numero1) and (Numero2>Numero3) then
           WriteLn(Numero2,' es el mayor')
           else
             WriteLn(Numero3, ' es el mayor');


   // c) Solucion simple y anidada

   If (Numero1>Numero2) then
      If(Numero1>Numero3) then
         WriteLn(Numero1,' es el mayor');


   ReadLn();
end.

