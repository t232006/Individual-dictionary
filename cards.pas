unit cards;

interface
uses lessons;
type TCards = class(TGeneral)
public
    o1,o2:array [1..12] of worded;
   constructor Create(cou:byte);
end;

implementation
constructor TCards.Create(cou:byte);   //fill cards by words
var l:integer;
    i:byte; oo:set of byte;
begin
inherited create(cou);
randomize;
oo:=[];
for i:=1 to cou do
begin
    repeat
     l:=random(length(v)); //����� �������� �����
    until not (l in oo); //����� �� �����������
     oo:=oo+[l];
    o1[i]:=v[l];
end;
end;

end.
