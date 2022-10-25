unit basemanipulation;

interface

uses database, System.SysUtils, System.Types, ComCtrls;

type
  Tgrademanipulation = class

    private
      _potcount: string;
      _percent: string;
      //_space: TRect;
      DM: TDataModule2;
      reccount: integer;
      pc: integer;

    public
      //operation: byte;
      property potcount: string read _potcount;
      property percent: string read _percent;
      procedure searchandcor(add:boolean; field, word:string);
      procedure calcProgress;
      //function drawPot: TProgressBar;
      constructor Create(_DM: TDataModule2);


  end;

implementation

{function Tgrademanipulation.drawPot: TProgressBar;
var
  intermed: TProgressBar;
begin
    intermed.Max:=reccount * 6;
    intermed.Position:=pc;
    result:=intermed;
end;    }

procedure Tgrademanipulation.calcProgress;
var
  answerscount: integer;

  percentNum: integer;
begin
    DM.potential.Active:=false; DM.potential.Active:=true;
    answerscount := DM.dspotential.DataSet.Fields[0].AsInteger;
    reccount := DM.selectsel.RecordCount;
    pc := reccount * 6 - answerscount;
    percentNum := trunc (pc / (reccount * 6) * 100);
    _potcount := IntToStr(pc);
    _percent := IntToStr(percentNum);

end;

constructor Tgrademanipulation.Create(_DM: TDataModule2);
begin
    DM:=_DM;
    //_space:=space;
    calcprogress;
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
