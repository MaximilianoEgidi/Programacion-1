program A;

Var
  Puntuacion1,Puntuacion2:Integer;
  Jugada1,Jugada2:String;

begin
  Puntuacion1:=0;
  Puntuacion2:=0;

  Repeat
  WriteLn('Ingrese jugada del jugador 1');
  ReadLn(Jugada1);
  WriteLn('Ingres jugada del jugador 2');
  ReadLn(Jugada2);

  //Piedra
  If (Jugada1='Piedra') and (Jugada2='Piedra') then
  begin
    WriteLn('Empate');
  end;

  If (Jugada1='Piedra') and (Jugada2='Papel') then
  begin
    WriteLn('Gana jugador 2');
    Puntuacion2:=Puntuacion2+1;
  end;

  If (Jugada1='Piedra') and (Jugada2='Tijera') then
  begin
    WriteLn('Gana jugador 1');
    Puntuacion1:=Puntuacion1+1;
  end;
  //Papel

  If (Jugada1='Papel') and (Jugada2='Piedra') then
  begin
    WriteLn('Gana Jugador 1');
    Puntuacion1:=Puntuacion1+1;
  end;

  If (Jugada1='Papel') and (Jugada2='Papel') then
  begin
    WriteLn('Empate');
  end;

  If (Jugada1='Papel') and (Jugada2='Tijera') then
  begin
    WriteLn('Gana jugador 2');
    Puntuacion2:=Puntuacion2+1;
  end;

  //Tijera
  If (Jugada1='Tijera') and (Jugada2='Piedra') then
  begin
    WriteLn('Gana Jugador 2');
    Puntuacion2:=Puntuacion2+1;
  end;

  If (Jugada1='Tijera') and (Jugada2='Papel') then
  begin
    WriteLn('Gana jugador 1');
    Puntuacion1:=Puntuacion1+1;
  end;

  If (Jugada1='Tijera') and (Jugada2='Tijera') then
  begin
    WriteLn('Empate');
  end;

  until (Puntuacion1=5) or (Puntuacion2=5) ;

  If Puntuacion1=5 then
  begin
    WriteLn('El jugador 1 gano el partido');
  end
  else
  begin
    WriteLn('El jugador 2 gano el partido');
  end;

  If Jugada1 = 'Piedra' then
  begin
    If Jugada2 = 'Tijera' then
    begin
         WriteLn('Gana jugador 1');
    end
    else
    If Jugada2 = 'Papel' then
    begin
      WriteLn('Gana jugador 2');
    end
    else
    begin
      WriteLn('Empate');
    end;
  end;

  ReadLn();
end.

