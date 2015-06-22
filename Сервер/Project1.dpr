program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  md5 in '..\..\..\Новая папка (2)\md5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
