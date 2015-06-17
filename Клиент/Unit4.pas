unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TdriversAddForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label16: TLabel;
    Edit12: TEdit;
    Label17: TLabel;
    Edit13: TEdit;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Memo1: TMemo;
    Edit14: TEdit;
    Edit15: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure EditTelKeyPress(Sender: TObject; var Key: Char);
    procedure EditEnter(Sender: TObject);
    procedure EditTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditExit(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1Click(Sender: TObject);
    procedure ComboBoxClick(Sender: TObject);
    procedure DateTimePicker1Click(Sender: TObject);
    procedure Edit15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  driversAddForm: TdriversAddForm;

procedure loadDInfPage();

implementation

uses Unit1, Unit3, Unit8;

{$R *.dfm}

procedure RefreshPage();
begin
driversAddForm.EditChange(driversAddForm.Edit1); driversAddForm.EditChange(driversAddForm.Edit2);
driversAddForm.EditChange(driversAddForm.Edit3); driversAddForm.EditChange(driversAddForm.Edit4);
driversAddForm.EditChange(driversAddForm.Edit5); driversAddForm.EditChange(driversAddForm.Edit6);
driversAddForm.EditChange(driversAddForm.Edit7); driversAddForm.EditChange(driversAddForm.Edit8);
driversAddForm.EditChange(driversAddForm.Edit9); driversAddForm.EditChange(driversAddForm.Edit10);
driversAddForm.EditChange(driversAddForm.Edit11); driversAddForm.EditChange(driversAddForm.Edit12);
driversAddForm.EditChange(driversAddForm.Edit13);
driversAddForm.DateTimePicker1Click(driversAddForm.DateTimePicker1);
driversAddForm.ComboBoxClick(driversAddForm.ComboBox1);
driversAddForm.ComboBoxClick(driversAddForm.ComboBox2);
{Unit1.DriveInf[8] := datetostr(driversAddForm.DateTimePicker1.Date);
Unit1.DriveInf[11] := driversAddForm.ComboBox1.Text;
Unit1.DriveInf[13] := driversAddForm.ComboBox2.Text};
end;

procedure loadDInfPage();
var s: string;
begin
driversAddForm.Edit14.Text := Unit1.DriveInf[0];
s := Unit1.DriveInf[1];
driversAddForm.Edit1.Text := copy(s,1,pos(' ',s)-1);
delete(s,1,pos(' ',s));
driversAddForm.Edit2.Text := copy(s,1,pos(' ',s)-1);
delete(s,1,pos(' ',s));
driversAddForm.Edit3.Text := s;
if Unit1.DriveInf[2] = '' then
  driversAddForm.Edit4.Text := '___-___-____'
else
  driversAddForm.Edit4.Text := Unit1.DriveInf[2];
if Unit1.DriveInf[3] = '' then
  driversAddForm.Edit5.Text := '___-___-____'
else
  driversAddForm.Edit5.Text := Unit1.DriveInf[3];

if Unit1.DriveInf[4] = '' then
  driversAddForm.Edit6.Text := '____ ______'
else
  driversAddForm.Edit6.Text := Unit1.DriveInf[4];

driversAddForm.Edit7.Text := Unit1.DriveInf[5];
if Unit1.DriveInf[6] <> '' then
driversAddForm.DateTimePicker1.Date := strtodate(Unit1.DriveInf[6]);
driversAddForm.Edit8.Text := Unit1.DriveInf[7];
driversAddForm.Edit9.Text := Unit1.DriveInf[8];
driversAddForm.ComboBox1.Text := Unit1.DriveInf[9];
driversAddForm.Edit10.Text := Unit1.DriveInf[10];
driversAddForm.ComboBox2.Text := Unit1.DriveInf[11];
driversAddForm.Edit11.Text := Unit1.DriveInf[12];
driversAddForm.Edit12.Text := Unit1.DriveInf[13];
driversAddForm.Edit13.Text := Unit1.DriveInf[14];
end;

procedure TdriversAddForm.FormCreate(Sender: TObject);
begin
Label1.Caption := '�������'; Label2.Caption := '���'; Label3.Caption := '��������';
Label4.Caption := '������� 1'; Label5.Caption := '������� 2'; Label6.Caption := '������� �����/�'; Label8.Caption := '�����'; Label9.Caption := '���� ������';
Label10.Caption := '���. �����'; Label11.Caption := '� ���. �����.'; Label12.Caption := '�����';
Label13.Caption := '���. �����'; Label14.Caption := '��� �������'; Label15.Caption := '�����, �3';
Label16.Caption := '���. �����'; Label17.Caption := '���. ����������';
Button1.Caption := 'OK';
DateTimePicker1.Date := Date;
Label1.Left := 144 - Label1.Width; Label2.Left := 144 - Label2.Width;
Label3.Left := 144 - Label3.Width; Label4.Left := 144 - Label4.Width; Label5.Left := 144 - Label5.Width;
Label6.Left := 144 - Label6.Width; Label8.Left := 144 - Label8.Width;
Label9.Left := 144 - Label9.Width; Label10.Left := 144 - Label10.Width; Label11.Left := 144 - Label11.Width;
Label12.Left := 144 - Label12.Width; Label13.Left := 144 - Label13.Width; Label14.Left := 144 - Label14.Width;
Label15.Left := 144 - Label15.Width; Label16.Left := 144 - Label16.Width; Label17.Left := 144 - Label17.Width;
comboBox1.Items.LoadFromFile('auto.inf');
comboBox2.Items.LoadFromFile('pricep.inf');
end;

procedure TdriversAddForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if driversForm.Visible then
  driversForm.Enabled := true
else
  listForm.Enabled := true;
end;

procedure TdriversAddForm.Button1Click(Sender: TObject);
var i: integer;
    s: string;
begin
refreshPage;
if RowSelected = -1 then
  s := '#dnew'
else
  s := '#drewrite';

for i := 0 to 14 do
  s := s + Unit1.DriveInf[i] + ';';

listForm.Enabled := true;
mainForm.Client2.Socket.SendText(s);
if RowSelected = -1 then
  begin
    listForm.GridD.RowCount := 2;
    mainForm.Client2.Socket.SendText('drivers');
  end;
driversAddForm.Close;
end;

procedure TdriversAddForm.FormActivate(Sender: TObject);
begin
driversAddForm.Edit14.Text := '';
driversAddForm.Edit1.Text := ''; driversAddForm.Edit2.Text := '';
driversAddForm.Edit3.Text := ''; driversAddForm.Edit4.Text := '___-___-____';
driversAddForm.Edit5.Text := '___-___-____'; driversAddForm.Edit6.Text := '____ ______';
driversAddForm.Edit7.Text := ''; driversAddForm.Edit8.Text := '';
driversAddForm.DateTimePicker1.Date := floattodatetime(0);strtodate('01.01.0001');
driversAddForm.Edit9.Text := ''; driversAddForm.Edit10.Text := '';
comboBox1.ItemIndex := -1; comboBox2.ItemIndex := -1;
comboBox1.Text := ''; comboBox2.Text := '';
driversAddForm.Edit11.Text := ''; driversAddForm.Edit12.Text := '';
driversAddForm.Edit13.Text := '';

end;

procedure TdriversAddForm.EditChange(Sender: TObject);
begin
with Sender as TEdit do
if tag = 1 then
  Unit1.DriveInf[Tag] := edit1.Text + ' ' + edit2.Text + ' ' + edit3.Text
else
  Unit1.DriveInf[Tag] := Text;
end;
procedure TdriversAddForm.DateTimePicker1Click(Sender: TObject);
begin with Sender as TDateTimePicker do Unit1.DriveInf[Tag] := datetostr(Date); end;
procedure TdriversAddForm.ComboBoxClick(Sender: TObject);
begin with Sender as TComboBox do Unit1.DriveInf[Tag] := Text; end;

procedure TdriversAddForm.EditTelKeyPress(Sender: TObject; var Key: Char);
var s: string;
    pos: integer;
begin
with Sender as TEdit do
if (((key >= '0')and(key <= '9'))) then
  begin
    s := Text;
    pos := SelStart + 1;
    if s[pos] = '_' then
      s[pos] := key
    else
      begin
        inc(pos);
        s[pos] := key;
      end;
    Text := s;
    key := #0;
    if s[pos+1] <> '-' then
      SelStart := pos
    else
      SelStart := pos + 1;
  end
else
  if key = #8 then
    begin
      s := Text;
      pos := SelStart;
      if (s[pos] <> '-')and(s[pos]<>'+') then
        s[pos] := '_'
      else
        begin
          dec(pos);
          s[pos] := '_';
        end;
      Text := s;
      key := #0;
      if s[pos-1]<>'-' then
        SelStart := pos-1
      else
        SelStart := pos-2;
    end
  else
    key := #0;

end;

procedure TdriversAddForm.EditEnter(Sender: TObject);
begin
with Sender as Tedit do
SelStart := 0;
end;

procedure TdriversAddForm.EditTelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s: string;
    pos: integer;
begin
with Sender as TEdit do
if key = VK_DELETE then
  begin
    s := Text;
    pos := SelStart + 1;
    if (s[pos]<>'-')and(s[pos]<>'_') then
      s[pos] := '_';
    Text := s;
    key := 0;
    if s[pos+1] <> '-' then
      SelStart := pos
    else
      SelStart := pos + 1;
  end

end;

procedure TdriversAddForm.EditExit(Sender: TObject);
var s: string;
begin
with Sender as TEdit do
while pos(' ', Text) <> 0 do
  begin
    s := Text;
    delete(s,pos(' ',s),1);
    Text := s;
  end;
end;

procedure TdriversAddForm.Edit6KeyPress(Sender: TObject; var Key: Char);
var s: string;
    pos: integer;
begin
with Sender as TEdit do
if (((key >= '0')and(key <= '9'))) then
  begin
    s := Text;
    pos := SelStart + 1;
    if s[pos] = '_' then
      s[pos] := key
    else
      begin
        inc(pos);
        s[pos] := key;
      end;
    Text := s;
    key := #0;
    if s[pos+1] <> ' ' then
      SelStart := pos
    else
      SelStart := pos + 1;
  end
else
  if key = #8 then
    begin
      s := Text;
      pos := SelStart;
      if s[pos] <> ' ' then
        s[pos] := '_'
      else
        begin
          dec(pos);
          s[pos] := '_';
        end;
      Text := s;
      key := #0;
      if s[pos-1]<>' ' then
        SelStart := pos-1
      else
        SelStart := pos-2;
    end
  else
    key := #0;

end;

procedure TdriversAddForm.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s: string;
    pos: integer;
begin
with Sender as TEdit do
if key = VK_DELETE then
  begin
    s := Text;
    pos := SelStart + 1;
    if (s[pos]<>' ') then
      s[pos] := '_';
    Text := s;
    key := 0;
    if s[pos+1] <> ' ' then
      SelStart := pos
    else
      SelStart := pos + 1;
  end

end;

procedure TdriversAddForm.Memo1Click(Sender: TObject);
var i: integer;
begin
RefreshPage;
memo1.Clear;
for i := 0 to 14 do
  memo1.Lines.Add(Unit1.DriveInf[i]);
end;



procedure TdriversAddForm.Edit15Click(Sender: TObject);
var i: integer;
    s: string;
begin
refreshPage;
if RowSelected = -1 then
  s := '#dnew'
else
  s := '#drewrite';

for i := 0 to 14 do
  s := s + Unit1.DriveInf[i] + ';';
edit15.Text := s;
end;


end.
