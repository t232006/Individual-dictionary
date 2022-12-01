unit lessons;

interface

uses       SysUtils,  Controls, database, Dialogs, Graphics, basemanipulation;

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

 TGeneral=class
     v:array of worded;  //���������� ������� ��������� ����������
     constructor Create(countrec:byte);
 end;

 TYesNo=class(TGeneral)
 public
    promptcolor:Tcolor;
 private
    //_answer:boolean;
    _serial:byte;
    _prompt:string;
    _GetString:string;
    word1:string;
    word2:string;
    IsItTrue:boolean;
    seAndCor:Tgrademanipulation;
 public
    property serial:byte read _serial;
    property prompt:string read _prompt;
    property GetString:string read _GetString;
    procedure GiveAnswer(answer:boolean);
    procedure Init;
    procedure Reset;
 end;
 TTest=class(TGeneral)
    public
    procedure slovoPer(var w:otv; var ind:byte); //ind-������ �������
    procedure PerevodSlo(var w:otv; var ind:byte); //ind-������ �������
 end;
//var

//bmas: array of string; //������ ���� ��� ����

implementation

uses DB, DBTables;

procedure TYesNo.Reset();
begin
   _serial:=0;
end;

procedure TYesNo.GiveAnswer(answer: boolean);
begin
    if answer=IsItTrue then
  begin
    inc(_serial); //serial of true answers
    PromptColor:=clgreen;
    _prompt:='�� �����';
    if IsItTrue=true then
    begin
      seAndCor.searchandcor(true,'word',word1);
      seAndCor.searchandcor(true,'translate',word2);
    end;
  end else
  begin
    reset;
    PromptColor:=clred;
    _prompt:='�� �������';
  end;
end;

procedure TYesNo.Init;
var giveTrue:byte;
    l,ll:integer;
begin
  seAndCor:=Tgrademanipulation.Create(DataModule2);
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


constructor TGeneral.Create(countrec:byte);
var {f:text; ss:string;} i:word;
procedure zapmas (kl:word);
begin
    with DataModule2.vokab do
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
  with DataModule2.vokab do
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

procedure TTest.PerevodSlo(var w:otv; var ind:byte); //ind-������ �������; w �� ���� string
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

procedure TTest.slovoPer(var w:otv; var ind:byte); //ind-������ �������;w record �� ������-���������
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
