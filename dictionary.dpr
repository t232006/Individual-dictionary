program dictionary;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  lessons in 'lessons.pas',
  lesson4 in 'lesson4.pas',
  database in 'database.pas' {DataModule2: TDataModule},
  addnewword in 'addnewword.pas' {addneword},
  dialogtopic in 'dialogtopic.pas' {topicform},
  dataform in 'dataform.pas' {dataformm},
  remproc in 'remproc.pas',
  frame in 'frame.pas' {Frame2: TFrame},
  helpdict in 'helpdict.pas' {Form2},
  thread2 in 'thread2.pas',
  PoBukvam in 'PoBukvam.pas',
  basemanipulation in 'basemanipulation.pas',
  cards in 'cards.pas',
  RowColorsUnit in 'RowColorsUnit.pas' {RowColors},
  coloredRowFrame in 'coloredRowFrame.pas' {ColoredRow: TFrame},
  saver in 'saver.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Individual dictionary';
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Taddneword, addneword);
  Application.CreateForm(Ttopicform, topicform);
  Application.CreateForm(Tdataformm, dataformm);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TRowColors, RowColors);
  Application.Run;

  end.
