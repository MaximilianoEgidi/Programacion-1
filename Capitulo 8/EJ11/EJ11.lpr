program EJ11;

Procedure Piramide (Inicial,Final:word);
Var
  i:word;
begin
  If Final<=9 then
  begin
    For i:=FInal downto Inicial do
    begin
      Write(i,' ');
    end;
    WriteLn();
    Piramide(Inicial,Final+1);
  end;
end;

begin
  Piramide(1,1);
  ReadLn();
end.

