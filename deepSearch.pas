unit deepSearch;


interface
uses database, strUtils, basemanipulation;
function deepSeek(needle: string): integer;

implementation
uses unit1;
function deepSeek(needle: string): integer;
var
    haystack:string;

function seeking(field: byte):integer;
var recnum:integer;
    no:integer;
begin
   with DataModule2.vokab do
   begin
      DataModule2.dropspot.ExecSQL;
      form1.seekBar.Max:=recordcount-1;
      for recnum := 0 to recordcount-1 do
      begin
          form1.seekBar.stepIt;
          haystack:=fields[field].asString;
          if AnsiContainsStr(haystack, needle) then
            //break
            begin
              edittable(true);
              edit;
              FieldByName('spot').AsBoolean:=true;
              no:=recno;
              post;
              recno:=no;
              edittable(false);
              next;
            end
          else
             if not(findnext) then
             first
      end;
      result:=recnum;
   end;

end;

begin
    if not(needle='') then

    if ord(needle[1])<128 then //latin
      result:=seeking(2) else
      result:=seeking(1);
end;

end.
