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
    dstopicquerly: TDataSource;
    dropch: TQuery;
    vokabDateRec: TDateTimeField;
    addball: TQuery;
    vokabFraza: TBooleanField;
    dssynch: TDataSource;
    synch: TQuery;
    droprate: TQuery;
    dspotential: TDataSource;
    potential: TQuery;
    selectsel: TQuery;
    dsselectsel: TDataSource;
    vokabSeeked: TSmallintField;
    topic: TQuery;
    dstopic: TDataSource;
    vokabspot: TBooleanField;
    dropspot: TQuery;
    procedure vokabAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //procedure edittable(op:boolean);


var
  DataModule2: TDataModule2;

implementation

uses Unit1;


{$R *.dfm}

procedure TDataModule2.vokabAfterRefresh(DataSet: TDataSet);
var R:Integer;
begin
  seAndCor.calcProgress;
  form1.StBar.Panels[4].Text:='Потенциал: '+seAndCor.potcount;
  if (DataSet.Filtered) then
    begin
      DataSet.Filtered:=false;
      R:=DataSet.RecordCount;
      form1.StBar.panels[0].Text:='Всего слов: '+inttostr(R);
      DataSet.Filtered:=true;
    end;
  form1.StBar.panels[0].Text:='Всего слов: '+inttostr(DataSet.RecordCount);
end;


end.
