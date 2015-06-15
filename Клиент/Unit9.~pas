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
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
mainForm.Client1.Socket.SendText('#login'+edit1.Text+';'+edit2.Text);
end;

procedure TloginForm.Button4Click(Sender: TObject);
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

procedure TloginForm.Button3Click(Sender: TObject);
begin
if edit3.Visible then
  begin
    edit3.Visible := false;
    Button4.Visible := false;
  end
else
  begin
    edit3.Visible := true;
    Button4.Visible := true;
  end;
end;

end.
