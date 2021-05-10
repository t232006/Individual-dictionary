unit lessons;

interface

uses       SysUtils,  Controls, database, Dialogs, Graphics;

type
  worded=record
    ind:word;
    slovo:string;
    perevod:string;
    topic:word;
    date:TDate;
    reit:byte;
  end;
  SlPerSl=record
    slovo:string;
    perevod:string;
  end;
 otv=array[0..6] of SlPerSl; //массив,отвечающий за ответы

 TYesNo=class
 public

    //trueanswer:boolean;

    promptcolor:Tcolor;

 private
    //_answer:boolean;
    _serial:byte;
    _prompt:string;
    _GetString:string;
    word1:string;
    word2:string;
    IsItTrue:boolean;
 public
    {property IsItTrue:boolean read _IsItTrue;
    {property word1:string read _word1;
    property word2:string read _word2;}
    property serial:byte read _serial;
    property prompt:string read _prompt;
    property GetString:string read _GetString;
    procedure GiveAnswer(answer:boolean);
    procedure Init;
 end;

var
v:array of worded;  //заполнение массива отдельной процедурой
bmas,buf: array of string; //массив букв или слов


procedure slovoPer(var w:otv; var ind:byte); //ind-верный вариант
procedure PerevodSlo(var w:otv; var ind:byte); //ind-верный вариант
procedure read1(countrec:byte);
procedure writeslovo(var ind:integer;var sl,per:string);
procedure pobukvam(st:string); //строки на случай перемешивания слов
function fraza(s:string):boolean; //отвечает фраза ли это или слово



implementation

uses DB, DBTables;


procedure TYesNo.GiveAnswer(answer: boolean);
begin
    if answer=IsItTrue then
  begin
    inc(_serial); //serial of true answers
    PromptColor:=clgreen;
    _prompt:='вы правы';
    if IsItTrue=true then
    begin
      searchandcor(true,'word',word1);
      searchandcor(true,'translate',word2);
    end;
  end else
  begin
    _serial:=0;
    PromptColor:=clred;
    _prompt:='вы неправы';
  end;
end;

procedure TYesNo.Init;
var giveTrue:byte;
    l,ll:integer;
begin
  randomize;
  giveTrue:=random(2);
  l:=random(length(v)); //conjectived word
  repeat
    ll:=random(length(v)); //wrong answer
  until l<>ll;
  if giveTrue=1 then
  begin
    word1:=v[l].slovo;
    word2:=v[l].perevod;
    IsItTrue:=true;
  end else
  begin
    word1:=v[l].slovo;
    word2:=v[ll].perevod;
    IsItTrue:=false;
  end;
  _GetString:=word1+' = '+word2;


end;


procedure read1(countrec:byte);
var {f:text; ss:string;} i:word;
procedure zapmas (kl:word);
begin
    with DataModule2.selectsel do
  begin
    v[kl].ind:=kl;
    v[kl].slovo:=Fields[1].AsString;
    v[kl].perevod:=fields[2].AsString;
    v[kl].date:=fields[4].AsDateTime;
    v[kl].topic:=fields[3].AsInteger;
    v[kl].reit:=fields[5].AsInteger;
  end;
end;
begin

    //---------------------------------------
  with DataModule2.selectsel do
  begin
    Open;
    if RecordCount<countrec then
    begin
      DataModule2.topicquerly.SQL.Text:='UPDATE vokab SET usersel=true';//если отмечено менее 6 записей, то выделить все записи
      DataModule2.topicquerly.ExecSQL;
      showmessage('выделены все записи, поскольку должно быть не менее '+inttostr(countrec));
      Close; Open;
    end;

    setlength(v,RecordCount);
    First;
    for i:=0 to RecordCount-1 do
    begin
      zapmas (i); //заполнить нулевой
      Next;
    end;
  end;


end;

procedure writeslovo(var ind:integer; var sl,per:string);//ind-индекс верного ответа
begin
  randomize;
  ind:=random(length(v));
  per:=v[ind].perevod;  sl:=v[ind].slovo;
end;

function fraza(s:string):boolean; //отвечает фраза ли это или слово
var j,z:byte;
begin
      z:=0;
     for j:=0 to length(s)-1 do
     begin
      if s[j]=' ' then inc(z);
      if z>=3 then        //3 пробела - 4 словая
        begin
          fraza:=true;
          break;
        end else fraza:=false;
     end;
end;

procedure pobukvam(st:string); //строки на случай перемешивания слов
var st1:string;
j,k:byte;

         //..................................
begin
//setlength(buf,1);
st1:='';
if fraza(st) then
  begin
    j:=0; k:=0;
    repeat
      setlength(buf,length(buf)+1);
      while (st[j]<>' ') and (j<=length(st)) do
        begin
          st1:=st1+st[j];
          inc(j);
        end;
      buf[k]:=st1;  //накопление слов из фразы
      inc(k); inc(j);
      st1:='';
    until j>length(st)-1;
    //массив сформирован, теперь нужно его перемешать


  end else  //------------------------------------
  begin
     setlength(buf,length(st));
     for j:=0 to length(st)-1 do
      buf[j]:=st[j+1];     //массив сформирован
  end;

  //---------------------------------
  k:=0;
    setlength(bmas,length(buf));
    repeat
      j:=random(length(buf));
      bmas[k]:=buf[j];
      inc(k);
      while j<length(buf)-1 do
      begin
        buf[j]:=buf[j+1];
        inc(j);
      end;
      setlength(buf,length(buf)-1);
    until length(buf)=0;


end;




procedure PerevodSlo(var w:otv; var ind:byte); //ind-верный вариант; w по сути string
var l:integer;
    i,g:byte;
    j:set of byte; //распределение ответов
    jj:set of byte;
begin
    randomize;
    j:=[]; jj:=j;
    l:=random(length(v)); //загаданное слово (индекс)
    w[0].perevod:=v[l].perevod; //загаданное слово
      g:=random(6)+1;  //любому варианту
       w[g].slovo:=v[l].slovo;  // даем верный ответ
    ind:=g;
      j:=j+[g];  jj:=jj+[l];
    for i:=2 to 6 do  //остальным даем неверные
    begin
      repeat
        g:=random(6)+1;
      until not(g in j);
      j:=j+[g];
      repeat
        l:=random(length(v));//генерим любой вариант
      until not(l in jj);
      jj:=jj+[l];      //чтобы не было повторов
      w[g].slovo:=v[l].slovo; //кладем в неверный вариант
      w[g].perevod:=v[l].perevod;
    end;
end;



procedure slovoPer(var w:otv; var ind:byte); //ind-верный вариант;w record со словом-переводом
var l:integer;
    i,g:byte;
    j:set of byte; //распределение ответов
    jj:set of byte;
begin
    randomize;
    j:=[]; jj:=j;
    l:=random(length(v)); //загаданное слово (индекс)
    w[0].slovo:=v[l].slovo; //загаданное слово
      g:=random(6)+1;  //любому варианту
       w[g].perevod:=v[l].perevod;  // даем верный ответ
    ind:=g;
      j:=j+[g];  jj:=jj+[l];
    for i:=2 to 6 do  //остальным даем неверные
    begin
      repeat
        g:=random(6)+1;
      until not(g in j);
      j:=j+[g];
      repeat
        l:=random(length(v));//генерим любой вариант
      until not(l in jj);
      jj:=jj+[l];      //чтобы не было повторов
      w[g].perevod:=v[l].perevod; //кладем в неверный вариант
      w[g].slovo:=v[l].slovo; //put wrong word
    end;
end;

//-----------------------------------


end.
