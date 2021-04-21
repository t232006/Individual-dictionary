program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  lesson4;

var s:string;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
     readln(s);
     writeln(apostr(s));
     readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
