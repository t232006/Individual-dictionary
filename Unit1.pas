unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, ComCtrls, DB, StdCtrls, DBGrids, DBTables,
  ExtCtrls, lessons, lesson4, database, DBCtrls, addnewword, dataform,
  Buttons, frame, helpdict, Mask, ActnList, ActnMan, ActnColorMaps, ImgList,
  OleCtrls, SHDocVw, Gauges, thread2, DdeMan, Menus, comobj, System.Actions;

type
  TForm1 = class(TForm)
    ColorDialog1: TColorDialog;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    StatusBar1: TStatusBar;
    Action4: TAction;
    FontDialog1: TFontDialog;
    Action5: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Gauge1: TGauge;
    canedit: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    lb: TLabel;
    Image1: TImage;
    Image2: TImage;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button3: TButton;
    search: TLabeledEdit;
    ComboBox1: TComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    rg: TRadioGroup;
    CheckBox1: TCheckBox;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    rg1: TRadioGroup;
    st1: TStaticText;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    st2: TStaticText;
    rg2: TRadioGroup;
    TabSheet4: TTabSheet;
    protv: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    st3: TStaticText;
    Edit1: TEdit;
    Button1: TButton;
    CheckBox2: TCheckBox;
    TabSheet5: TTabSheet;
    m1: TMemo;
    m2: TMemo;
    m3: TMemo;
    m4: TMemo;
    m5: TMemo;
    m6: TMemo;
    m7: TMemo;
    m8: TMemo;
    m9: TMemo;
    m10: TMemo;
    M11: TMemo;
    M12: TMemo;
    TabSheet6: TTabSheet;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Frame21: TFrame2;
    Frame22: TFrame2;
    Frame23: TFrame2;
    Frame24: TFrame2;
    Frame25: TFrame2;
    Frame26: TFrame2;
    Frame27: TFrame2;
    Frame28: TFrame2;
    Frame29: TFrame2;
    Button4: TButton;
    Frame210: TFrame2;
    Frame211: TFrame2;
    Frame212: TFrame2;
    TabSheet7: TTabSheet;
    WebBrowser1: TWebBrowser;
    TabSheet8: TTabSheet;
    DBGrid2: TDBGrid;
    od1: TOpenDialog;
    DBGrid3: TDBGrid;
    Label8: TLabel;
    spb5: TSpeedButton;
    Label9: TLabel;
    SpeedButton9: TSpeedButton;
    Action6: TAction;
    spb4: TSpeedButton;
    DBNavigator2: TDBNavigator;
    selectall: TAction;
    fromleft: TAction;
    DBNavigator3: TDBNavigator;
    Gauge2: TGauge;
    BitBtn1: TBitBtn;
    rg3: TRadioGroup;
    nil_menu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    SpeedButton10: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    sg: TStringGrid;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    StaticText1: TStaticText;
    pb: TPaintBox;
    left1: TLabel;
    left2: TLabel;
    left3: TLabel;
    left4: TLabel;
    left5: TLabel;
    left6: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    right1: TLabel;
    right2: TLabel;
    right3: TLabel;
    right4: TLabel;
    right5: TLabel;
    right6: TLabel;
    nexttack: TAction;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button2: TSpeedButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure rg1Click(Sender: TObject);
    procedure rg2Click(Sender: TObject);
    procedure InitSlovoPer;
    procedure InitPerevodSlo;
    procedure PageControl1Change(Sender: TObject);
    procedure m1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure m7DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure m7DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure m1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure searchKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure caneditClick(Sender: TObject);
    procedure stringselect(po:boolean);
    procedure InitPobukvam;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure sgDblClick(Sender: TObject);
    procedure Edit1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Frame21BitBtn1Click(Sender: TObject);
    procedure Frame22BitBtn1Click(Sender: TObject);
    procedure Frame23BitBtn1Click(Sender: TObject);
    procedure Frame24BitBtn1Click(Sender: TObject);
    procedure Frame25BitBtn1Click(Sender: TObject);
    procedure Frame26BitBtn1Click(Sender: TObject);
    procedure Frame27BitBtn1Click(Sender: TObject);
    procedure Frame28BitBtn1Click(Sender: TObject);
    procedure Frame29BitBtn1Click(Sender: TObject);
    procedure Frame21BitBtn2Click(Sender: TObject);
    procedure Frame22BitBtn2Click(Sender: TObject);
    procedure Frame23BitBtn2Click(Sender: TObject);
    procedure Frame24BitBtn2Click(Sender: TObject);
    procedure Frame25BitBtn2Click(Sender: TObject);
    procedure Frame26BitBtn2Click(Sender: TObject);
    procedure Frame27BitBtn2Click(Sender: TObject);
    procedure Frame28BitBtn2Click(Sender: TObject);
    procedure Frame29BitBtn2Click(Sender: TObject);
    procedure rgClick(Sender: TObject);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormActivate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ChangeColrigth(p:boolean);
    procedure Action4Execute(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Frame210BitBtn1Click(Sender: TObject);
    procedure Frame211BitBtn1Click(Sender: TObject);
    procedure Frame212BitBtn1Click(Sender: TObject);
    procedure Frame210BitBtn2Click(Sender: TObject);
    procedure Frame211BitBtn2Click(Sender: TObject);
    procedure Frame212BitBtn2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure spb4Click(Sender: TObject);
    procedure spb6Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    {procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);}
    procedure rg3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect2: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure nexttackExecute(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure Keynottab (var msg:TCMDialogKey); message CM_DialogKey;
    function memonumber (name:string):byte;
   // procedure mousewheelhandler(var message:Tmessage); override;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pravotv:byte;
   sl1,per1:string;  //правильные ответы (слово-перевод и номер)
  i:byte;   //ОСТОРОЖНО!
  gg:integer;
  s, filtr:string;
  koor:Tpoint;
  o:otv;
  posi:TPoint;
  f:textfile;
  kolright:word;
  synchtr:synchthread;
  posgrid:word;
  //color_backgrd, color_font,
  color_scale:TColor;
  flag:record
  press:boolean;
  x,y:integer;
  end;
  conteiner:record
  //prevtext:string;
  leftnum:byte;
  //currenttext:string;
  rightnum:byte;
  end;

implementation

uses dialogtopic;

{$R *.dfm}

function Tform1.memonumber (name:string):byte;
begin
  //poss:=pos(name, 't');
  result:=strtoint(copy(name,2,2));
end;

procedure TForm1.Keynottab (var msg:TCMDialogKey);
label lab;
begin
  if msg.Charcode<>VK_TAB then inherited;

  if (msg.CharCode=VK_TAB) and (getKeyState(VK_CONTROL)<0) and (getKeyState(VK_SHIFT)<0) then
  with pagecontrol1 do
  begin
    SelectNextpage(false);
    Pages[ActivePageIndex].SetFocus;
    //pagecontrol1.Focused
    goto lab;
  end;
  if (msg.CharCode=VK_TAB) and (GetKeyState(VK_CONTROL)<0) then
  with pagecontrol1 do
  begin
    SelectNextPage(true);
    Pages[ActivePageIndex].SetFocus;
  end;
 lab:;
end;

procedure Tform1.ChangeColrigth(p:boolean);
begin
    if p then
         inc(kolright)
    else
        kolright:=0;
    case kolright mod 10 of
    1:    StatusBar1.Panels[2].Text:='безошибочная серия '+inttostr(kolright)+' слово';
    2..4: StatusBar1.Panels[2].Text:='безошибочная серия '+inttostr(kolright)+' слова';
    else StatusBar1.Panels[2].Text:='безошибочная серия '+inttostr(kolright)+' слов';
    end;
end;




procedure Tform1.stringselect(po:boolean);
begin
if po then
  begin
    DBGrid1.Options:=DBGrid1.Options-[dgRowSelect];
    DBGrid1.Options:=DBGrid1.Options+[dgEditing];
  end
else
  begin
    DBGrid1.Options:=DBGrid1.Options+[dgRowSelect];
    DBGrid1.Options:=DBGrid1.Options-[dgEditing];
  end;
end;

procedure Tform1.InitSlovoPer;
var k:byte;
begin
  slovoper(o,pravotv);
  st1.Caption:=o[0].slovo;
  Rg1.ItemIndex:=-1;
  //try st1.SetFocus;
  //finally
  for i:=0 to 5 do
  begin
    //rg1.Buttons[i].WordWrap:=true;
    rg1.Items[i]:=o[i+1].perevod;
  end;
end;// end;

procedure Tform1.InitPerevodSlo;
begin
  PerevodSlo(o,pravotv);
  st2.Caption:=o[0].perevod;
  Rg2.ItemIndex:=-1;
  //try st2.SetFocus;
  //finally
    for i:=0 to 5 do
    begin
     // rg2.Buttons[i].WordWrap:=true;
      Rg2.Items[i]:=o[i+1].slovo;
    end;

end; //end;

procedure TForm1.InitPobukvam;
var ii,jj:byte;
begin
    writeslovo(gg,sl1,per1);//загаданные слово и перевод
    pobukvam(per1);
    for jj:=0 to sg.RowCount-1 do
    for ii:=0 to sg.ColCount-1 do
      if  (sg.colcount*jj+ii)<length(bmas) then SG.Cells[ii,jj]:=bmas[sg.colcount*jj+ii]
      else SG.Cells[ii,jj]:='';
  if not(CheckBox2.Checked) then st3.Caption:=sl1;//писать, если не стоит галочка

end;



procedure TForm1.rg1Click(Sender: TObject);
begin
  if pravotv-1=Rg1.ItemIndex then
  begin
    try
      Memo1.Font.Color:=clgreen;
      Memo1.Clear;
      With Memo1.Lines do
      begin
        Add('правильно:');
        Add(st1.Caption);
        Add('  →  ');
        Add(rg1.Items[rg1.ItemIndex]);
      end;
    except

    end;
    searchandcor(true,'word',o[0].slovo);
    ChangeColrigth(true); //пишет в статусе
    InitSlovoPer;
  end else
  begin
    Memo1.Clear;
    Memo1.font.Color:=clred;
    With Memo1.Lines do
    begin
      Add('неправильно:');
      Add(rg1.Items[rg1.ItemIndex]);
      Add(' → ');
      Add(o[rg1.ItemIndex+1].slovo);
    end;
    //l1.Caption:='неправильно';
    searchandcor(false,'word',o[0].slovo);
    ChangeColrigth(false); //пишет в статусе
  end;
  rg1.ItemIndex:=-1;

end;

procedure TForm1.PageControl1Change(Sender: TObject);
var t,t1:byte; //parentcontrol:TWinControl;
begin
//    statusbar1.panels[0].Text:='Всего слов: '+inttostr(DataModule2.vokab.RecordCount);
//  DataModule2.topicquerly.SQL.Text:='UPDATE vokab SET usersel=true';//если слова не выбраны, то выбрать все слова}
  case  PageControl1.ActivePageIndex of
  0:
  begin
    edittable(true);
    edittable(false); //обновление таблицы
  end;
  1:
  begin
      read1(6);
      InitSlovoPer;
  end;
  2:
  begin
    read1(6);
     InitPerevodSlo;
  end;
  3:
  begin
    read1(1);
    InitPobukvam;
  end;
  4:
  begin
    read1(6);
    sootv; //заполняет 2 массива ответами
    for t:=1 to 6 do
    begin
        TMemo(FindComponent('m'+IntToStr(t))).lines.text:=o1[t].slovo;
        TMemo(FindComponent('m'+IntToStr(t+6))).lines.text:=o2[t].perevod;
    end;
    for t:=1 to 12 do
        begin
        TMemo(FindComponent('m'+IntToStr(t))).font.style:=TMemo(FindComponent('m'+IntToStr(t))).font.style-[fsstrikeout];
        TMemo(FindComponent('m'+IntToStr(t))).Color:=clWindow;
        end;
  end;
  5:
  begin
    if DataModule2.selectsel.RecordCount<12 then
    begin
      t1:=9;
      Frame210.Visible:=false;
            Frame211.Visible:=false;
                  Frame212.Visible:=false;
    end
       else
    begin
       t1:=12;//12 карточек или 9
       Frame210.Visible:=true;
            Frame211.Visible:=true;
                  Frame212.Visible:=true;
    end;

    read1(t1);
    card(t1);
    for t:=1 to t1 do
    begin
        //parentcontrol:=(TFrame(FindComponent('frame2'+inttostr(t))));
        if rg3.ItemIndex=0 then
        begin
        {(parentcontrol.FindComponent('panel2') as tmemo).Lines.Text:=o1[t].perevod;
        (parentcontrol.FindComponent('panel2') as tmemo).Hide;
        (parentcontrol.FindComponent('panel1') as tmemo).Lines.Text:=o1[t].slovo;}
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.lines.text:=o1[t].perevod;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.hide;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel1.lines.text:=o1[t].slovo;

        end else
        begin
        {(parentcontrol.FindComponent('panel2') as tmemo).Lines.Text:=o1[t].slovo;
        (parentcontrol.FindComponent('panel2') as tmemo).Hide;
        (parentcontrol.FindComponent('panel1') as tmemo).Lines.Text:=o1[t].perevod;}
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.lines.text:=o1[t].slovo;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel2.hide;
        (FindComponent('frame2'+inttostr(t))as tframe2).panel1.lines.text:=o1[t].perevod;
        end;


        TFrame(FindComponent('frame2'+inttostr(t))).FindChildControl('bitbtn1').Enabled:=true;
        //TFrame(FindComponent('frame2'+inttostr(t))).FindChildControl('panel2').visible:=false;
    end;
  end;
  6:
  begin
    WebBrowser1.Navigate(ExtractFileDir(Application.ExeName)+'\словарь.htm');
  end;
  
  end;
end;

procedure TForm1.rg2Click(Sender: TObject);
  begin
  if pravotv-1=Rg2.ItemIndex then
  begin
    try
      Memo2.Font.Color:=clgreen;
      Memo2.Clear;
      With Memo2.Lines do
      begin
        Add('правильно:');
        Add(st2.Caption);
        Add('  →  ');
        Add(rg2.Items[rg2.ItemIndex]);
      end;
    except

    end;
    searchandcor(true,'translate',o[0].perevod);
    ChangeColrigth(true); //пишет в статусе
    InitPerevodSlo;
  end else
  begin
    Memo2.Clear;
    Memo2.font.Color:=clred;
    With Memo2.Lines do
    begin
      Add('неправильно:');
      Add(rg2.Items[rg2.ItemIndex]);
      Add(' → ');
      Add(o[rg2.ItemIndex+1].perevod);
    end;
    //l1.Caption:='неправильно';
    searchandcor(false,'translate',o[0].perevod);
    ChangeColrigth(false); //пишет в статусе
  end;
  rg2.ItemIndex:=-1;
end;

procedure TForm1.m1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var ch:char; na:byte;
begin
   if not (fsstrikeout in (sender as Tmemo).Font.Style) then
  begin
    (sender as Tmemo).BeginDrag(false,15); //перенос после 15 пик
    //ch:=chr(9);
    //if not(left1.Visible) then
    na:=memonumber(Tmemo(sender).Name);

    if na>6 then
      begin
      if left1.Visible then //2nd colunm and 1st selection
        begin
          ch:=chr(9);
          formkeypress(sender,ch);
        end;
      na:=memonumber(Tmemo(sender).Name)-6;
      end else
      if not(left1.Visible) then //1st colunt and 2nd selection
        begin
          ch:=chr(9);
          formkeypress(sender,ch);
          na:=memonumber(Tmemo(sender).Name);
        end;
    ch:=inttostr(na)[1];
    formkeypress(sender,ch);

  end;
end;

procedure TForm1.m7DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     (sender as Tmemo).BeginDrag(true,-1);
end;

//-------------------------------------------------------
procedure TForm1.m7DragDrop(Sender, Source: TObject; X, Y: Integer);
var komp:byte;
begin
  komp:=strtoint(copy((sender as tmemo).Name,2,2));
  if source<>sender then //чтобы не закидывать в себя
  if ((source as tmemo).Lines.Text=o2[komp-6].slovo) then
  begin
    (sender as tmemo).Lines.Text:=o2[komp-6].slovo+ ' = ' +(sender as tmemo).Lines.Text;
    (source as tmemo).Lines.Text:='';
    // (source as tmemo).Color:=clMoneyGreen;
      (sender as tmemo).Color:=clMoneyGreen;
    searchandcor(true,'word',o2[komp-6].slovo); //если правильно,добавить балл
    ChangeColrigth(true);
  end else
  begin
    (sender as tmemo).Lines.Text:=(sender as tmemo).Lines.Text+' = '+(source as tmemo).Lines.Text;
    (source as tmemo).Lines.Text:='';
    (sender as tmemo).Font.Style:=(source as tmemo).Font.Style+[fsstrikeout];
     //(source as tmemo).Color:=clMoneyGreen;
    (sender as tmemo).Color:=8421631;

    determ; determ; //нужно вычесть 2 очка всем
    ChangeColrigth(false);
  end;
    pb.Canvas.FillRect(pb.Canvas.ClipRect);
    button2.Visible:=true;

end;


//-----------------------------------------------------------

procedure TForm1.m1DragDrop(Sender, Source: TObject; X, Y: Integer);
var komp:byte;
begin
    komp:=strtoint(copy((sender as tmemo).Name,2,2));//номер компонента (без имени)
    if source<>sender then //чтобы не закидывать в себя
    if ((source as tmemo).Lines.Text=o1[komp].perevod) then
  begin
      (sender as tmemo).Lines.Text:=(sender as tmemo).Lines.Text+' = '+o1[komp].perevod;
      (source as tmemo).Lines.Text:='';
     // (source as tmemo).Color:=clMoneyGreen;
      (sender as tmemo).Color:=clMoneyGreen;

      searchandcor(true,'translate',o1[komp].perevod);//добавить 1 балл
      ChangeColrigth(true);
  end else
  begin
    (sender as tmemo).Lines.Text:=(sender as tmemo).Lines.Text+' = '+(source as tmemo).Lines.Text;
    (source as tmemo).Lines.Text:='';
    (sender as tmemo).Font.Style:=(source as tmemo).Font.Style+[fsstrikeout];
    //(source as tmemo).Color:=clMoneyGreen;
    (sender as tmemo).Color:=8421631;

    determ; determ; //нужно вычесть 2 очка всем
          ChangeColrigth(false);
  end;
       pb.Canvas.FillRect(pb.Canvas.ClipRect);
       button2.Visible:=true;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  {AutoSize:=false;
  while Height>200 do
  begin
    height:=height-10;
    Width:=width-20; left:=left+20;
    sleep(5);} WindowState:=wsMinimized;
  //end;
  addneword.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
with DataModule2 do
begin
vokab.Close;
top.Close;
topicquerly.SQL.Clear;
end;
Rewrite(f);
writeln(f,inttostr(dbgrid1.Font.Size));
writeln(f,inttostr(  dbgrid1.Font.color));
writeln(f,inttostr(  dbgrid1.color));
writeln(f,inttostr(color_scale));
writeln(f,inttostr(Frame21.Panel1.Color ));

writeln(f,inttostr(Frame21.Panel1.Font.Color  ));
writeln(f,inttostr(Frame21.Panel1.Font.size  ));
writeln(f,(Frame21.Panel1.Font.name  ));

writeln(f,inttostr(Frame21.Panel2.Font.Color  ));
writeln(f,inttostr(Frame21.Panel2.Font.size  ));
writeln(f,(Frame21.Panel2.Font.name  ));
writeln(f,booltostr(n5.Checked));
writeln(f,booltostr(n6.Checked));


closefile(f);
end;





procedure TForm1.searchKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key)<128 then
  DataModule2.vokab.IndexName:='transind' else //если русская буква
  DataModule2.vokab.IndexName:='wordind'; //если латинская буква

  if (DataModule2.vokab.FindKey([search.Text]))=false then
  DataModule2.vokab.FindNearest([search.Text]);
  {DataModule2.vokab.SetKey;
  DataModule2.vokab.FieldByName('translate').AsString:=;
  if (DataModule2.vokab.GotoKey)=false then DataModule2.vokab.GotoNearest;
  // Filter:='word ='+ +'*';}
end;

procedure TForm1.ComboBox1CloseUp(Sender: TObject);
begin
with DataModule2.topicquerly do
begin
  if SQL.Text<>'update vokab set usersel=true where'#$D#$A
  then if CheckBox1.Checked then SQL.Add('and')//для добавления сложных условий
  else SQL.Add('or');
  case combobox1.ItemIndex of
    0: SQL.Add('rate<6');
    1: SQL.Add('rate>0');
    2: dataformm.showmodal;
    3: topicform.showmodal;
    4: begin
        SQL.text:='update vokab set usersel=true where';
        DataModule2.dropch.ExecSQL;
       end;
  end;

  case rg.ItemIndex of //apartly about phrases
    0: SQL.Add('and fraza = false');
    1: SQL.Add('and fraza = true');
  end;

  if SQL.Text<>'update vokab set usersel=true where'#$D#$A
                     then try
                     DataModule2.dropch.ExecSQL;
                     ExecSQL;
  except sql.Delete(sql.Count-1);
  end;
end;
DataModule2.vokab.Refresh;
Action3Execute(sender);
DBGrid1.SetFocus;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
 if column.FieldName='usersel' then
  begin
    edittable(true);

    DataModule2.vokab.Edit;
    if DataModule2.vokab.fields[7].AsBoolean=true then
    DataModule2.vokab.Fields[7].AsBoolean:=false
     else
    DataModule2.vokab.Fields[7].AsBoolean:=true;
    DataModule2.vokab.Post;
        edittable(false);
        {stringselect(false); //чтобы можно было нажимать несколько раз
        stringselect(true);}
   Action3Execute(column);
  end;
end;






procedure TForm1.caneditClick(Sender: TObject);
begin
  //stringselect(canedit.down);
  if canedit.Down then DBGrid1.options := DBGrid1.options +[dgediting] else
DBGrid1.options := DBGrid1.options -[dgediting];
  edittable(canedit.Down);
  DBGrid1.SetFocus;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  if per1=trim(edit1.Text) then
    begin
      Label1.Caption:='правильно';
      searchandcor(true,'word',sl1);
      ChangeColrigth(true); //пишет в статусе
      InitPobukvam;
      Edit1.Text:='';
    end else
    begin
      Label1.Caption:='неправильно';
      searchandcor(false,'word',sl1);
      searchandcor(false,'word',sl1); //вычесть 2 балла
      edit1.Text:=per1; //написать правильный ответ
      ChangeColrigth(false); //пишет в статусе
    end;
    edit1.SetFocus;

end;



procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=13 then Button1Click(sender);
end;

procedure TForm1.sgDblClick(Sender: TObject);
//var ac,ar:integer;
begin
    if length(sg.Cells[posi.x,posi.y])>1 then //если фраза,то пробел
    Edit1.Text:=edit1.Text+s+' ' else
    Edit1.Text:=edit1.Text+s;
    sg.Cells[posi.X,posi.Y]:='';
end;

procedure TForm1.Edit1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if length(sg.Cells[posi.x,posi.y])>1 then //если фраза,то пробел
    Edit1.Text:=edit1.Text+s+' ' else
    Edit1.Text:=edit1.Text+s;
  sg.Cells[posi.x,posi.Y]:='';

end;

procedure TForm1.sgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sg.MouseToCell(x,y,posi.x,posi.y);
  s:=trim(sg.Cells[posi.x,posi.y]);
  //sg.DragMode:=dmmanual;
  sg.BeginDrag(false,-1);
  //  sg.DragMode:=dmAutomatic;
end;

procedure TForm1.Edit1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if (source is TStringGrid) then
  begin
    accept:=true;
    //BeginDrag(false,-1);

    DragCursor:=crUpArrow;
  end  else
  begin
    accept:=false;
    //DragMode:=dmManual;
    BeginDrag(false,-1);

    edit1.SetFocus;
    DragCursor:=crDefault;

  end;
end;





procedure TForm1.Frame21BitBtn1Click(Sender: TObject);
begin
  searchandcor(true,'word',o1[1].slovo);
  frame21.Panel2.Visible:=true;
  ChangeColrigth(true);
end;

procedure TForm1.Frame22BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[2].slovo);
  frame22.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame23BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[3].slovo);
  frame23.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame24BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[4].slovo);
  frame24.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame25BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[5].slovo);
  frame25.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame26BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[6].slovo);
  frame26.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame27BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[7].slovo);
  frame27.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame28BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[8].slovo);
  frame28.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame29BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[9].slovo);
  frame29.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame21BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[1].slovo);
  frame21.Panel2.Visible:=true;
  frame21.BitBtn1.Enabled:=false;
    ChangeColrigth(false);
end;

procedure TForm1.Frame22BitBtn2Click(Sender: TObject);
begin
     searchandcor(false,'word',o1[2].slovo);
  frame22.Panel2.Visible:=true;
  frame22.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame23BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[3].slovo);
  frame23.Panel2.Visible:=true;
  frame23.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame24BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[4].slovo);
  frame24.Panel2.Visible:=true;
  frame24.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame25BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[5].slovo);
  frame25.Panel2.Visible:=true;
  frame25.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame26BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[6].slovo);
  frame26.Panel2.Visible:=true;
  frame26.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame27BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[7].slovo);
  frame27.Panel2.Visible:=true;
  frame27.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame28BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[8].slovo);
  frame28.Panel2.Visible:=true;
  frame28.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame29BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[9].slovo);
  frame29.Panel2.Visible:=true;
  frame29.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;


procedure TForm1.rgClick(Sender: TObject);
procedure delfilt(t:boolean);
 begin

  if t then system.Delete(filtr,pos('fraza=true',filtr),10 ) else
  system.Delete(filtr,pos('fraza=false',filtr),11 );
  system.Delete(filtr,pos('and',filtr),4);

 end;


begin
  with DataModule2.vokab do
  begin
  filtr:=Filter; //отдали полномочия
  //Filtered:=true;
  if rg.ItemIndex=0 then
  begin
      delfilt(true);
      if trim(filtr)<>''  then //если уже что-то есть
       filtr:=filtr+ ' and fraza=false' else
      filtr:='fraza=false'
  end else

  if rg.ItemIndex=1 then
  begin
      delfilt(false);
      if trim(filtr)<>'' then //если уже что-то есть
      filtr:=filtr+ ' and fraza=true' else
      filtr:='fraza=true'
  end else
  begin

  delfilt(true);
  delfilt(false);



  end;
    DataModule2.vokab.filter:=filtr; ////забрали полномочия
    
  end;

end;

procedure TForm1.FormConstrainedResize(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
  MaxWidth:=1201; MaxHeight:=780;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     form1.WindowState:=wsMaximized;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin

  if CheckBox1.Checked then
  begin
    DataModule2.vokab.Filter:='usersel=true';
    rgClick(sender);
    lb.Visible:=true;
    lb.Font.Color:=clblue;
    lb.Caption:='операция И';
    Image1.Visible:=true;
    Image2.Visible:=false;
  end else
  begin
    DataModule2.vokab.Filter:='';
    rgClick(sender);
    lb.Visible:=true;
    lb.Font.Color:=clMaroon;
    lb.Caption:='операция ИЛИ';
    Image2.Visible:=true;
    Image1.Visible:=false;

  end;
  DataModule2.vokab.Filter:=filtr;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
DBGrid1.Font.Size:=DBGrid1.Font.Size+2;

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
if DBGrid1.Font.Size>5 then DBGrid1.Font.Size:=DBGrid1.Font.Size-2;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
if ColorDialog1.Execute then DBGrid1.Color:=ColorDialog1.Color;

//label7.Caption:=inttostr(ColorDialog1.Color);
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if canedit.Down then canedit.Down:=false else canedit.Down:=true;
  caneditClick(sender);
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  with DataModule2.selectsel do
  begin
    Open;// ExecSQL;
    statusbar1.Panels[1].text:='Выделено слов: '+ inttostr(RecordCount);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var sf:string; fk:1..12;
begin
  assignfile(f,'init.ini');
  reset(f);
  readln(f,sf);
  dbgrid1.Font.size:=strtoint(sf);
  readln(f,sf);
  dbgrid1.Font.color:=strtoint(sf);
  readln(f,sf);
  dbgrid1.color:=strtoint(sf);
  readln(f,sf);
  color_scale:=strtoint(sf);
  readln(f,sf);
   for fk:=1 to 12 do
   begin
   {(FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Color:=strtoint(sf);
   (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Color:=strtoint(sf);}
    (FindComponent('frame2'+inttostr(fk)) as tframe2).panel.color:= strtoint(sf);
   end;
  readln(f,sf);
  for fk:=1 to 12 do
    (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.Color:=strtoint(sf);

  readln(f,sf);
    for fk:=1 to 12 do
    (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.size:=strtoint(sf);

   readln(f,sf);
    for fk:=1 to 12 do
    (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.name:=sf;

    readln(f,sf);
  for fk:=1 to 12 do
    (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.Color:=strtoint(sf);

  readln(f,sf);
    for fk:=1 to 12 do
    (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.size:=strtoint(sf);

   readln(f,sf);
    for fk:=1 to 12 do
    (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.name:=sf;

   readln(f,sf);
   n5.Checked:=StrToBool(sf);

   readln(f,sf);
   n6.Checked:=StrToBool(sf);

  //-------------------------------
  Action3Execute(sender);

PageControl1Change(sender);
posgrid:=0;
if (Screen.Width<form1.Width) or (Screen.Height<form1.Height)
then form1.BorderStyle:=bsSizeable;

end;



procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
procedure rectt (col:Tcolor; var tecomp:Tmemo); //draws green bevel
begin
    with tecomp do
    begin
      pb.canvas.pen.color:=col;
      pb.canvas.Pen.Width:=9;
      pb.canvas.Rectangle(left,top,left+Width,top+height);
      tag:=col;
    end;
end;

procedure radiorect (order:byte; var tecomp:Tmemo);
var j:byte;
begin
  for j := order to order+5 do        {round(0.08*order)*6 to use 1,2,3}
  begin                           {for memo 4,5,6}
    if j-round(0.08*order)*6<>strtoint(key) then
    begin
      tecomp:=(FindComponent('m'+inttostr(j)) as tmemo);
      rectt(color, tecomp);
    end;
  end;

end;
var mem:Tmemo; charr:char;
//==================================
begin
try
  begin
  if PageControl1.ActivePageIndex=1 then
        rg1.ItemIndex:=strtoint(key)-1
    else
  if pagecontrol1.activePageIndex=2 then
        rg2.ItemIndex:=strtoint(key)-1
  else  if pageControl1.ActivePageIndex=4 then

  begin  //==============================================
case ord(key) of
49..54:
begin
  if left1.Visible then
    mem:=(FindComponent('m'+key) as tmemo) else
    mem:=(FindComponent('m'+inttostr(strtoint(key)+6)) as tmemo);

  if mem.Tag<>clmoneygreen then
  begin
    rectt(clmoneygreen,mem);
    with conteiner do
    begin
        //prevtext:=currenttext;
        {prevnum:=currentnum;
        currentnum:=memonumber(mem.Name);//strtoint(key);}
        //currenttext:=mem.Text;
        if left1.visible then
        leftnum:=memonumber(mem.Name) else
        rightnum:=memonumber(mem.Name);
    end;
  end  else
  begin
    rectt(color, mem);
    with conteiner do
    begin
      if left1.Visible then leftnum:=0 else rightnum:=0;
    end;
  end;
   {label30.Caption:=inttostr(conteiner.leftnum);
   label31.Caption:=inttostr(conteiner.rightnum);}
  if not(left1.Visible) then
  radiorect(7,mem) else
  radiorect(1,mem);
  charr:=chr(9);
  FormKeyPress(sender, charr);

end;
9:  //selects columns by bevel
begin
  if not(left1.Visible) then
  begin
    for I := 1 to 6 do
      begin
      (FindComponent('left'+inttostr(i))as Tlabel).visible:=true;
      (FindComponent('right'+inttostr(i))as Tlabel).visible:=false;
      end ;
  end else
      for I := 1 to 6 do
      begin
      (FindComponent('left'+inttostr(i))as Tlabel).visible:=false;
      (FindComponent('right'+inttostr(i))as Tlabel).visible:=true;
      end;
end;
13:
begin
    with conteiner do
    begin
      if left1.Visible then
          m7DragDrop(findcomponent('m'+inttostr(rightnum)),findcomponent('m'+inttostr(leftnum)),0,0)
    else  m1DragDrop(findcomponent('m'+inttostr(leftnum)),findcomponent('m'+inttostr(rightnum)),0,0);
    rightnum:=0; leftnum:=0;
    end;

end;
end;


  end;  //===============================================
  end;
  except  //showmessage ('идите на хуй');
//  finally

end;

end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 combobox1.itemindex:=-1;
end;


procedure TForm1.ComboBox1DropDown(Sender: TObject);
begin
ComboBox1.ItemIndex:=-1; //чтобы можно было закрыть без выбора
CheckBox1Click(sender);
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
search.SetFocus;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
if ColorDialog1.Execute then DBGrid1.font.Color :=ColorDialog1.Color;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var fk:1..12;
begin
if ColorDialog1.Execute then
  for fk:=1 to 12 do
   begin
   //(FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Color:=ColorDialog1.Color;
   (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel.Color:=ColorDialog1.Color; //.Panel2.Color:=ColorDialog1.Color;
   end;

end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var fk:1..12;
begin
 if FontDialog1.Execute then
   for fk:=1 to 12 do
   begin
     with (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font do
     begin
       Color:=fontDialog1.Font.Color;
       Name:=FontDialog1.Font.Name;
       Size:=FontDialog1.Font.Size;
       Style:=FontDialog1.Font.Style;
     end;
   end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var fk:1..12;
begin
 if FontDialog1.Execute then
   for fk:=1 to 12 do
   begin
     with (FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font do
     begin
       Color:=fontDialog1.Font.Color;
       Name:=FontDialog1.Font.Name;
       Size:=FontDialog1.Font.Size;
       Style:=FontDialog1.Font.Style;
     end;
   end;
end;

procedure TForm1.Frame210BitBtn1Click(Sender: TObject);
begin
    searchandcor(true,'word',o1[10].slovo);
  frame210.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame211BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[11].slovo);
  frame211.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame212BitBtn1Click(Sender: TObject);
begin
searchandcor(true,'word',o1[12].slovo);
  frame212.Panel2.Visible:=true;
    ChangeColrigth(true);
end;

procedure TForm1.Frame210BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[10].slovo);
  frame210.Panel2.Visible:=true;
  frame210.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame211BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[11].slovo);
  frame211.Panel2.Visible:=true;
  frame211.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.Frame212BitBtn2Click(Sender: TObject);
begin
searchandcor(false,'word',o1[12].slovo);
  frame212.Panel2.Visible:=true;
  frame212.BitBtn1.Enabled:=false;
      ChangeColrigth(false);
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked then st3.Caption:='' else st3.Caption:=sl1;
end;

procedure TForm1.Action5Execute(Sender: TObject);
begin
  if DataModule2.vokab.CanModify then
  DataModule2.vokab.Delete;
end;


procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
with DataModule2.vokab do begin
if (key= #13) and (CanModify)
then
      if DataModule2.sdvokab.State = dsedit then
      Post
      else Edit;
end;
if (key=#9) then
  DBMemo1.SetFocus;

end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
   with DataModule2.vokab do
  begin
    case column.Index of
      0: if IndexName='wordind' then IndexName:='WordIndD'
      else IndexName:='wordind';
      1: if IndexName='transind' then IndexName:='TransIndD'
      else IndexName:='transind';
      2: if IndexName='dateind' then IndexName:='DateIndD'
      else IndexName:='dateind';
      3: begin
    //
    {mousepos.canmod:=false;
    Application.CreateForm(TPopup_Menu, Popup_menu);
    popup_menu.Show;}
    {instruction for including form-menu as popup-menu:
    1) include form "popup_Menu"
    2) activate variable mousepos and type
    3) activate event "addmessage"}
          nil_menu.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
      end;
      4: if IndexName='topicind' then IndexName:='TopicIndD'
      else IndexName:='topicind';
      else DataModule2.vokab.IndexName:='';
    end;
      First;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
  var //templist:Tstringlist;
      dirbase:string;
begin
    //DBGrid2.Refresh;
if od1.Execute then
  begin
    DataModule2.synch.SQL.Clear;
    dirbase:=ExtractFilePath(od1.FileName);  //открываем
    DataModule2.synch.SQL.Add({'SELECT * FROM "'+od1.filename+'" WHERE word NOT IN (SELECT word FROM vokab)'}
    'SELECT "'+od1.filename+'".word, "'+od1.filename+'".translate, "'+dirbase+'top.db".name, "'+od1.filename+'".daterec, "'+od1.filename+'".topic, "'+od1.FileName+'".rate, "'+od1.FileName+'".fraza FROM "'+od1.filename+'" LEFT JOIN "'+dirbase+'top.db" ON "' +od1.filename+'".topic="'+dirbase+'top.db".Id WHERE word NOT IN (SELECT word FROM vokab)');
  end;
  try
    with DataModule2 do
    begin
      
      synch.Open;
      {bmove.Execute;
      synch1.Open; }
      //dbgrid4.DataSource:=DataModule2.dssynch;
    end;
    statusbar1.panels[0].Text:='Найдено новых слов: '+inttostr(DataModule2.synch.RecordCount);
  finally
  end;

end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  synchtr:=synchthread.Create(true);
  synchtr.Priority:=tpHighest;
  synchtr.FreeOnTerminate:=true;
   DBGrid2.Tag:=0; //resume
  BitBtn1.Visible:=true;
  synchtr.Resume;

end;


procedure TForm1.DBGrid2CellClick(Column: TColumn);
begin
  SpeedButton9.Enabled:=true;
  statusbar1.panels[1].Text:='Выделено слов: '+inttostr(DBGrid2.SelectedRows.Count);

end;

procedure TForm1.spb4Click(Sender: TObject);
begin
with dbgrid2.DataSource.DataSet do
begin
    first;
    while not EOF do
    begin
      DBGrid2.SelectedRows.CurrentRowSelected:=true;
      next;
    end;
end;
end;

procedure TForm1.spb6Click(Sender: TObject);
begin
    with dbgrid2.DataSource.DataSet do
begin
    first;
    while not EOF do
    begin
      DBGrid2.SelectedRows.CurrentRowSelected:=true;
      next;
    end;
end;
end;


procedure TForm1.FormPaint(Sender: TObject);
begin

   if PageControl1.ActivePageIndex=7 then
   begin
     try
     statusbar1.panels[0].Text:='Найдено новых слов: '+inttostr(DataModule2.synch.RecordCount);
     except end;
     statusbar1.panels[1].Text:='Выделено слов: '+inttostr(DBGrid2.SelectedRows.Count);
   end else
   begin
   statusbar1.panels[0].Text:='Всего слов: '+inttostr(DataModule2.vokab.RecordCount);
   statusbar1.Panels[1].text:='Выделено слов: '+ inttostr(DataModule2.selectsel.RecordCount);
   end;

end;


procedure TForm1.SpeedButton10Click(Sender: TObject);
var sa, sh, ij:variant;
begin
  sa:=createOLEobject('excel.application');
  sa.workbooks.add;
  sa.visible:=true;
  sh:=sa.workbooks[1].worksheets[1];
  with DataModule2.vokab do
  begin
      sh.name:=FieldByName('topic').AsString;
      sh.columns[2].columnwidth:=16;
      sh.columns[3].columnwidth:=16;
      first;
      ij:=2;
      sh.cells[1,2]:='слово';
      sh.cells[1,3]:='перевод';
      while not(eof) do
      begin
          sh.cells[ij,2]:=FieldByName('word').AsString;
          sh.cells[ij,3]:=FieldByName('translate').AsString;
          next;
          inc(ij);
      end;

  end;

end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   BitBtn1.Visible:=false;

   DBGrid2.Tag:=1; //suspend;
   synchtr.Terminate;
   BitBtn1.Visible:=false;
end;

procedure TForm1.DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var posgridnew:word; j:word;
begin
   with dbgrid2 do
   begin
   if SelectedRows.CurrentRowSelected then
   posgridnew:=DataSource.DataSet.RecNo;
   if   ssShift in shift  then
   if posgrid <= posgridnew then
   begin
   DataSource.DataSet.RecNo:=posgrid;
   for j:=posgrid to posgridnew-1 do
    begin
       SelectedRows.CurrentRowSelected:=true;
       DataSource.DataSet.Next;
    end;
   end else
   begin
       DataSource.DataSet.RecNo:=posgridnew;
       for j:=posgridnew to posgrid-1 do
        begin
          SelectedRows.CurrentRowSelected:=true;
          DataSource.DataSet.Next;
        end;
   end;
   posgrid:=posgridnew;
   end;
end;


procedure TForm1.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#9 then DBMemo2.SetFocus;

end;

procedure TForm1.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#9 then DBGrid1.SetFocus;

end;

procedure TForm1.rg3Click(Sender: TObject);
begin
 PageControl1Change(sender);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 DBGrid1.Height:=Form1.Height-311;
   if (search.Width<=297) and (search.Width>60) then
   begin
    search.Width:=Form1.Width-search.Left-32;
    search.Anchors:=search.Anchors-[akRight];
    search.Anchors:= search.Anchors+[akLeft];
   end else
   begin
     search.Anchors:=search.Anchors+[akRight];
     search.Anchors:=search.Anchors-[akLeft];
     if search.Left>=888 then search.Width:=61;
   end;
       if search.Left<=857 then
       begin
           CheckBox1.Left:=search.Left-120;
           CheckBox1.Top:=46;
       end else
       begin
           CheckBox1.Left:=568;
           CheckBox1.Top:=16;
       end;
end;


procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect2: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var style,rl,rr,rt,rb:integer; rect1:TRect;
begin
//-------------STRIPES-------------//
if odd(TDBGrid(sender).DataSource.DataSet.RecNo) then
TDBGrid(Sender).Canvas.Brush.Color:=TDBGrid(Sender).Canvas.Brush.Color+20;
if gdselected in state then
  begin
      TDBGrid(Sender).Canvas.Brush.Color:=clHighlight;
      TDBGrid(Sender).Canvas.Font.Color:=clHighlightText;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(rect2,datacol,column,state);
  //-------------CHECKBOXES-------------//
  if column.Field.Name='vokabusersel' then
    begin
      rr:=rect2.Right-3; rl:=rect2.Left+3; rb:=rect2.Bottom-3; rt:=Rect2.Top+3;
      rect1:=rect(rl,rt,rr,rb);
      if column.Field.AsBoolean=true then
        style:=dfcs_checked
        else style:=dfcs_buttoncheck;
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle,Rect1, DFC_BUTTON, style);
    end;
  //-------------RATES-------------//
  if column.FieldName='Rate' then
    begin
      TDBGrid(sender).Canvas.pen.Color:=TDBGrid(sender).Canvas.Brush.Color;
      TDBGrid(sender).Canvas.Rectangle(rect2);
      if N5.Checked then
        begin
          rl:=rect2.Left; rr:=rect2.Right;
          rt:=(rr-rl) div 6; //one part
          rr:=rl+rt*column.Field.AsInteger;
          TDBGrid(sender).Canvas.Brush.Color:=color_scale;
      //rect1:=rect(rect2.Left,rect2.Top,rr,rect2.Bottom);
          TDBGrid(sender).Canvas.Rectangle(rect2.Left,rect2.Top,rr,rect2.Bottom);
        end;
      if N6.Checked then
        begin
           TDBGrid(sender).Canvas.Brush.Style:=bsClear;
           TDBGrid(sender).Canvas.TextOut(rect2.Left+20,rect2.Top+3,column.Field.AsString);
        end;
    end;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
if Application.MessageBox('Вы действительно хотите обнулить все оценки?','Внимание',MB_YESNO+MB_ICONEXCLAMATION+MB_TASKMODAL)=IDYES then
     begin
      DataModule2.droprate.ExecSQL;
      DataModule2.vokab.Refresh;
     end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if ColorDialog1.Execute then color_scale:=colorDialog1.color;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
with DataModule2.vokab do
begin
  if IndexName='rateind' then IndexName:='rateindD'
  else IndexName:='rateind';
  First;
end;

end;

procedure TForm1.nexttackExecute(Sender: TObject);
begin
    PageControl1Change(sender);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  DBGrid1.Repaint;
end;


end.












