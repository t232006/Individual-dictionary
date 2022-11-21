unit deepSearch;


interface
uses database, strUtils;
function deepSeek(needle: string): integer;

implementation
function deepSeek(needle: string): integer;
var
    haystack:string;

function seeking(field: byte):integer;
var recnum:integer;
begin
   with DataModule2.vokab do
   begin
     //first;
      for recnum := 0 to recordcount-1 do
      begin
          haystack:=fields[field].asString;
          if AnsiContainsStr(haystack, needle) then
            break
          else
             if not(findnext) then
             first
      end;
      result:=recnum;
   end;

end;

begin
    if ord(needle[1])<128 then //latin
      result:=seeking(2) else
      result:=seeking(1);
end;

end.
