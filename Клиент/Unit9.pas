unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ScktComp;

type
  TloginForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
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
loginForm.Height := 145;
Edit1.Text := '';
Edit2.Text := '';
Button1.Caption := 'OK';
Button2.Caption := 'Выход';
Button3.Caption := 'ОК';
end;

procedure TloginForm.Button1Click(Sender: TObject);
begin
mainForm.Client1.Socket.SendText('#login'+edit1.Text+';'+edit2.Text);
end;

procedure TloginForm.Button3Click(Sender: TObject);
var IP: TStrings;
    Port: integer;
begin
//Переподключаемся к серверу
Port := mainForm.Client1.Port;
mainForm.Client1.Free;
mainForm.Client1 := TClientSocket.Create(self);
mainForm.Client1.OnConnect := mainForm.Client1Connect;
mainForm.Client1.OnError := mainForm.Client1Error;
mainForm.Client1.OnRead := mainForm.Client1Read;
mainForm.Client1.Host := edit3.Text;
mainForm.Client1.Port := Port;
mainForm.Client1.Active := true;

//Сохраняем IP-адрес сервера
IP := TStringList.Create;
IP.Add(edit3.text);
IP.SaveToFile('ip.inf');
IP.Free;
end;

procedure TloginForm.N1Click(Sender: TObject);
begin
if edit3.Visible then
  begin
    edit3.Visible := false;
    Button3.Visible := false;
    loginForm.Height := 145;
  end
else
  begin
    edit3.Visible := true;
    Button3.Visible := true;
    loginForm.Height := 220;
  end;
end;

end.
