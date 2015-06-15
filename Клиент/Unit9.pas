unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TloginForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginForm: TloginForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TloginForm.FormCreate(Sender: TObject);
begin
Edit1.Text := '';
Edit2.Text := '';
Button1.Caption := 'OK';
Button2.Caption := 'Выход';
end;

procedure TloginForm.Button1Click(Sender: TObject);
begin
mainForm.Visible := true;
mainForm.Client1.Socket.SendText('#login'+edit1.Text+';'+edit2.Text);
loginForm.Visible := false;
end;

end.
