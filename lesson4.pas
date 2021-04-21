unit lesson4;

interface

uses SysUtils, Controls, lessons, database;

   type otv4=array [1..12] of worded;
   var o1,o2:otv4; //массивы для задания для соответствий


procedure card(cou:byte);
procedure sootv;
procedure determ;
procedure apostr(var dest:string);


implementation

procedure apostr(var dest:string);
var ppos:byte;
begin
   ppos:=pos('''',dest);
  insert('''',dest,ppos);
end;


procedure sootv;
var
  l:integer; jk,i:byte; oo1,oo2,oo:set of byte;
begin
  randomize;
  oo1:=[]; oo2:=[];oo:=[];
  for i:=1 to 6 do
  begin
     repeat
     l:=random(length(v)); //взяли случайно слово
     until not (l in oo); //чтобы не повторялось
     oo:=oo+[l];
     repeat
     jk:=random(6)+1; //индекс первого массива ответов
     until not (jk in oo1);
     oo1:=oo1+[jk];
     o1[jk].slovo:=v[l].slovo; //кладем слово
     o1[jk].perevod:=v[l].perevod;

     repeat
     jk:=random(6)+1; //индекс второго массива ответов
     until not (jk in oo2);
     oo2:=oo2+[jk];
     o2[jk].perevod:=v[l].perevod; //кладем слово
     o2[jk].slovo:=v[l].slovo;


  end;
end;

procedure card(cou:byte);
var l:integer;
    i:byte; oo:set of byte;
begin
randomize;
oo:=[];
for i:=1 to cou do
begin
    repeat
     l:=random(length(v)); //взяли случайно слово
    until not (l in oo); //чтобы не повторялось
     oo:=oo+[l];
    o1[i]:=v[l];
end;
end;

procedure determ;
var m:byte;
begin
    for m:=1 to 6 do
      searchandcor(false,'word',o1[m].slovo);
end;


end.

