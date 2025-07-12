program EJ2;

type
  TV= array[1..30] of integer;

var
  Arch:text;
  VectorPar,VectorImpar:TV;
  N,IndiceP,IndiceI,i:Integer;

begin
  IndiceI:=1;
  IndiceP:=1;

  Assign(Arch,'Numeros.txt');
  Reset(Arch);

  While not eof(Arch) do
  begin
    ReadLn(Arch,N);
    If N <> 0 then
    begin
      If odd(N) then
      begin
        VectorImpar[IndiceI]:=N;
        IndiceI:=IndiceI+1;
      end
      else
          begin
            VectorPar[IndiceP]:=N;
            IndiceP:=IndiceP+1;
          end;
    end;
  end;

  close(Arch);

  WriteLn('Numeros Impares:');
  For i:=1 to IndiceI-1 do
  begin
    WriteLn(VectorImpar[i],' ');
  end;

  WriteLn('Numeros Pares:');
  For i:=1 to IndiceP-1 do
  begin
    WriteLn(VectorPar[i]);
  end;
  ReadLn();
end.

