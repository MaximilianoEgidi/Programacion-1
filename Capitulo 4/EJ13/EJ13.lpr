program EJ13;

Procedure HorasFinal(HorasI,MinutosI,SegundosI,SegundosT:integer;var HorasF,MinutosF,SegundosF,SumaTiempo:integer);
begin
  SumaTiempo:=SegundosI+(MinutosI*60)+(HorasI*3600)+SegundosT;
  //WriteLn(SumaTiempo);
  HorasF:=(SumaTiempo Div 3600) mod 24;
  SumaTiempo:=SumaTiempo mod 3600;
  MinutosF:=(SumaTiempo Div 60);
  SumaTiempo:=(SumaTiempo mod 60);
  SegundosF:=SumaTiempo;

end;

Var
  HorasI,MinutosI,SegundosI,SegundosT,HorasF,MinutosF,SegundosF,SumaTiempo:integer;

begin
  SegundosF:=0;
  MinutosF:=0;
  HorasF:=0;
  WriteLn('Ingrese horas, minutos y segundos iniciales');
  ReadLn(HorasI,MinutosI,SegundosI);
  WriteLn('Ingrese segundos transcurridos');
  ReadLn(SegundosT);

  HorasFinal(HorasI,MinutosI,SegundosI,SegundosT,HorasF,MinutosF,SegundosF,SumaTiempo);

  WriteLn('Hora final: ',HorasF,' ',MinutosF,' ',SegundosF);
  ReadLn();
end.

