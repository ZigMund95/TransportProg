unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TlistForm = class(TForm)
    GridD: TStringGrid;
    GridC: TStringGrid;
    Grid: TStringGrid;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listForm: TlistForm;
  Position: integer;

procedure loadGrid(Sender: TStringGrid);

implementation

uses Unit1, Unit4, Unit6;

{$R *.dfm}

procedure loadGrid(Sender: TStringGrid);
var i: integer;
begin
listForm.Grid.ColCount := Sender.ColCount;
listForm.Grid.RowCount := Sender.RowCount;
  for i := 0 to Sender.RowCount - 1 do
    listForm.Grid.Rows[i] := Sender.Rows[i];
end;


procedure TlistForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mainForm.Enabled := true;
end;

procedure TlistForm.FormCreate(Sender: TObject);
begin
GridD.ColCount := 16;
GridD.RowCount := 2;
GridC.ColCount := 33;
GridC.RowCount := 2;
Grid.Top := 8;
Button1.Caption := '�������� ������';

GridD.Cells[0,0] := ''; GridD.Cells[1,0] := 'IND';
GridD.Cells[2,0] := '�.�.�.'; GridD.Cells[3,0] := '������� 1';
GridD.Cells[4,0] := '������� 2'; GridD.Cells[5,0] := '�������';
GridD.Cells[6,0] := '�����'; GridD.Cells[7,0] := '���� ������';
GridD.Cells[8,0] := '�����'; GridD.Cells[9,0] := '� ���. �����';
GridD.Cells[10,0] := '�����'; GridD.Cells[11,0] := '���. �����';
GridD.Cells[12,0] := '������'; GridD.Cells[13,0] := '�����';
GridD.Cells[14,0] := '���. �����'; GridD.Cells[15,0] := '���. ���.';

GridC.Cells[0,0] := ''; GridC.Cells[1,0] := 'IND';
GridC.Cells[2,0] := '�����'; GridC.Cells[3,0] := '��� � ���';
GridC.Cells[4,0] := '���'; GridC.Cells[5,0] := '���';
GridC.Cells[6,0] := '����'; GridC.Cells[7,0] := '�/����';
GridC.Cells[8,0] := '����'; GridC.Cells[9,0] := '���';
GridC.Cells[10,0] := '����. ����'; GridC.Cells[11,0] := '������������';
GridC.Cells[12,0] := '�.�.�.'; GridC.Cells[13,0] := '�����-�������';
GridC.Cells[14,0] := '�����-�������'; GridC.Cells[15,0] := '�����-�������';
GridC.Cells[16,0] := '��. �����'; GridC.Cells[17,0] := '����. �����';
GridC.Cells[18,0] := '��� 1'; GridC.Cells[19,0] := '������� 1';
GridC.Cells[20,0] := '���. ������� 1'; GridC.Cells[21,0] := 'ICQ 1';
GridC.Cells[22,0] := '��� 2'; GridC.Cells[23,0] := '������� 2';
GridC.Cells[24,0] := '���. ������� 2'; GridC.Cells[25,0] := 'ICQ 2';
GridC.Cells[26,0] := '��� 3'; GridC.Cells[27,0] := '������� 3';
GridC.Cells[28,0] := '���. ������� 3'; GridC.Cells[29,0] := 'ICQ 3';
end;

procedure TlistForm.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
ColumnWidthAlign(Sender);
end;

procedure TlistForm.FormResize(Sender: TObject);
begin
Grid.Height := listForm.ClientHeight - 16;
Grid.Width := listForm.ClientWidth - 16;
end;

procedure TlistForm.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin RowSelected := ARow; end;

procedure TlistForm.GridDblClick(Sender: TObject);
var s: string;
    i: integer;
begin
listForm.Enabled := false;
if Grid.ColCount = GridD.ColCount then
  begin
    driversAddForm.Visible := true;
    for i := 0 to 14 do
      Unit1.DriveInf[i] := Grid.Cells[i+1,RowSelected];
    Unit4.loadDInfPage;
  end
else
  begin
    counterAddForm.Visible := true;
    for i := 0 to 30 do
      Unit1.CounterInf[i] := Grid.Cells[i+1,RowSelected];
    Unit6.loadCInfPage;
  end
end;

procedure TlistForm.Button1Click(Sender: TObject);
var i: integer;
begin
listForm.Enabled := false;
RowSelected := -1;
if Grid.ColCount = GridD.ColCount then
  begin
    driversAddForm.Visible := true;
    for i := 0 to 14 do Unit1.DriveInf[i] := '';
    Unit4.loadDInfPage;
  end
else
  begin
    counterAddForm.Visible := true;
    for i := 0 to 30 do Unit1.CounterInf[i] := '';
    Unit6.loadCInfPage;
  end;
end;

end.
