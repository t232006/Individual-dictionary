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
    dsaddball: TDataSource;
    addball: TQuery;
    vokabFraza: TBooleanField;
    dssynch: TDataSource;
    synch: TQuery;
    droprate: TQuery;
    dspotential: TDataSource;
    potential: TQuery;
    selectsel: TQuery;
    dsselectsel: TDataSource;
    procedure vokabAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure edittable(op:boolean);


var
  DataModule2: TDataModule2;

implementation

uses Unit1;

procedure edittable(op:boolean);
var no:integer;
begin
   no:=DataModule2.vokab.RecNo;  //остатьс€ на старой записи
    DataModule2.vokab.Active:=false;
    DataModule2.vokab.ReadOnly :=not(op);//если редактировать, то не только чтение
    DataModule2.vokab.Active:=true;
    DataModule2.vokab.RecNo:=no;
end;


{$R *.dfm}

procedure TDataModule2.vokabAfterRefresh(DataSet: TDataSet);
begin
  seAndCor.calcProgress;
  form1.StBar.Panels[4].Text:='ѕотенциал: '+seAndCor.potcount;
  form1.StBar.panels[0].Text:='¬сего слов: '+inttostr(DataModule2.vokab.RecordCount);
end;


end.
