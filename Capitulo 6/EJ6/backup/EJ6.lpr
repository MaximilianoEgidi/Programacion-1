program EJ6;
Type
  TM = array[1..200,1..200] of word;

Var
  C:TM;
  N:word;

Procedure CM(Var C:TM;N:byte);
Var
  k,i,j:byte;
Begin
  i:=1;
  j:=N Div 2 + 1;

  For k:=1 to N*N do
  begin
    C[i,j]:=k;

    If k mod N = 0 then
    i:=i + 1
    else
      begin
        if i=1 then
        i:=N
        else
          i:=i - 1;
        if j=N then
        j:=1
        else
          j:=j+1;
      end;
  end;
end;

Procedure Mostrar (C:TM;N:byte);
Var
  i,j:byte;
begin
  For i:=1 to N do
  begin
    WriteLn();
    For j:=1 to N do
    Write(C[i,j],' ');
  end;
end;

Function EsCM (N:byte):Boolean;
begin
  //EsCM:=True;

  If N Div 2 <> 0 then
  EsCM:=False;
end;

begin
  WriteLn('Ingrese un N');
  ReadLn(N);
  CM(C,N);
  Mostrar(C,N);
  ReadLn();

  If EsCM(N) = True then
  begin
    WriteLn('s');
  end;
end.

