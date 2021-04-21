unit dialogtopic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, database, Buttons, Grids, DBGrids, StdCtrls, DB, DBCtrls;

type
  Ttopicform = class(TForm)
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    BitBtn1: TBitBtn;
    DBMemo1: TDBMemo;
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  topicform: Ttopicform;
  //itemlist:Tstrings;

implementation

{$R *.dfm}

procedure Ttopicform.SpeedButton3Click(Sender: TObject);
begin
DBGrid1.Options:=DBGrid1.Options+[dgediting];
//DBGrid1.Options:=DBGrid1.Options-[dgediting];
DataModule2.top.Edit;
end;

procedure Ttopicform.BitBtn1Click(Sender: TObject);
 
var k:byte;
begin
if DataModule2.top.State in [dsedit, dsinsert]
then
begin
  DataModule2.top.Post;
  DataModule2.vokab.Refresh;
end else
begin

    dbgrid1.DataSource.DataSet.DisableControls; //чтобы не перескакивать
     for k:=0 to DBGrid1.SelectedRows.Count-1 do
     begin
      DBGrid1.DataSource.DataSet.GotoBookmark(pointer(DBGrid1.SelectedRows.items[k]));;
      //DataModule2.dropch.ExecSQL;
      //DataModule2.topicquerly.SQL.Clear; //чтобы втрой раз не добавлять ту же строку
      if k>0 then  DataModule2.topicquerly.SQL.Add(' or ');//for separation
      DataModule2.topicquerly.SQL.Add('topic = '+ DataModule2.top.Fields[0] .AsString );
     
     end;
      DataModule2.topicquerly.ExecSQL;
      DataModule2.vokab.Refresh;
     DBGrid1.DataSource.DataSet.enablecontrols;
end;
DBGrid1.Options:=DBGrid1.Options-[dgediting];
end;

procedure Ttopicform.SpeedButton2Click(Sender: TObject);
begin
DBGrid1.Options:=DBGrid1.Options+[dgediting];
DataModule2.top.Delete;
end;

procedure Ttopicform.SpeedButton1Click(Sender: TObject);
begin
DBGrid1.Options:=DBGrid1.Options+[dgediting];
DataModule2.top.Insert;
dbgrid1.SetFocus;
end;

procedure Ttopicform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      DBGrid1.Options:=DBGrid1.Options-[dgediting];
end;

end.
