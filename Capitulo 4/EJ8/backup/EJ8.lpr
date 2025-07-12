program EJ8;

Function Descuento(Tipo:char;Dia:Word;Monto:Real):real;
begin

  Descuento:=0;

  If (tipo='O') and (Monto>300) then
  begin
    case Dia of
    10,20,30:Descuento:=(Monto*0.05);
    end;
  end;

  If (Tipo='C') and (Dia>15) then
  begin
    Descuento:=(Monto*0.10);
  end;

  If (Tipo='S') and (Dia<=15) then
  begin
    Descuento:=(Monto*0.15);
  end;
end;

var
  Arch:text;
  Tipo:char;
  Dia,Codigo:word;
  Monto:Real;
  DescO,DescC,DescS:Boolean;

begin
  Assign(Arch,'Tarjetas.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    ReadLn(Arch,Codigo);
    ReadLn(Arch,Tipo,Dia,Monto);
    While Tipo <>'F' do
    begin
      ReadLn(Arch,Tipo,Dia,Monto);
    end;

    If Descuento(Tipo,Dia,Monto)=0 then
      begin
        WriteLn('EL cliente numero ',Codigo, 'no uso descuentos');
      end;

  end;
ReadLn();

end.

