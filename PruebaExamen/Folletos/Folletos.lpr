program Parcial;

type
  TVB = array[1..20] of byte;
  TVR = array[1..20] of real;

const
  X = 1.0;

function Costo(Tipo: char; Tam, Cant: byte): real;
var
  Imp: real;
begin
  Imp := Cant * X;
  case Tipo of
    'A': Imp := Imp * 2;
    'B': Imp := Imp * 3;
    'C': Imp := Imp * 5;
  end;
  if Tam = 2 then
    Costo := Imp * 1.5
  else
    Costo := Imp;
end;

procedure LeeFolletos(var VCosto: TVR; var VMasL, VCant: TVB; var j: byte);
var
  Arch: Text;
  Car, Tipo: char;
  i, Max, Tam: byte;
begin
  Assign(Arch, 'Datos.txt');
  Reset(Arch);
  j := 0;

  while not eof(Arch) do {analiza cada línea del archivo}
  begin
    j := j + 1;
    VCant[j] := 0;
    VMasL[j] := 0;
    Read(Arch, Tipo, Tam, Car);

    while Car <> '.' do
      if Car = ' ' then
        Read(Arch, Car)
      else
      begin
        VCant[j] := VCant[j] + 1;
        i := 0;

        while (Car <> '.') and (Car <> ' ') do
        begin
          i := i + 1;
          Read(Arch, Car);
        end;

        if i > VMasL[j] then
          VMasL[j] := i;
      end;

    VCosto[j] := Costo(Tipo, Tam, VCant[j]);
    Readln(Arch);
  end;

  Close(Arch);
end;

procedure Escribe(VCosto: TVR; VMasL, VCant: TVB; N: byte);
var
  I: byte;
begin
  Writeln('Cantidad      Pal más larga     Costo');
  for i := 1 to N do
    Writeln(VCant[i]:10, VMasL[i]:12, VCosto[i]:8:2);
end;

function MaxCosto(VCosto: TVR; VMasL: TVB; N: byte): real;
begin
  {Función no implementada}
end;

function Busca(VCant: TVB; M, N: byte): byte;
begin
  {Función no implementada}
end;

var
  VCosto: TVR;
  VMasL, VCant: TVB;
  N,j: byte;
begin
  LeeFolletos(VCosto,VMasL,VCant,j)
  Escribe(VCosto,VMasL,VCant,N);
end.
