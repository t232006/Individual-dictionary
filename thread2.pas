unit thread2;

interface

uses
  SysUtils, Classes, Controls, Forms;

type
  synchthread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure synchprocess;
  end;

implementation


uses  unit1, database, dataform;

procedure synchthread.Execute;
begin
     synchronize(synchprocess)
end;


procedure synchthread.synchprocess;
var k,k1:word;
    //tempbook:Tbookmark;
begin
  with form1 do
  begin
      dbgrid2.DataSource.DataSet.DisableControls;
      gauge2.Visible:=true;
      Gauge2.MaxValue:=DBGrid2.SelectedRows.Count-1;
      with DataModule2.vokab do
      begin
        Active:=false;
        ReadOnly:=false;
        Active:=true;
      end;

      //datamodule2.vokab.ReadOnly:=false;
      for k:=0 to DBGrid2.SelectedRows.Count-1 do
        begin
          with DataModule2 do
          begin

            if DBGrid2.Tag=1 then break; //condition of stopping the process
            vokab.Insert;
            dbgrid2.DataSource.DataSet.GotoBookmark(pointer(dbgrid2.SelectedRows.items[k]));
            vokab.Fields[1].AsString:=synch.Fields[0].AsString;
            vokab.Fields[2].AsString:=synch.Fields[1].AsString;
            if top.FindKey([synch.Fields[2].AsString])=false then //topic doesn't exist
            begin
              top.Append; //
              top.fields[1].AsString:=synch.Fields[2].AsString; //add into top
              top.Post;
            end;
            vokab.Fields[3].AsInteger:=top.Fields[0].AsInteger;//pass key to vokab

            vokab.Fields[4].AsDateTime:=synch.Fields[3].AsDateTime;
            vokab.Fields[5].AsInteger:=synch.Fields[5].AsInteger;
            vokab.Fields[7].AsBoolean:=false;
            vokab.Fields[9].AsBoolean:=synch.Fields[6].AsBoolean;
            vokab.Post;
            synch.Next;
            Gauge2.Progress:=k;
            Application.ProcessMessages;
            if synch.Fields[0].AsString='' then break;//additional condition - reason of mistakes
          end;

        end;

      with DBGrid2 do
      begin
     { for k:=0 to DBGrid2.SelectedRows.Count-1 do //remove selected records from left greed
        begin
          DataSource.DataSet.GotoBookmark(pointer(dbgrid2.SelectedRows.items[0]));
          //DataSource.DataSet.Delete;
          Refresh;
        end;  }


        for k1:=1 to k do //select new records
        begin
           dbgrid3.SelectedRows.CurrentRowSelected:=true;
           dbgrid3.DataSource.DataSet.Prior;
           if DBGrid2.Tag=1 then break; //condition of stopping the process
        end;



        DataSource.DataSet.First;
      while not DataSource.DataSet.Eof do //remove selection
        begin
             SelectedRows.CurrentRowSelected:=false;
             DataSource.DataSet.next;
        end;
      DataSource.DataSet.First;
      DataSource.DataSet.EnableControls;

      end;
      gauge2.Visible:=false;
      BitBtn1.Visible:=false;
      //DataModule2.synch.ExecSQL; //escape mistakes
      end;
  end;



end.
 