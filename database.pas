unit database;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataModule2 = class(TDataModule)
    sdvokab: TDataSource;
    vokab: TTable;
    top: TTable;
    dstop: TDataSource;
    vokabNumber: TAutoIncField;
    vokabWord: TStringField;
    vokabTranslate: TStringField;
    vokabTopic: TIntegerField;
    vokabRate: TSmallintField;
    topId: TAutoIncField;
    topName: TStringField;
    vokabtopicname: TStringField;
    vokabusersel: TBooleanField;
    dsless6: TDataSource;
    less6: TQuery;
    vokabtopicn: TStringField;
    topicquerly: TQuery;
    dstopic: TDataSource;
    dsdropch: TDataSource;
    dropch: TQuery;
    vokabDateRec: TDateTimeField;
    selectsel: TQuery;
    dsselect: TDataSource;
    dsaddball: TDataSource;
    addball: TQuery;
    vokabFraza: TBooleanField;
    dssynch: TDataSource;
    synch: TQuery;
    droprate: TQuery;
    procedure vokabAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure edittable(op:boolean);
  procedure searchandcor(add:boolean; field,word:string);

var
  DataModule2: TDataModule2;

implementation

uses Unit1;

procedure edittable(op:boolean);
var no:integer;
begin
   no:=DataModule2.vokab.RecNo;  //остаться на старой записи
    DataModule2.vokab.Active:=false;
    DataModule2.vokab.ReadOnly :=not(op);//если редактировать, то не только чтение
    DataModule2.vokab.Active:=true;
    DataModule2.vokab.RecNo:=no;
end;

procedure searchandcor(add:boolean; field,word:string);
begin
if add then
DataModule2.addball.SQL.Text:='UPDATE vokab SET rate=rate+1 WHERE (rate<7-1) and (' +field+'='''+word+''')'
else
DataModule2.addball.SQL.Text:='UPDATE vokab SET rate=rate-2 WHERE (' +field+'='''+word+''') and (rate>1)';
DataModule2.addball.ExecSQL;
end;

{$R *.dfm}

procedure TDataModule2.vokabAfterRefresh(DataSet: TDataSet);
begin
form1.statusbar1.panels[0].Text:='Всего слов: '+inttostr(DataModule2.vokab.RecordCount);
end;


end.
