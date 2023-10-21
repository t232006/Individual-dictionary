unit ToExcelUnit;

interface
uses comobj, database;
procedure ToExcel;

implementation

procedure ToExcel;
var sa, sh, ij:variant;
begin
  sa:=createOLEobject('excel.application');
  sa.workbooks.add;
  sa.visible:=true;
  sh:=sa.workbooks[1].worksheets[1];
  with DataModule2.vokab do
  begin
      //sh.name:=FieldByName('topic').AsString;
      sh.columns[2].columnwidth:=60;
      sh.columns[3].columnwidth:=60;
      sh.columns[4].columnwidth:=40;
      sh.columns[5].columnwidth:=50;
      first;
      ij:=2;
      sh.cells[1,2]:='слово';
      sh.cells[1,3]:='перевод';
      sh.cells[1,4]:='дата';
      sh.cells[1,5]:='тема';
      sh.cells[1,6]:='искалось';
      while not(eof) do
      begin
          sh.cells[ij,2]:=FieldByName('word').AsString;
          sh.cells[ij,3]:=FieldByName('translate').AsString;
          sh.cells[ij,4]:=FieldByName('daterec').AsString;
          sh.cells[ij,5]:=FieldByName('topic').AsString;
          sh.cells[ij,6]:=FieldByName('seeked').AsString;
          next;
          inc(ij);
      end;

  end;

end;

end.
