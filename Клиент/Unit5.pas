unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1;

type
  TviewForm = class(TForm)
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckBox20Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure CheckBox24Click(Sender: TObject);
    procedure CheckBox25Click(Sender: TObject);
    procedure CheckBox26Click(Sender: TObject);
    procedure CheckBox27Click(Sender: TObject);
    procedure CheckBox28Click(Sender: TObject);
    procedure CheckBox29Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewForm: TviewForm;

implementation

{$R *.dfm}

procedure TviewForm.FormCreate(Sender: TObject);
var i: integer;
begin
viewForm.Left := (screen.Width - viewForm.Width) div 2;
viewForm.Top := (screen.Height - viewForm.Height)div 2;

for i := 1 to 29 do Unit1.FieldVision[i] := true;
Button1.Caption := 'OK';
CheckBox3.Caption := '���� ������';
CheckBox4.Caption := '��� ���������'; CheckBox5.Caption := '��������'; CheckBox6.Caption := '��� � ���';
CheckBox7.Caption := '�������'; CheckBox8.Caption := '����'; CheckBox9.Caption := '������ ������';
CheckBox10.Caption := '����� ������'; CheckBox11.Caption := '������ ������'; CheckBox12.Caption := '��������� ������';
CheckBox13.Caption := '������ �����'; CheckBox14.Caption := '����������'; CheckBox15.Caption := '��� � ���';
CheckBox16.Caption := '������ �����������'; CheckBox17.Caption := '����� ������'; CheckBox18.Caption := '��������� ������';
CheckBox19.Caption := '��� �������'; CheckBox20.Caption := '������� ��������'; CheckBox21.Caption := '� �/�';
CheckBox22.Caption := '� �������'; CheckBox23.Caption := '���� ��������'; CheckBox24.Caption := '���� ���������';
CheckBox25.Caption := '����� ��������'; CheckBox26.Caption := '����� ���������'; CheckBox27.Caption := '�������� �����';
CheckBox28.Caption := '���� ������'; CheckBox29.Caption := '����������';
end;

procedure TviewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mainForm.Enabled := true;
mainForm.Grid1.SetFocus;
end;

procedure TviewForm.CheckBox3Click(Sender: TObject);
begin Unit1.FieldVision[3] := CheckBox3.Checked; end;
procedure TviewForm.CheckBox4Click(Sender: TObject);
begin Unit1.FieldVision[4] := CheckBox4.Checked; end;
procedure TviewForm.CheckBox5Click(Sender: TObject);
begin Unit1.FieldVision[5] := CheckBox5.Checked; end;
procedure TviewForm.CheckBox6Click(Sender: TObject);
begin Unit1.FieldVision[6] := CheckBox6.Checked; end;
procedure TviewForm.CheckBox7Click(Sender: TObject);
begin Unit1.FieldVision[7] := CheckBox7.Checked; end;
procedure TviewForm.CheckBox8Click(Sender: TObject);
begin Unit1.FieldVision[8] := CheckBox8.Checked; end;
procedure TviewForm.CheckBox9Click(Sender: TObject);
begin Unit1.FieldVision[9] := CheckBox9.Checked; end;
procedure TviewForm.CheckBox10Click(Sender: TObject);
begin Unit1.FieldVision[10] := CheckBox10.Checked; end;
procedure TviewForm.CheckBox11Click(Sender: TObject);
begin Unit1.FieldVision[11] := CheckBox11.Checked; end;
procedure TviewForm.CheckBox12Click(Sender: TObject);
begin Unit1.FieldVision[12] := CheckBox12.Checked; end;
procedure TviewForm.CheckBox13Click(Sender: TObject);
begin Unit1.FieldVision[13] := CheckBox13.Checked; end;
procedure TviewForm.CheckBox14Click(Sender: TObject);
begin Unit1.FieldVision[14] := CheckBox14.Checked; end;
procedure TviewForm.CheckBox15Click(Sender: TObject);
begin Unit1.FieldVision[15] := CheckBox15.Checked; end;
procedure TviewForm.CheckBox16Click(Sender: TObject);
begin Unit1.FieldVision[16] := CheckBox16.Checked; end;
procedure TviewForm.CheckBox17Click(Sender: TObject);
begin Unit1.FieldVision[17] := CheckBox17.Checked; end;
procedure TviewForm.CheckBox18Click(Sender: TObject);
begin Unit1.FieldVision[18] := CheckBox18.Checked; end;
procedure TviewForm.CheckBox19Click(Sender: TObject);
begin Unit1.FieldVision[19] := CheckBox19.Checked; end;
procedure TviewForm.CheckBox20Click(Sender: TObject);
begin Unit1.FieldVision[20] := CheckBox20.Checked; end;
procedure TviewForm.CheckBox21Click(Sender: TObject);
begin Unit1.FieldVision[21] := CheckBox21.Checked; end;
procedure TviewForm.CheckBox22Click(Sender: TObject);
begin Unit1.FieldVision[22] := CheckBox22.Checked; end;
procedure TviewForm.CheckBox23Click(Sender: TObject);
begin Unit1.FieldVision[23] := CheckBox23.Checked; end;
procedure TviewForm.CheckBox24Click(Sender: TObject);
begin Unit1.FieldVision[24] := CheckBox24.Checked; end;
procedure TviewForm.CheckBox25Click(Sender: TObject);
begin Unit1.FieldVision[25] := CheckBox25.Checked; end;
procedure TviewForm.CheckBox26Click(Sender: TObject);
begin Unit1.FieldVision[26] := CheckBox26.Checked; end;
procedure TviewForm.CheckBox27Click(Sender: TObject);
begin Unit1.FieldVision[27] := CheckBox27.Checked; end;
procedure TviewForm.CheckBox28Click(Sender: TObject);
begin Unit1.FieldVision[28] := CheckBox28.Checked; end;
procedure TviewForm.CheckBox29Click(Sender: TObject);
begin Unit1.FieldVision[29] := CheckBox29.Checked; end;

procedure TviewForm.Button1Click(Sender: TObject);
var i: integer;
begin
ColumnWidthAlign(mainForm.Grid1);
viewForm.Close;
end;

end.
