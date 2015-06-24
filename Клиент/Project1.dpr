program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Unit2 in 'Unit2.pas' {cardForm},
  Unit3 in 'Unit3.pas' {driversForm},
  Unit4 in 'Unit4.pas' {driversAddForm},
  Unit5 in 'Unit5.pas' {viewForm},
  Unit6 in 'Unit6.pas' {counterAddForm},
  Unit7 in 'Unit7.pas' {filterForm},
  Unit8 in 'Unit8.pas' {listForm},
  Unit9 in 'Unit9.pas' {loginForm},
  Unit10 in '..\..\..\����� ����� (2)\Unit10.pas' {adminForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TcardForm, cardForm);
  Application.CreateForm(TdriversForm, driversForm);
  Application.CreateForm(TdriversAddForm, driversAddForm);
  Application.CreateForm(TviewForm, viewForm);
  Application.CreateForm(TcounterAddForm, counterAddForm);
  Application.CreateForm(TfilterForm, filterForm);
  Application.CreateForm(TlistForm, listForm);
  Application.CreateForm(TadminForm, adminForm);
  Application.Run;
end.
