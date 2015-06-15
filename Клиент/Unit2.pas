unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TcardForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    Memo2: TMemo;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo3: TMemo;
    Edit6: TEdit;
    DateTimePicker2: TDateTimePicker;
    Memo4: TMemo;
    Edit8: TEdit;
    ComboBox2: TComboBox;
    Edit9: TEdit;
    Edit10: TEdit;
    DateTimePicker3: TDateTimePicker;
    Edit11: TEdit;
    Edit12: TEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox5: TComboBox;
    Edit16: TEdit;
    ComboBox6: TComboBox;
    Button1: TButton;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DateTimePicker6: TDateTimePicker;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Label41: TLabel;
    Button5: TButton;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    DateTimePicker9: TDateTimePicker;
    DateTimePicker10: TDateTimePicker;
    DateTimePicker11: TDateTimePicker;
    DateTimePicker12: TDateTimePicker;
    DateTimePicker13: TDateTimePicker;
    DateTimePicker14: TDateTimePicker;
    Edit29: TEdit;
    Edit30: TEdit;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label32: TLabel;
    Edit31: TEdit;
    Label28: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Memo5: TMemo;
    Button9: TButton;
    Memo6: TMemo;
    Label33: TLabel;
    Label36: TLabel;
    Edit7: TEdit;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit30Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure Edit28Enter(Sender: TObject);
    procedure Button8Enter(Sender: TObject);
    procedure ButtonPlusClick(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure BoxChange(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure DateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditNumberExit(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure EditNumberPress(Sender: TObject; var Key: Char);
    procedure BlockKey(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BlockPress(Sender: TObject; var Key: Char);
    procedure MemoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cardForm: TcardForm;
  EnabledField: array[0..60]of boolean;
  SenderBox: TComboBox;
  SenderEdit1, SenderEdit2: TEdit;

  ArrayLenth: integer;

implementation

uses Unit1, Unit3, Unit8;

{$R *.dfm}
//������� ������� � �������� ����� ��� �������� ����
procedure TcardForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin MainForm.Enabled := true; end;
//���������� ��������� ����� � ������� ������� ����
procedure TcardForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin cardForm.VertScrollBar.Position := cardForm.VertScrollBar.Position + 10; end;
procedure TcardForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin cardForm.VertScrollBar.Position := cardForm.VertScrollBar.Position - 10; end;

procedure TcardForm.FormCreate(Sender: TObject);
var i: integer;
begin
Panel1.Top := 20;
Panel1.Left := 8;
for i := 1 to 51 do Unit2.EnabledField[i] := true;
Unit2.EnabledField[2] := false;
Unit2.EnabledField[18] := false; Unit2.EnabledField[19] := false;
cardForm.Left := (screen.Width - cardForm.Width) div 2;
cardForm.Top := 0;
cardForm.Height := screen.Height;
//����� ������� ����� �������� ������
cardForm.Height := Screen.Height - 50;
//����� ��������� ���� ��� DateTimePicker'��
DateTimePicker1.DateTime := floattodatetime(date); DateTimePicker2.DateTime := floattodatetime(date);
DateTimePicker3.DateTime := floattodatetime(date); DateTimePicker4.DateTime := floattodatetime(date);
DateTimePicker5.DateTime := floattodatetime(date); DateTimePicker6.DateTime := floattodatetime(date);
DateTimePicker7.DateTime := floattodatetime(date); DateTimePicker8.DateTime := floattodatetime(date);
DateTimePicker9.DateTime := floattodatetime(date); DateTimePicker10.DateTime := floattodatetime(date);
DateTimePicker11.DateTime := floattodatetime(date); DateTimePicker12.DateTime := floattodatetime(date);
DateTimePicker13.DateTime := floattodatetime(date); DateTimePicker14.DateTime := floattodatetime(date);

//����� �������
Label1.Caption := '�������� ������ �';  Label2.Caption := '��������';  Label3.Caption := '��������';
Label33.Caption := '��� � ���'; Label36.Caption := '��� � ���';
Label4.Caption := '�������';  Label5.Caption := '����� ��������';  Label6.Caption := '���� ��������';
Label7.Caption := '����� ��������';  Label8.Caption := '���������� ����';  Label9.Caption := '����';
Label10.Caption := '��� �����'; Label11.Caption := '��������� ���������'; Label12.Caption := '������ �������';
Label13.Caption := '����� ��������'; Label14.Caption := '���� ��������'; Label15.Caption := '����� ��������';
Label16.Caption := '���������� ����'; Label17.Caption := '������ ������'; Label18.Caption := '����� ������';
Label19.Caption := '������'; Label20.Caption := '������ �����'; Label21.Caption := '����������';
Label22.Caption := '��������'; Label23.Caption := '������� 1'; Label32.Caption := '������� 2'; Label24.Caption := '�/�';
Label25.Caption := '������'; Label26.Caption := '����� ������'; Label27.Caption := '���� ������';
Label28.Caption := '����. ���� ��������'; Label29.Caption := '��� ��������'; Label30.Caption := '���, ���� ���������';
Label31.Caption := '����������� �� ���������';
Label34.Caption := '����'; Label35.Caption := '�������� �����������';
Label38.Caption := '����'; Label39.Caption := '��� �������';
Label40.Caption := '����������'; Label41.Caption := '����� ������';
//����� ������������ �������� � ����������� �� �� �������
Label3.Left := 120 - Label3.Width; Label4.Left := 120 - Label4.Width; Label5.Left := 120 - Label5.Width;
Label6.Left := 120 - Label6.Width; Label7.Left := 120 - Label7.Width; Label8.Left := 120 - Label8.Width;
Label9.Left := 120 - Label9.Width; Label10.Left := 120 - Label10.Width; Label11.Left := 120 - Label11.Width;
Label12.Left := 120 - Label12.Width; Label13.Left := 120 - Label13.Width; Label14.Left := 120 - Label14.Width;
Label15.Left := 120 - Label15.Width; Label16.Left := 120 - Label16.Width; Label17.Left := 120 - Label17.Width;
Label18.Left := 120 - Label18.Width; Label19.Left := 120 - Label19.Width; Label20.Left := 120 - Label20.Width;
Label21.Left := 472 - Label21.Width; Label22.Left := 472 - Label22.Width; Label23.Left := 472 - Label23.Width; Label32.Left := 472 - Label32.Width;
Label24.Left := 472 - Label24.Width; Label25.Left := 472 - Label25.Width; Label26.Left := 472 - Label26.Width;
Label27.Left := 472 - Label27.Width; Label28.Left := 472 - Label28.Width; Label29.Left := 472 - Label29.Width;
Label30.Left := 472 - Label30.Width;
Label33.Left := 120 - Label33.Width;
Label34.Left := 120 - Label34.Width;
Label36.Left := 472 - Label36.Width;
Label38.Left := 472 - Label38.Width;
Label39.Left := 472 - Label39.Width; Label40.Left := 120 - Label40.Width;
Button1.Caption := '������ ������'; Button2.Caption := '������������ �����';
Button3.Caption := '������������ ��-��'; Button4.Caption := '������������ ���� ��';
//��������� ����� "����� ������"
comboBox2.Items.Clear;
comboBox2.Items.Add('?'); comboBox2.Items.Add('���');
comboBox2.Items.Add('������'); comboBox2.Items.Add('� ���');
comboBox5.Items := comboBox2.Items;
comboBox2.ItemIndex := 0; comboBox5.ItemIndex := 0;
end;

procedure TcardForm.Button5Click(Sender: TObject);
var i: integer;
    OutputM: string;
begin
cardForm.OnActivate(cardForm);
if Edit11.Text = '�������' then Exit;
if RowSelected = -1 then
  begin
    OutputM := '#new';
    for i := 1 to 51 do
    if Unit2.EnabledField[i] or (i = 2) then
      OutputM := OutputM + CardInf[i] + ';'
    else
      case i of
      18,19,22,24,26,28,30,32,34,36,48,49,50: OutputM := OutputM + '1.1.0001;';
      21,23,25,27,29,31,33,35: OutputM := OutputM + '0;';
      end;
  end
else
  begin
   OutputM := '#rewrite';
    for i := 1 to 51 do
      if Unit2.EnabledField[i] or (i = 2) then
      OutputM := OutputM + CardInf[i] + ';'
    else
      case i of
      18,19,22,24,26,28,30,32,34,36,48,49,50: OutputM := OutputM + '1.1.0001;';
      21,23,25,27,29,31,33,35: OutputM := OutputM + '0;';
      end;
  end;
mainForm.Enabled := true;
mainForm.Client1.Socket.SendText(OutputM);
cardForm.Close;
end;

procedure TcardForm.Edit30Change(Sender: TObject);
var daycode: string;
    i, count: integer;
begin
daycode := floattostr(date-(strtodate('01.01.'+copy(datetostr(date),7,4))-500));
i := mainForm.Grid.RowCount - 2;
count := 1;
while (pos(daycode,mainForm.Grid.Cells[1,i])=1) and (i > 0) do
  begin
    if mainForm.Grid.Cells[1,i][5] = edit30.Text then count := count + 1;
    i := i - 1;
  end;
cardForm.Edit29.Text := daycode + inttostr(count) + edit30.Text;
end;

procedure TcardForm.Edit1Enter(Sender: TObject);
begin button5.SetFocus; end;
procedure TcardForm.ComboBox1Enter(Sender: TObject);
begin {button8.SetFocus;} end;
procedure TcardForm.Edit28Enter(Sender: TObject);
begin VertScrollBar.Position := 200; end;
procedure TcardForm.Button8Enter(Sender: TObject);
begin VertScrollBar.Position := 0; end;


procedure TcardForm.ButtonPlusClick(Sender: TObject);
begin
if Sender = Button8 then SenderBox := ComboBox1;
if Sender = Button7 then SenderBox := ComboBox3;
if Sender = Button6 then
  begin
    SenderBox := ComboBox4;
    SenderGrid := listForm.GridD;
    driversForm.Caption := '��������';
    Unit2.ArrayLenth := 15;
  end
else
  begin
    SenderGrid := listForm.GridC;
    driversForm.Caption := '�����������';
    Unit2.ArrayLenth := 30;
    SenderEdit1 := Edit1;
    SenderEdit2 := Edit12;
  end;
Unit1.GridRefresh(senderGrid);
cardForm.Enabled := false;
driversForm.Visible := true;
driversForm.Edit1.SetFocus;
end;

procedure TcardForm.CheckBoxClick(Sender: TObject);
begin
with (Sender as TCheckBox) do
  Unit2.EnabledField[Tag+47] := Checked;
cardForm.DateChange(DateTimePicker3);cardForm.DateChange(DateTimePicker4);
cardForm.DateChange(DateTimePicker5);
end;

procedure TcardForm.BoxChange(Sender: TObject);
begin
with Sender as TComboBox do
  begin
  if ((Tag = 8)or(Tag = 13))then
  if (comboBox2.Text <> '?')and(comboBox5.Text <> '?')
        and(comboBox2.Text <> '')and(comboBox5.Text <> '') then
      if comboBox2.Text='� ���' then
        if comboBox5.Text='� ���' then
          edit11.Text := floattostr(0.98*strtoint(edit9.Text)-strtofloat(edit10.Text))
        else
          edit11.Text := floattostr(0.94*strtoint(edit9.Text)-strtofloat(edit10.Text))
      else
        if comboBox2.Text='������' then
          if comboBox5.Text='� ���' then
            edit11.Text := floattostr(strtofloat(edit9.Text)-strtofloat(edit10.Text))
          else
            edit11.Text := floattostr(0.98*strtofloat(edit9.Text)-strtofloat(edit10.Text))
      else
        edit11.Text := floattostr(strtofloat(edit9.Text)-strtofloat(edit10.Text))
  else
    edit11.Text := '�������';
Unit1.CardInf[Tag] := Text;
end;
end;

procedure TcardForm.EditChange(Sender: TObject);
var i,i1: extended;
begin
with Sender as TEdit do
  begin
    if ((Tag = 7)or(Tag = 9)) then
    if (comboBox2.Text <> '?')and(comboBox5.Text <> '?')
        and(edit9.Text <>'')and(edit10.Text<>'') then
      if comboBox2.Text='� ���' then
        if comboBox5.Text='� ���' then
          edit11.Text := floattostr(0.98*strtofloat(edit9.Text)-strtofloat(edit10.Text))
        else
          edit11.Text := floattostr(0.94*strtofloat(edit9.Text)-strtofloat(edit10.Text))
      else
        if comboBox2.Text='������' then
          if comboBox5.Text='� ���' then
            edit11.Text := floattostr(strtofloat(edit9.Text)-strtofloat(edit10.Text))
          else
            edit11.Text := floattostr(0.98*strtofloat(edit9.Text)-strtofloat(edit10.Text))
      else
        edit11.Text := floattostr(strtofloat(edit9.Text)-strtofloat(edit10.Text))
  else
    edit11.Text := '�������';

  //if sender <> edit11 then cardForm.EditChange(edit11);
    if (Tag > 20)and(Tag < 37) then
      if (Text='')or(Text='0') then
        begin
          Unit2.EnabledField[Tag] := false;
          Unit2.EnabledField[Tag+1] := false;
        end
      else
        begin
          Unit2.EnabledField[Tag] := true;
          Unit2.EnabledField[Tag+1] := true;
        end;
    Unit1.CardInf[Tag] := Text;

    if Tag = 52 then
      if text = '0' then
        begin
          Unit2.EnabledField[18] := true;
          if edit20.Text <> '0' then
            Unit1.CardInf[18] := datetostr(DateTimePicker9.Date)
          else
            if edit19.Text <> '0' then
              Unit1.CardInf[18] := datetostr(DateTimePicker8.Date)
            else
              if edit18.Text <> '0' then
                Unit1.CardInf[18] := datetostr(DateTimePicker7.Date)
              else
                if edit17.Text <> '0' then
                  Unit1.CardInf[18] := datetostr(DateTimePicker6.Date);
        end;

    if Tag = 53 then
      if text = '0' then
        begin
          Unit2.EnabledField[19] := true;
          if edit25.Text <> '0' then
            Unit1.CardInf[19] := datetostr(DateTimePicker13.Date)
          else
            if edit24.Text <> '0' then
              Unit1.CardInf[19] := datetostr(DateTimePicker12.Date)
            else
              if edit23.Text <> '0' then
                Unit1.CardInf[19] := datetostr(DateTimePicker11.Date)
              else
                if edit22.Text <> '0' then
                  Unit1.CardInf[19] := datetostr(DateTimePicker10.Date);
        end;

  end;

  if trystrtofloat(edit11.Text,i1) then
    begin
      i := strtofloat(edit11.Text);
      if (Unit2.EnabledField[21])and trystrtofloat(edit17.Text,i1) then i := i - strtofloat(edit17.Text);
      if (Unit2.EnabledField[23])and trystrtofloat(edit18.Text,i1) then i := i - strtofloat(edit18.Text);
      if (Unit2.EnabledField[25])and trystrtofloat(edit19.Text,i1) then i := i - strtofloat(edit19.Text);
      if (Unit2.EnabledField[27])and trystrtofloat(edit20.Text,i1) then i := i - strtofloat(edit20.Text);
      edit21.Text := floattostr(i);
    end;

  if trystrtofloat(edit15.Text,i1) then
    begin
      i := strtofloat(edit15.Text);
      if (Unit2.EnabledField[29])and trystrtofloat(edit22.Text,i1) then i := i - strtofloat(edit22.Text);
      if (Unit2.EnabledField[31])and trystrtofloat(edit23.Text,i1) then i := i - strtofloat(edit23.Text);
      if (Unit2.EnabledField[33])and trystrtofloat(edit24.Text,i1) then i := i - strtofloat(edit24.Text);
      if (Unit2.EnabledField[35])and trystrtofloat(edit25.Text,i1) then i := i - strtofloat(edit25.Text);
      edit26.Text := floattostr(i);
    end;

cardForm.DateChange(DateTimePicker6); cardForm.DateChange(DateTimePicker7);
cardForm.DateChange(DateTimePicker8); cardForm.DateChange(DateTimePicker9);
cardForm.DateChange(DateTimePicker10); cardForm.DateChange(DateTimePicker11);
cardForm.DateChange(DateTimePicker12); cardForm.DateChange(DateTimePicker13);
end;

procedure TcardForm.DateChange(Sender: TObject);
begin
with Sender as TDateTimePicker do
  begin
    Enabled := Unit2.EnabledField[Tag];
    Unit1.CardInf[Tag] := datetostr(date);
  end;
end;

procedure TcardForm.FormActivate(Sender: TObject);
begin
Unit1.CardInf[2] := datetostr(Date);
cardForm.EditChange(cardForm.Edit7);
cardForm.EditChange(cardForm.Edit29); //1
cardForm.DateChange(cardForm.DateTimePicker14); //2
cardForm.EditChange(cardForm.Edit30); cardForm.BoxChange(cardForm.ComboBox1); //3 4
cardForm.EditChange(cardForm.Edit2); cardForm.EditChange(cardForm.Edit4); //5 6
cardForm.EditChange(cardForm.Edit9); cardForm.BoxChange(cardForm.ComboBox2); //7 8
cardForm.EditChange(cardForm.Edit10); cardForm.EditChange(cardForm.Edit11); //9 10
cardForm.BoxChange(cardForm.ComboBox3); cardForm.EditChange(cardForm.Edit15); //11 12
cardForm.BoxChange(cardForm.ComboBox5); cardForm.EditChange(cardForm.Edit27); //13 14
cardForm.BoxChange(cardForm.ComboBox4); //15
cardForm.DateChange(cardForm.DateTimePicker1); //16
cardForm.DateChange(cardForm.DateTimePicker2); //17
cardForm.EditChange(cardForm.Edit28); //20
cardForm.EditChange(cardForm.Edit17); cardForm.EditChange(cardForm.Edit18); //21 22
cardForm.EditChange(cardForm.Edit19); cardForm.EditChange(cardForm.Edit20);
cardForm.EditChange(cardForm.Edit22); cardForm.EditChange(cardForm.Edit23);
cardForm.EditChange(cardForm.Edit24); cardForm.EditChange(cardForm.Edit25);
cardForm.BoxChange(cardForm.ComboBox6);
cardForm.CheckBoxClick(cardForm.CheckBox1); cardForm.CheckBoxClick(cardForm.CheckBox2);
cardForm.CheckBoxClick(cardForm.CheckBox3);
end;

procedure TcardForm.EditNumberExit(Sender: TObject);
begin with Sender as TEdit do if Text='' then Text := '0'; end;

procedure TcardForm.Button9Click(Sender: TObject);
var i: integer;
begin
//cardForm.BoxChange(cardForm.ComboBox2);
memo5.Clear;
    for i := 1 to 51 do
    if (Unit2.EnabledField[i])or(i=2) then
      memo5.Lines.Add(CardInf[i] + ';')
    else
      case i of
      18,19,22,24,26,28,30,32,34,36,48,49,50: memo5.Lines.Add('1.1.0001;');
      21,23,25,27,29,31,33,35: memo5.Lines.Add('0;');
      end;


end;

procedure TcardForm.EditNumberPress(Sender: TObject; var Key: Char);
begin
if not(((Key >= '0')and(Key <= '9'))or(key = #8)) then
  key := #0;
end;

procedure TcardForm.BlockKey(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin if not((key=VK_UP)or(key=VK_DOWN)) then key := 0; end;
procedure TcardForm.BlockPress(Sender: TObject; var Key: Char);
begin key := #0; end;

procedure TcardForm.MemoChange(Sender: TObject);
var i: integer;
    s: string;
begin
s := '';
with Sender as TMemo do
  begin
    for i := 0 to Lines.Count do
      if Lines[i] <> '' then
        s := s + Lines[i] + ' ';
    Unit1.CardInf[Tag] := s;
  end;
end;


procedure TcardForm.FormResize(Sender: TObject);
begin
Panel1.Width := cardForm.ClientWidth - 16;
Panel1.Height := cardForm.ClientHeight - 16;
end;

end.
