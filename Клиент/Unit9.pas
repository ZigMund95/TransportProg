unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ScktComp, VistaAltFixUnit, XPMan, ExtCtrls;

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
    XPManifest1: TXPManifest;
    VistaAltFix1: TVistaAltFix;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
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
var IP, Login: TStrings;
begin
image1.Picture.LoadFromFile('bg_1.png');
image1.Left := 0;
image1.Top := 0;
image1.Width := loginForm.ClientWidth;
image1.Height := loginForm.ClientHeight;

IP := TStringList.Create;
IP.LoadFromFile('ip.inf');
edit3.Text := IP[0];
Unit1.FieldVision[0] := true;
IP.Free;

loginForm.Height := 145;
Edit2.Text := '';
Button1.Caption := 'OK';
Button2.Caption := 'Выход';
Button3.Caption := 'ОК';

Login := TStringList.Create;
Login.LoadFromFile('login.inf');
if Login.Count > 0 then
    edit1.Text := Login[0];
Login.Free;
end;

procedure TloginForm.Button1Click(Sender: TObject);
var Login: TStrings;
begin
mainForm.Client4.Socket.SendText('#login'+edit1.Text+';'+edit2.Text);

Login := TStringList.Create;
Login.Add(edit1.Text);
Login.SaveToFile('login.inf');
Login.Free;

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

procedure TloginForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin if key = #13 then button1.Click; end;
procedure TloginForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin if key = #13 then edit2.SetFocus; end;

end.
