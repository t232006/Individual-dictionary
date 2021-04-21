unit thread1;

interface

uses
  SysUtils, Classes, Controls, Forms;

type
  Tdatethread = class(TThread)
  i1:word; //to save process position
  stop:boolean;
    private
    

  protected
    
    procedure Execute; override;
    procedure dateprocess;
  end;

  

implementation

uses  unit1, database, dataform;


procedure Tdatethread.Execute;
  begin
      repeat
        if not (stop) then Synchronize(dateprocess);
      until terminated;
  end;


procedure Tdatethread.dateprocess;
var a,b:TDate; max,i:word; inde:string;
begin
 { with form1 do
  begin
    SpeedButton2.Visible:=false;
    SpeedButton3.Visible:=false;
    SpeedButton4.Visible:=false;
    SpeedButton5.Visible:=false;
    SpeedButton10.Visible:=false;
    Gauge1.Visible:=true;
  end;

  inde:=DataModule2.vokab.IndexName;
  DataModule2.vokab.IndexName:='';
  DataModule2.vokab.Refresh;
  max:=DataModule2.vokab.RecordCount;
  form1.Gauge1.MaxValue:=max;
  a:=DataModule2.vokab.fieldbyname('dateRec').AsDateTime;
  b:=a;
  //dataformm.lb.Items.Add(FormatDateTime('dd mmmm yyyy',a)+' ã.');
  for i:=i1 to max do
  begin
    Application.ProcessMessages;
    if dataformm.lb.Tag=1 then break; //stop the process
    form1.Gauge1.Progress:=i;
    DataModule2.vokab.Next;
    a:=DataModule2.vokab.fieldbyname('dateRec').AsDateTime;
    if FormatDateTime('dd mmmm yyyy',a)<>FormatDateTime('dd mmmm yyyy',b) then
      begin
      dataformm.lb.Items.Add(FormatDateTime('dd mmmm yyyy',a)+' ã.');
      b:=a;
      end;
  end;
  i1:=i;
  DataModule2.vokab.IndexName:=inde;
  if i>max then
  begin
    stop:=true;
    dataformm.BitBtn2.Hide;
    dataformm.BitBtn3.Hide;
    //datetr.Free;

  end;        }
  
end;

end.
 