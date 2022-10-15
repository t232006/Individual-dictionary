unit addnewword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, database, StdCtrls, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  Menus;

type
  Taddneword = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit2Enter(Sender: TObject);
    procedure LabeledEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function fraza(sl:string):boolean;
  end;

var
  addneword: Taddneword;

implementation

uses DB, DBTables, dialogtopic, lessons, Unit1;

{$R *.dfm}

function Taddneword.fraza(sl:string):boolean; //отвечает фраза ли это или слово
var j,z:byte;
begin
      z:=0;
     for j:=0 to length(sl)-1 do
     begin
      if sl[j]=' ' then inc(z);
      if z>=3 then        //3 пробела - 4 словая
        begin
          fraza:=true;
          break;
        end else fraza:=false;
     end;
end;

procedure Taddneword.BitBtn1Click(Sender: TObject);
begin
  try
  edittable(true);
  with DataModule2.vokab do
  begin
    Insert;
    Fields[1].AsString:=LabeledEdit1.Text;
    Fields[2].AsString:=LabeledEdit2.Text;
    fields[3].AsInteger:=DBLookupComboBox1.KeyValue;
    Fields[4].AsDateTime:=date;
    if (fraza(labelededit2.Text) and fraza(labelededit1.Text)) then
    FieldByName('fraza').AsBoolean:=true;
    Post;
    LabeledEdit1.Text:='';
    LabeledEdit2.Text:='';
    LabeledEdit2.SetFocus;
    edittable(false);
  end;
  except
    DataModule2.vokab.Delete;
    edittable(false);
    addneword.Close;
    form1.WindowState:=wsMaximized;
  end;
  

end;


procedure Taddneword.Label2Click(Sender: TObject);
begin
  topicform.showmodal;
end;

procedure Taddneword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    form1.WindowState:=wsMaximized;
end;

procedure Taddneword.LabeledEdit2Change(Sender: TObject);
begin
  label3.Caption:=inttostr(255- LabeledEdit2.GetTextLen);
end;

procedure Taddneword.LabeledEdit2Enter(Sender: TObject);
Var
KK : HKL;
  KBid : Integer;
Const
  USKeyboard = 1033;
  RusKeyboard = 1049;
begin
  KK := GetKeyboardLayout(0);
  KBid := LOWORD(KK);
  If KBid <> USKeyboard Then
    ActivateKeyboardLayout(HKL_NEXT, 0);
end;

procedure Taddneword.LabeledEdit1Change(Sender: TObject);
begin
    label4.Caption:=inttostr(255- LabeledEdit1.GetTextLen);
end;


procedure Taddneword.LabeledEdit1Enter(Sender: TObject);
Var
KK : HKL;
  KBid : Integer;
Const
  USKeyboard = 1033;
  RusKeyboard = 1049;
begin
  {KK := GetKeyboardLayout(0);
  KBid := LOWORD(KK);
  If KBid = USKeyboard Then
    ActivateKeyboardLayout(HKL_NEXT, 0);   }
    LoadKeyboardLayout('00000419',KLF_ACTIVATE)
end;

end.
