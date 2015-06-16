unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1;

type
  TdriversForm = class(TForm)
    Edit1: TEdit;
    ListBox1: TListBox;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  driversForm: TdriversForm;

implementation

uses Unit2, Unit4, Unit6;

{$R *.dfm}

function LowerCaseKir(const S: string): string;
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while L <> 0 do
  begin
    Ch := Source^;
    if ((Ch >= 'A') and (Ch <= 'Z'))or((Ch >= 'А') and (Ch <= 'Я')) then Inc(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;

procedure TdriversForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
cardForm.Enabled := true;
end;

procedure TdriversForm.FormCreate(Sender: TObject);
begin
driversForm.Left := (screen.Width - driversForm.Width) div 2;
driversForm.Top := (screen.Height - driversForm.Height) div 2;
Button1.Caption := 'OK'; Button2.Caption := 'Добавить нового';
Button2.Width := driversForm.Canvas.TextWidth(Button2.caption)+5;
end;

procedure TdriversForm.Edit1Change(Sender: TObject);
var i: integer;
begin
listBox1.Items.Clear;
if edit1.Text = '' then
  for i := 0 to memo1.Lines.Count-1 do
    listBox1.Items.Add(memo1.Lines[i])
else
  for i := 0 to memo1.Lines.Count-1 do
      if pos(lowerCaseKir(edit1.Text), lowerCaseKir(memo1.Lines[i])) = 1 then
        listBox1.Items.Add(memo1.Lines[i]);
end;

procedure TdriversForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin if key = #13 then listBox1.SetFocus; end;
procedure TdriversForm.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin if key = #13 then driversForm.Button1Click(Button1); end;

procedure TdriversForm.Button1Click(Sender: TObject);
var i: integer;
    s: string;
begin
if listBox1.ItemIndex <> -1 then
  begin
    edit1.Text := listBox1.Items[listBox1.ItemIndex];
    Unit2.SenderBox.Text := edit1.Text;
    i := 1;
    while edit1.Text <> SenderGrid.Cells[2,i] do
      inc(i);
    Unit1.findInf(SenderGrid, edit1.Text);

    if Unit2.SenderBox = cardForm.ComboBox4 then
      begin
        cardForm.edit14.Text := a[10];
        cardForm.edit13.Text := a[2];
        cardForm.edit31.Text := a[3];
      end
    else
      begin
        if Unit2.SenderBox = cardForm.ComboBox1 then
          Unit2.SenderEdit1.Text := a[2]
        else
          Unit2.SenderEdit2.Text := a[2];
      end;
  end;
cardForm.ComboBox1.OnChange(cardForm.ComboBox1);
driversForm.Close;
end;

procedure TdriversForm.Button2Click(Sender: TObject);
begin
driversForm.Enabled := false;
if Unit2.SenderBox = cardForm.ComboBox4 then
  driversAddForm.Visible := true
else
  counterAddForm.Visible := true;
end;

procedure TdriversForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_DOWN then
  begin
    listBox1.SetFocus;
    listBox1.ItemIndex := 0;
  end;
end;

procedure TdriversForm.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = VK_UP)and(listBox1.ItemIndex = 0) then
  edit1.SetFocus;
end;

end.
