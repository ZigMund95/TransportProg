unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfilterForm = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox2: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  filterForm: TfilterForm;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TfilterForm.Button1Click(Sender: TObject);
begin
if listBox1.ItemIndex <> -1 then
  listBox2.Items.Add(listBox1.Items[listBox1.itemIndex]);
end;

procedure TfilterForm.Button2Click(Sender: TObject);
begin
if listBox2.ItemIndex <> -1 then
  listBox2.Items.Delete(listBox2.ItemIndex);
end;

procedure TfilterForm.FormActivate(Sender: TObject);
var i: integer;
begin
  filterForm.Left := (screen.Width - filterForm.Width) div 2;
  filterForm.Top := (screen.Height - filterForm.Height) div 2;
  ListBox1.Clear;
  ListBox2.Clear;
  for i := 1 to SenderGrid.RowCount - 2 do
    listBox1.Items.Add(SenderGrid.Cells[2,i]);
end;

procedure TfilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mainForm.Enabled := true;
end;

procedure TfilterForm.Button3Click(Sender: TObject);
var i,j: integer;
    s: string;
begin
if listBox2.Items.Count > 0 then
begin
  for i := 1 to SenderGrid.RowCount - 2 do
    begin
      s := SenderGrid.Cells[0,i];
      s[strtoint(Unit1.Filter[Unit1.FilterCol,1])] := '0';
      SenderGrid.Cells[0,i] := s;
    end;
  for j := 0 to listBox2.Items.Count - 1 do
    for i := 1 to SenderGrid.RowCount - 2 do
      begin
        if SenderGrid.Cells[2,i] = listBox2.Items[j] then
          begin
            s := SenderGrid.Cells[0,i];
            s[strtoint(Unit1.Filter[Unit1.FilterCol,1])] := '1';
            SenderGrid.Cells[0,i] := s;
          end
      end
end
else
  begin
    for i := 1 to SenderGrid.RowCount - 2 do
      begin
        s := SenderGrid.Cells[0,i];
        s[strtoint(Unit1.Filter[Unit1.FilterCol,1])] := '1';
        SenderGrid.Cells[0,i] := s;
      end;
    Unit1.Filter[Unit1.FilterCol,1] := 'Все';
  end;

Unit1.FilterGrid;
filterForm.Close;
end;

end.
