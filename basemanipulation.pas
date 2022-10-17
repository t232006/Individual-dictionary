unit basemanipulation;

interface

uses database, System.SysUtils, System.Types;

type
  Tgrademanipulation = class

    private
      _potcount: string;
      _percent: string;
      reccount: integer;
      DM: TDataModule2;


    public
      property potcount: string read _potcount;
      property percent: string read _percent;
      procedure searchandcor(add:boolean; field, word:string);
      procedure calcProgress;
      function drawPot(space: TRect): TRect;
      constructor Create(_DM: TDataModule2);

  end;

implementation

function Tgrademanipulation.drawPot(space: TRect): TRect;
var
  temprect: TRect;
  pc: integer;
begin
  pc:=strtoint(_percent);
  temprect := space;
  temprect.Right := round(space.Right * pc / 100);
  result := temprect;
end;

procedure Tgrademanipulation.calcProgress;
var
  answerscount: integer;
  pc: integer;
  percentNum: real;
begin
    answerscount := DM.dspotential.DataSet.Fields[0].AsInteger;
    pc := reccount * 6 - answerscount;
    percentNum := pc / reccount * 100;
    _potcount := IntToStr(pc);
    _percent := FloatToStr(percentNum);
    reccount := DM.selectsel.RecordCount;
end;

constructor Tgrademanipulation.Create(_DM: TDataModule2);
begin
    DM:=_DM;
end;

procedure Tgrademanipulation.searchandcor(add: Boolean; field: string; word: string);
begin
     with DM do
  begin
    if add then
      addball.SQL.Text:='UPDATE vokab SET rate=rate+1 WHERE (rate<7-1) and (' +field+'='''+word+''')'
    else
      addball.SQL.Text:='UPDATE vokab SET rate=rate-2 WHERE (' +field+'='''+word+''') and (rate>1)';
    addball.ExecSQL;
    calcProgress;
  end;
end;


end.
