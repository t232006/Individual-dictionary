unit dataform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, database, StdCtrls, DBCtrls, Buttons, remproc, Grids, DBGrids, thread1,
  Data.DB, Bde.DBTables;

type
  Tdataformm = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    dateq: TQuery;
    dsdateq: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataformm: Tdataformm; datetr:Tdatethread;

implementation

uses  unit1;

{$R *.dfm}


procedure Tdataformm.FormShow(Sender: TObject);
begin
    tag:=0;
    if Form1.checkbox1.Checked then
    if dateq.SQL.Count=2 then dateq.SQL.Insert(1,'where usersel=true') else
    if dateq.sql.Count=3 then dateq.sql.delete(1);
    dateq.Close;
    dateq.open;


end;

procedure Tdataformm.BitBtn1Click(Sender: TObject);
var im:byte;
    myday:TDate;
    Smyday:string;

begin

    with datamodule2 do
    begin
      topicquerly.SQL.Add('(');
      for im := 0 to dbgrid1.selectedrows.Count-1 do
        begin
          dbgrid1.DataSource.DataSet.GotoBookmark(pointer(dbgrid1.selectedrows.items[im]));
          myday:=dateq.Fields[0].AsDateTime;
          smyday:=datetostring(myday);//вставляет нужный разделитель
          datamodule2.topicquerly.SQL.Add('DateRec= '''+smyday +'''');
          datamodule2.topicquerly.SQL.Add('or');


        end;
      topicquerly.SQL.Delete(topicquerly.SQL.Count-1);//удаляем крайний and
      topicquerly.SQL.Add(')');
    end;
 end;

procedure Tdataformm.BitBtn3Click(Sender: TObject);
var  da:Tdate; r:word;
begin
   with datamodule2.vokab do
   begin
    edittable(true);
    first;
    while not(eof) do
    begin
      da:=int(fieldbyname('daterec').asdatetime);
      edit;
      fieldbyname('daterec').asdatetime:=da;
      next;
    end;
        edittable(false);


   end;
  { dateq.SQL:=memo1.Lines;
   dateq.open; }

end;

procedure Tdataformm.DBGrid1TitleClick(Column: TColumn);
begin
   with dateq do
   begin
    if tag<>0 then sql.Delete(sql.Count-1);
    if (tag=1) or (tag=0) then
    begin
      sql.add('order by daterec desc');
      tag:=2;
    end else
    begin
      sql.add('order by daterec ');
      tag:=1;

    end;
    open;
    // memo1.Lines:=sql;



   end;


end;

end.
