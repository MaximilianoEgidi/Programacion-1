program EJ23;

Var
   ArchPass:text;
   Clave:Char;
   Password:String;
   BoolMinuscula:Boolean;


begin
  Password:=' ';
  BoolMinuscula:=False;

  Assign(ArchPass,'Passwords.txt');
  reset(ArchPass);

  While not eof(ArchPass) do
  begin
       Read(ArchPass,Clave);
       Write(Clave);
       If Clave <> ' ' then
       begin

            If (Clave>'a') and (Clave<'z') then
            BoolMinuscula:=True;

            if (Clave>'A') and (Clave<'Z') then
            BoolMayuscula:=True;

            if (Clave>0) and (Clave<9) then
            Digitos:=Digitos+1;




       end;
  end;

 Readln();

end.

