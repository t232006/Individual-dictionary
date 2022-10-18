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
    dspotential: TDataSource;
    potential: TQuery;
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
   no:=DataModule2.vokab.RecNo;  //�������� �� ������ ������
    DataModule2.vokab.Active:=false;
    DataModule2.vokab.ReadOnly :=not(op);//���� �������������, �� �� ������ ������
    DataModule2.vokab.Active:=true;
    DataModule2.vokab.RecNo:=no;
end;


{$R *.dfm}

procedure TDataModule2.vokabAfterRefresh(DataSet: TDataSet);
begin
  seAndCor.calcProgress;
  form1.StatusBar1.Panels[4].Text:='���������: '+seAndCor.potcount;
  form1.statusbar1.panels[0].Text:='����� ����: '+inttostr(DataModule2.vokab.RecordCount);
end;


end.
