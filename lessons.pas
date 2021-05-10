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
 otv=array[0..6] of SlPerSl; //������,���������� �� ������

 TYesNo=class
 public

    trueanswer:string;

    promptcolor:Tcolor;

 private
    _answer:string;
    _serial:byte;
    _prompt:string;
    _GetString:string;
    _word1:string;
    _word2:string;
    _IsItTrue:boolean;
 public
    property IsItTrue:boolean read _IsItTrue;
    property word1:string read _word1;
    property word2:string read _word2;
    property serial:byte read _serial;
    property prompt:string read _prompt;
    property GetString:string read _GetString;
    procedure GiveAnswer(answer:string);
    constructor Init;
 end;

var
v:array of worded;  //���������� ������� ��������� ����������
bmas,buf: array of string; //������ ���� ��� ����


procedure slovoPer(var w:otv; var ind:byte); //ind-������ �������
procedure PerevodSlo(var w:otv; var ind:byte); //ind-������ �������
procedure read1(countrec:byte);
procedure writeslovo(var ind:integer;var sl,per:string);
procedure pobukvam(st:string); //������ �� ������ ������������� ����
function fraza(s:string):boolean; //�������� ����� �� ��� ��� �����



implementation

uses DB, DBTables;


procedure TYesNo.GiveAnswer(answer:string);
begin



end;
procedure TForm1.YesNoAnswer(answer: Boolean);
var w1,w2:string; trueanswer:boolean;
begin
    trueanswer:=YesNoImplementation(w1,w2);
    if answer=trueanswer then
  begin
    inc(serial); //serial of true answers
    Memo4.Font.Color:=clgreen;
    Memo4.Text:='�����';
    if trueanswer=true then
    begin
      searchandcor(true,'word',w1);
      searchandcor(true,'translate',w2);
    end;
  end else
  begin
    serial:=0;
    Memo4.Font.Color:=clred;
    Memo4.Text:='�������';
  end;
  StatusBar1.Panels.Items[3].Text:=IntToStr(serial);
end;

function TForm1.YesNoImplementation(var w1:string; var w2:string):boolean;
begin
  Memo4.Clear;
  result:=YesNo(w1,w2);
  memo3.Text:=w1+' = '+w2;
end;

constructor TYesNo.Init;
var giveTrue:byte;
    l,ll:integer;
begin
  randomize;
  giveTrue:=random(2);
  l:=random(length(v)); //conjectived word
  ll:=random(length(v)); //wrong answer
  if giveTrue=1 then
  begin
    _word1:=v[l].slovo;
    _word2:=v[l].perevod;
    _IsItTrue:=true;
  end else
  begin
    _word1:=v[l].slovo;
    _word2:=v[ll].perevod;
    _IsItTrue:=false;
  end;


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
      DataModule2.topicquerly.SQL.Text:='UPDATE vokab SET usersel=true';//���� �������� ����� 6 �������, �� �������� ��� ������
      DataModule2.topicquerly.ExecSQL;
      showmessage('�������� ��� ������, ��������� ������ ���� �� ����� '+inttostr(countrec));
      Close; Open;
    end;

    setlength(v,RecordCount);
    First;
    for i:=0 to RecordCount-1 do
    begin
      zapmas (i); //��������� �������
      Next;
    end;
  end;


end;

procedure writeslovo(var ind:integer; var sl,per:string);//ind-������ ������� ������
begin
  randomize;
  ind:=random(length(v));
  per:=v[ind].perevod;  sl:=v[ind].slovo;
end;

function fraza(s:string):boolean; //�������� ����� �� ��� ��� �����
var j,z:byte;
begin
      z:=0;
     for j:=0 to length(s)-1 do
     begin
      if s[j]=' ' then inc(z);
      if z>=3 then        //3 ������� - 4 ������
        begin
          fraza:=true;
          break;
        end else fraza:=false;
     end;
end;

procedure pobukvam(st:string); //������ �� ������ ������������� ����
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
      buf[k]:=st1;  //���������� ���� �� �����
      inc(k); inc(j);
      st1:='';
    until j>length(st)-1;
    //������ �����������, ������ ����� ��� ����������


  end else  //------------------------------------
  begin
     setlength(buf,length(st));
     for j:=0 to length(st)-1 do
      buf[j]:=st[j+1];     //������ �����������
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




procedure PerevodSlo(var w:otv; var ind:byte); //ind-������ �������; w �� ���� string
var l:integer;
    i,g:byte;
    j:set of byte; //������������� �������
    jj:set of byte;
begin
    randomize;
    j:=[]; jj:=j;
    l:=random(length(v)); //���������� ����� (������)
    w[0].perevod:=v[l].perevod; //���������� �����
      g:=random(6)+1;  //������ ��������
       w[g].slovo:=v[l].slovo;  // ���� ������ �����
    ind:=g;
      j:=j+[g];  jj:=jj+[l];
    for i:=2 to 6 do  //��������� ���� ��������
    begin
      repeat
        g:=random(6)+1;
      until not(g in j);
      j:=j+[g];
      repeat
        l:=random(length(v));//������� ����� �������
      until not(l in jj);
      jj:=jj+[l];      //����� �� ���� ��������
      w[g].slovo:=v[l].slovo; //������ � �������� �������
      w[g].perevod:=v[l].perevod;
    end;
end;



procedure slovoPer(var w:otv; var ind:byte); //ind-������ �������;w record �� ������-���������
var l:integer;
    i,g:byte;
    j:set of byte; //������������� �������
    jj:set of byte;
begin
    randomize;
    j:=[]; jj:=j;
    l:=random(length(v)); //���������� ����� (������)
    w[0].slovo:=v[l].slovo; //���������� �����
      g:=random(6)+1;  //������ ��������
       w[g].perevod:=v[l].perevod;  // ���� ������ �����
    ind:=g;
      j:=j+[g];  jj:=jj+[l];
    for i:=2 to 6 do  //��������� ���� ��������
    begin
      repeat
        g:=random(6)+1;
      until not(g in j);
      j:=j+[g];
      repeat
        l:=random(length(v));//������� ����� �������
      until not(l in jj);
      jj:=jj+[l];      //����� �� ���� ��������
      w[g].perevod:=v[l].perevod; //������ � �������� �������
      w[g].slovo:=v[l].slovo; //put wrong word
    end;
end;

//-----------------------------------


end.
