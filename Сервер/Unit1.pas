unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdUDPServer, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, ScktComp, DB, DBClient, Grids, DBGrids, DBTables, MD5, Math;

type
  TForm1 = class(TForm)
    Server1: TServerSocket;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1: TTable;
    Memo1: TMemo;
    Table2: TTable;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Table3: TTable;
    Table4: TTable;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    Server2: TServerSocket;
    Server3: TServerSocket;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Server1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Server2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Server3ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SocketNum: integer;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
Server1.Active := true;
Server2.Active := true;
Server3.Active := true;
table1.DatabaseName := 'resources\';
table1.TableName := 'base.db';
table1.Active := true;
Table1.IndexName := 'NM';
table2.DatabaseName := 'resources\';
table2.TableName := 'drivers.db';
table2.Active := true;
Table2.IndexName := 'indName';
table3.DatabaseName := 'resources\';
table3.TableName := 'counter.db';
table3.Active := true;
Table3.IndexName := 'indName';
table4.DatabaseName := 'resources\';
table4.TableName := 'users.db';
table4.Active := true;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.Active := false;
table2.Active := false;
table3.Active := false;
table4.Active := false;
server1.Active := false;
server2.Active := false;
server3.Active := false;
end;

procedure TForm1.Server1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var InputM, OutputM,s: string;
    InputN,i: integer;
begin
InputM := Socket.ReceiveText;
if copy(InputM,1,6) = '#login' then InputN := 0;
if pos('reisi',InputM) = 1 then InputN := 1;
if copy(InputM,1,4) = '#new' then InputN := 4;
if copy(InputM,1,8) = '#rewrite' then InputN := 7;
edit1.Text := inttostr(InputN);
case InputN of
0:
begin
  delete(InputM,1,6);
  s := copy(InputM,1,pos(';',InputM)-1);
  delete(InputM,1,pos(';',InputM));
  table4.First;
  while (s <> table4.Fields[1].AsString)and(not table4.Eof) do
    table4.Next;
  s := MD5DigestToStr(MD5String(MD5DigestToStr(MD5String(InputM)) + table4.Fields[3].AsString));
  if table4.Fields[2].AsString = s then
    Socket.SendText('#loginYes'+table4.Fields[0].AsString)
  else
   Socket.SendText('#loginNo');
end;
1:
begin
  delete(InputM,1,5);
  Table1.First;
  while not Table1.Eof do
    begin
      if (table1.Fields[2].AsString = InputM)or(InputM = '0') then
        begin
          OutputM := '#reisi';
          for i := 0 to 50 do
            OutputM := OutputM + Table1.Fields[i].asstring + ';';
          Socket.SendText(OutputM);
        end;
      Table1.Next;
    end
end;
4:
begin
  Socket.SendText(InputM);
  delete(InputM,1,4);
  memo1.Clear;
  for i := 0 to 50 do
    begin
      memo1.Lines.Add(copy(InputM,1,pos(';',InputM)-1));
      delete(InputM,1,pos(';',InputM));
    end;
  table1.InsertRecord([]);
  table1.Edit;
  for i := 0 to 50 do
    table1.Fields[i].AsString := memo1.Lines[i];
  table1.Post;
end;
7:
begin
  Socket.SendText(InputM);
  delete(InputM,1,8);
  memo1.Clear;
  for i := 0 to 50 do
    begin
      memo1.Lines.Add(copy(InputM,1,pos(';',InputM)-1));
      delete(InputM,1,pos(';',InputM));
    end;
  table1.First;
  i := 0;
  while table1.Fields[0].AsString <> memo1.Lines[0] do
    begin
      table1.Next;
      inc(i);
    end;
  table1.Edit;
  for i := 0 to 50 do
    table1.Fields[i].AsString := memo1.Lines[i];
  table1.Post;
end;
end;
end;


procedure TForm1.RadioButton1Click(Sender: TObject);
begin
if radioButton1.Checked then
  dataSource1.DataSet := Table1
else
  if radioButton2.Checked then
    dataSource1.DataSet := Table2
  else
    if radioButton3.Checked then
      dataSource1.DataSet := Table3
    else
      dataSource1.DataSet := Table4;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
if radioButton1.Checked then
  dataSource1.DataSet := Table1
else
  if radioButton2.Checked then
    dataSource1.DataSet := Table2
  else
    if radioButton3.Checked then
      dataSource1.DataSet := Table3
    else
      dataSource1.DataSet := Table4;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
if radioButton1.Checked then
  dataSource1.DataSet := Table1
else
  if radioButton2.Checked then
    dataSource1.DataSet := Table2
  else
    if radioButton3.Checked then
      dataSource1.DataSet := Table3
    else
      dataSource1.DataSet := Table4;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if DataSource1.DataSet = Table1 then
  Table1.Delete
else
  if DataSource1.DataSet = Table2 then
    Table2.Delete
  else
    if DataSource1.DataSet = Table3 then
      Table3.Delete
    else
      Table4.Delete;

end;

procedure TForm1.Server2ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var InputM, OutputM,s: string;
    InputN,i: integer;
begin
InputM := Socket.ReceiveText;
if InputM = 'drivers' then InputN := 1;
if copy(InputM,1,5) = '#dnew' then InputN := 2;
if copy(InputM,1,9) = '#drewrite' then InputN := 3;
edit1.Text := InputM;
case InputN of
1:
begin
  Table2.First;
  while not Table2.Eof do
    begin
      OutputM := '#drivers';
      for i := 0 to 14 do
        OutputM := OutputM + Table2.Fields[i].AsString + ';';
      Socket.SendText(OutputM);
      Table2.Next;
    end;
end;
2:
begin
  delete(InputM,1,5);
  memo1.Clear;
  for i := 0 to 14 do
    begin
      memo1.Lines.Add(copy(InputM,1,pos(';',InputM)-1));
      delete(InputM,1,pos(';',InputM));
    end;
  table2.InsertRecord([]);
  table2.Edit;
  table2.Fields[0].AsInteger := table2.RecordCount;
  for i := 1 to 14 do
    table2.Fields[i].AsString := memo1.Lines[i];
  table2.Post;
end;
3:
begin
  Socket.SendText(InputM);
  delete(InputM,1,9);
  memo1.Clear;
  for i := 0 to 14 do
    begin
      memo1.Lines.Add(copy(InputM,1,pos(';',InputM)-1));
      delete(InputM,1,pos(';',InputM));
    end;
  table2.First;
  while table2.Fields[0].AsString <> memo1.Lines[0] do
    table2.Next;
  table2.Edit;
  for i := 0 to 14 do
    table2.Fields[i].AsString := memo1.Lines[i];
  table2.Post;
end; 
end;
end;

procedure TForm1.Server3ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var InputM, OutputM,s: string;
    InputN,i: integer;
begin
InputM := Socket.ReceiveText;
if InputM = 'counters' then InputN := 1;
if copy(InputM,1,5) = '#cnew' then InputN := 2;
if copy(InputM,1,9) = '#crewrite' then InputN := 3;
edit1.Text := InputM;
case InputN of
1:
begin
  Table3.First;
  while not Table3.Eof do
    begin
      OutputM := '#counters';
      for i := 0 to 30 do
        OutputM := OutputM + Table3.Fields[i].AsString + ';';
      Socket.SendText(OutputM);
      Table3.Next;
    end;
end;
2:
begin
  delete(InputM,1,5);
  memo1.Clear;
  for i := 0 to 30 do
    begin
      memo1.Lines.Add(copy(InputM,1,pos(';',InputM)-1));
      delete(InputM,1,pos(';',InputM));
    end;
  table3.InsertRecord([]);
  table3.Edit;
  table3.Fields[0].AsInteger := table3.RecordCount;
  for i := 1 to 30 do
    table3.Fields[i].AsString := memo1.Lines[i];
  table3.Post;
end;
3:
begin
  Socket.SendText(InputM);
  delete(InputM,1,9);
  memo1.Clear;
  for i := 0 to 30 do
    begin
      memo1.Lines.Add(copy(InputM,1,pos(';',InputM)-1));
      delete(InputM,1,pos(';',InputM));
    end;
  table3.First;
  while table3.Fields[0].AsString <> memo1.Lines[0] do
    table3.Next;
  table3.Edit;
  for i := 0 to 30 do
    table3.Fields[i].AsString := memo1.Lines[i];
  table3.Post;
end;
end;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
if radioButton1.Checked then
  dataSource1.DataSet := Table1
else
  if radioButton2.Checked then
    dataSource1.DataSet := Table2
  else
    if radioButton3.Checked then
      dataSource1.DataSet := Table3
    else
      dataSource1.DataSet := Table4;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
    s: string;
begin
{table4.Edit;
table4.Fields[1].AsString := 'manager1';
table4.Post; }
//table4.InsertRecord([0,'admin','933599','']);
//table4.Fields[3]
//edit3.Text := MD5DigestToStr(MD5String(edit2.Text));

{memo1.Clear;
for i := 33 to 126 do
  memo1.Lines.Add(inttostr(i)+' '+chr(i));}
//Randomize;
{table4.First;
while not table4.Eof do
  begin
    table4.Edit;
    //s := '';
    //for i := 1 to 5 do
    //  s := s + chr(RandomRange(33,126));
    //table4.Fields[3].AsString := s;
    s := MD5DigestToStr(MD5String(edit2.Text));
    s := s + table4.Fields[3].AsString;
    s := MD5DigestToStr(MD5String(s));
    table4.Fields[2].AsString := s;
    table4.Post;
    table4.Next;
  end; }
//table4.Delete;
table4.InsertRecord([]);
table4.Edit;
table4.Fields[0].AsInteger := table4.RecordCount - 1;
table4.Fields[1].AsString := edit2.Text;
Randomize;
s := '';
for i := 1 to 5 do
  s := s + chr(RandomRange(33,126));
table4.Fields[3].AsString := s;
s := MD5DigestToStr(MD5String(MD5DigestToStr(MD5String(edit3.Text)) + table4.Fields[3].AsString));
table4.Fields[2].AsString := s;
table4.Post;
end;


end.
