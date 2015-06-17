unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ScktComp, ExtCtrls, Grids, Menus, ComCtrls,
  ImgList, ShellApi, XPMan, VistaAltFixUnit;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Grid: TStringGrid;
    Client1: TClientSocket;
    PopupMenu1: TPopupMenu;
    qwe1: TMenuItem;
    wer1: TMenuItem;
    Grid1: TStringGrid;
    N16: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    Client2: TClientSocket;
    Client3: TClientSocket;
    Button2: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Client1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridDblClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure popupClick(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Client2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Client3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Client1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Client1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;               //1,2,3,4,5,6,7,8, 9, 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51
  Position: array[0..50] of integer = (1,3,4,5,7,8,9,10,11,13,14,16,17,19,20,23,24,25,26,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,2);
  FieldVision: array[0..60]of boolean;
  a: array[1..30]of string;
  CardInf: array[1..55]of string;
  DriveInf: array[0..14]of string;
  CounterInf: array[0..35]of string;
  Filter: array[1..35,0..1]of string;
  FilterCol,RowSelected: integer;
  MousePos: integer;
  SenderGrid: TStringGrid;
  SelPosNow: integer;

procedure ColumnWidthAlign(Sender: TObject);
procedure GridRefresh(Sender: TStringGrid);
procedure findInf(Sender: TStringGrid; Input: string);
procedure FilterGrid();

implementation

uses Unit2, Unit3, Unit5, Unit4, Unit6, Unit7, Unit8, Unit9;

{$R *.dfm}
procedure ColumnWidthAlign(Sender: TObject);
var
  RowNum       : Integer;
  ColNum       : Integer;
  ColWidth     : Integer;
  MaxColWidth  : Integer;
begin
with Sender as TstringGrid do
begin
for ColNum := 0 to ColCount - 1 do
  begin
    MaxColWidth := DefaultColWidth;
    for RowNum := 0 to RowCount - 1 do
      begin
        ColWidth := Canvas.TextWidth(Cells[ColNum, RowNum]);
        if MaxColWidth < ColWidth then
          MaxColWidth := ColWidth;
      end;
    if (ColNum < 30)and(Unit1.FieldVision[ColNum]) then
      ColWidths[ColNum] := MaxColWidth + 5
    else
      ColWidths[ColNum] := -1;
  end;
end;
end;

procedure GridRefresh(Sender: TStringGrid);
var i: integer;
    t: boolean;
begin
  driversForm.Memo1.Clear;
  for i := 1 to Sender.RowCount - 1 do
    driversForm.Memo1.Lines.Add(Sender.Cells[2,i]);
  t := driversForm.Enabled;
  driversForm.Enabled := true;
  driversForm.Edit1.Text := '1';
  driversForm.Edit1.Text := '';
  driversForm.Enabled := t;
end;

procedure findInf(Sender: TStringGrid; Input: string);
var i,j: integer;
    s: string;
begin
j:= 1;
    while (Input <> Sender.Cells[2,j])and(j<= Sender.RowCount - 1) do
      inc(j);
    for i := 1 to Unit2.ArrayLenth do
      a[i] := Sender.Cells[i+1,j];
end;

procedure FilterGrid();
var i,j,k: integer;
    t: boolean;
    R: TRect;
begin
mainForm.Grid1.RowCount := 2;
for j := 1 to 35 do
    if Filter[j,1] = 'Все' then
      mainForm.Grid1.Cells[j,0] := Filter[j,0]
    else
      mainForm.Grid1.Cells[j,0] := Filter[j,0]+'(*)';


for i := 1 to mainForm.Grid.RowCount - 1 do
  begin
    mainForm.Grid1.Rows[i].Clear;
    t := true;
    for j := 1 to 35 do
      if Filter[j,1] = '1' then
        begin
        for k := 1 to listForm.GridC.RowCount - 2 do
        begin
        //mainForm.Grid.Cells[j,i] := mainForm.Grid.Cells[j,i] + ' ' + copy(listForm.GridC.Cells[0,k],1,1);
          if (copy(listForm.GridC.Cells[0,k],1,1) = '0')and
              (listForm.GridC.Cells[2,k] = mainForm.grid.Cells[j,i]) then

          t := false;

          end
        end
      else
        if Filter[j,1] = '2' then
          begin
            for k := 1 to listForm.GridC.RowCount - 2 do
              if (copy(listForm.GridC.Cells[0,k],2,1) = '0')and
                  (listForm.GridC.Cells[2,k] = mainForm.grid.Cells[j,i]) then
          t := false
          end
        else
        if Filter[j,1] = '3' then
          begin
            for k := 1 to listForm.GridD.RowCount - 2 do
              if (copy(listForm.GridD.Cells[0,k],3,1) = '0')and
                  (listForm.GridD.Cells[2,k] = mainForm.grid.Cells[j,i]) then
          t := false
          end
        else
          if Filter[j,1] = 'Пустые' then
            begin
              if mainForm.Grid.Cells[j,i] <> '' then
                t := false;
            end
          else
            if Filter[j,1] = 'Заполненные' then
              begin
                if mainForm.Grid.Cells[j,i] = '' then
                  t := false;
              end
            else
              if not((Filter[j,1] = 'Все')or(Filter[j,1]=mainForm.Grid.Cells[j,i])) then
                t := false;
    if t then
      begin
        mainForm.Grid1.Rows[mainForm.Grid1.RowCount-1] := mainForm.Grid.Rows[i];
        mainForm.Grid1.RowCount := mainForm.Grid1.RowCount + 1;
      end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i:integer;
    s: string;
begin

for i := 1 to 60 do Unit1.FieldVision[i] := true;
//подключение к серверу
Client1.Host := loginForm.Edit3.Text;
Client1.Active := true;
//задаём первоначальные размеры таблицы и названия колонок
Grid1.Top := 8;
Grid.ColCount := 60;
Grid1.ColCount := 60;
Grid.Cells[1,0] := '№ заявки'; Grid.Cells[2,0] := 'срыв!'; Grid.Cells[3,0] := 'Дата заявки';
Grid.Cells[4,0] := 'Код менеджера'; Grid.Cells[5,0] := 'Заказчик'; Grid.Cells[6,0] := 'код в АТИ';
Grid.Cells[7,0] := 'Маршрут'; Grid.Cells[8,0] := 'Груз'; Grid.Cells[9,0] := 'ставка БРУТТО';
Grid.Cells[10,0] := 'форма оплаты'; Grid.Cells[11,0] := 'прочие потери'; Grid.Cells[12,0] := 'частичная оплата';
Grid.Cells[13,0] := 'ставка НЕТТО'; Grid.Cells[14,0] := 'Перевозчик'; Grid.Cells[15,0] := 'код в АТИ';
Grid.Cells[16,0] := 'Ставка перевозчика'; Grid.Cells[17,0] := 'форма оплаты'; Grid.Cells[18,0] := 'частичная оплата';
Grid.Cells[19,0] := 'наш остаток'; Grid.Cells[20,0] := 'фамилия водителя'; Grid.Cells[21,0] := '№ а/м';
Grid.Cells[22,0] := '№ прицепа'; Grid.Cells[23,0] := 'Дата загрузки'; Grid.Cells[24,0] := 'Дата разгрузки';
Grid.Cells[25,0] := 'Сумма получена'; Grid.Cells[26,0] := 'Сумма выплачена'; Grid.Cells[27,0] := 'закрытие рейса';
Grid.Cells[28,0] := 'Дата заявки'; Grid.Cells[29,0] := 'Примечания';
Grid1.Rows[0] := Grid.Rows[0];
for i := 1 to 35 do
  begin
    Unit1.Filter[i,0] := Grid.Cells[i,0];
    Unit1.Filter[i,1] := 'Все';
  end;
Grid.RowCount := 2;
end;

//Подстраивание размеров таблицы под размер окна
procedure TMainForm.FormResize(Sender: TObject);
begin
Grid1.Height := MainForm.ClientHeight - 16;
Grid1.Width := MainForm.ClientWidth - 16;
end;

//Вызов процедуры выравнивания колонок при изменениях в таблице
//и ограничение на одну пустую строку в конце таблицы
procedure TMainForm.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var ColorBR, ColorP: TColor;
    R: TRect;
begin
ColumnWidthAlign(Sender);
if (Grid1.Cells[1,Grid1.RowCount-2] = '')and(Grid1.RowCount > 2) then
  Grid1.RowCount := Grid1.RowCount - 1;
//каждая третья строка серая
if (ARow mod 3 = 0)and(ARow > 0)and(ACol > 2)and(RowSelected <> ARow) then
  begin
    ColorBr := Grid1.Canvas.Brush.Color;
    ColorP := Grid1.Canvas.Pen.Color;
    Grid1.Canvas.Brush.Color := RGB(240,240,240);
    Grid1.Canvas.Pen.Color := RGB(100,0,0);
    Grid1.Canvas.Rectangle(Rect);
    Grid1.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Grid1.Cells[ACol,ARow]);
    Grid1.Canvas.Brush.Color := ColorBr;
    Grid1.Canvas.Pen.Color := ColorP;
  end;
//красный текс при срыве
if (Grid1.Cells[2,ARow] = 'срыв!')and(ARow > 0) then
  begin
    Grid1.Canvas.Font.Color := RGB(240,0,0);
    Grid1.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Grid1.Cells[ACol,ARow]);
    Grid1.Canvas.Font.Color := RGB(0,0,0);
  end;

if (Filter[ACol,1] <> 'Все')and(ACol>0) then
  begin
    ColorBr := Grid1.Canvas.Brush.Color;
    R := Grid1.CellRect(ACol,0);
    Grid1.Canvas.Brush.Color := RGB(137,172,118);
    Grid1.Canvas.Rectangle(R);
    Grid1.Canvas.TextOut(R.Left+2, R.Top+2, Grid1.Cells[ACol,0]);
    Grid1.Canvas.Brush.Color := ColorBr;
  end;
end;

//входящие сообщения от базы заявок
procedure TMainForm.Client1Read(Sender: TObject; Socket: TCustomWinSocket);
var InputM,s: string;
    InputN,i: integer;
    t: boolean;
begin
InputM := socket.ReceiveText;
while InputM<>'' do
  begin
    if copy(InputM,1,6) = '#login' then InputN := 0;
    if copy(InputM,1,6) = '#reisi' then InputN := 1; //получение списка заявок
    if copy(InputM,1,4) = '#new' then InputN := 4; //добавление новой заявки
    if copy(InputM,1,8) = '#rewrite' then InputN := 5; //изменение заявки

case InputN of
0:
begin
  delete(InputM,1,6);
  if pos('Yes', InputM) = 1 then
    begin
      mainForm.Visible := true;
      loginForm.Visible := false;
      delete(InputM,1,3);
      cardForm.Edit30.Text := InputM;
      listForm.GridD.RowCount := 2;
      Client2.Socket.SendText('drivers');
      listForm.GridC.RowCount := 2;
      Client3.Socket.SendText('counters');
      Grid.RowCount := 2;
      Grid1.RowCount := 2;
      Grid.Rows[1].Clear;
      Grid1.Rows[1].Clear;
      Client1.Socket.SendText('reisi'+InputM);
    end
  else
    MessageDlgPos('Неверный логин или пароль.',
              mtError, [mbOK], 0, -1, -1);
    InputM := '';
end;
1:
begin
  delete(InputM,1,6);
  for i := 0 to 50 do
    begin
    Grid.Cells[Unit1.Position[i],Grid.RowCount-1] := copy(InputM,1,pos(';',InputM)-1);
    if (Grid.Cells[Unit1.Position[i],Grid.RowCount-1] = '0')and(Unit1.Position[i]=11) then
      Grid.Cells[Unit1.Position[i],Grid.RowCount-1] := '';
    delete(InputM,1,pos(';',InputM));
    end;
  Grid.Cells[0,Grid.RowCount-1] := inttostr(Grid.RowCount-1);
  Unit2.ArrayLenth := 30;
  findInf(listForm.GridC, Grid.Cells[5,Grid.RowCount-1]);
  Grid.Cells[6,Grid.RowCount-1] := a[2];
  findInf(listForm.GridC, Grid.Cells[14,Grid.RowCount-1]);
  Grid.Cells[15,Grid.RowCount-1] := a[2];
  Unit2.ArrayLenth := 15;
  findInf(listForm.GridD, Grid.Cells[20,Grid.RowCount-1]);
  Grid.Cells[21,Grid.RowCount-1] := a[11];
  Grid.Cells[22,Grid.RowCount-1] := a[14];
  Grid.Cells[12, Grid.RowCount-1] := inttostr(strtoint(Grid.Cells[30, Grid.RowCount-1]) + strtoint(Grid.Cells[32, Grid.RowCount-1]) +
                                    strtoint(Grid.Cells[34, Grid.RowCount-1]) + strtoint(Grid.Cells[36, Grid.RowCount-1]) +
                                    strtoint(Grid.Cells[38, Grid.RowCount-1]) + strtoint(Grid.Cells[40, Grid.RowCount-1]) +
                                    strtoint(Grid.Cells[42, Grid.RowCount-1]) + strtoint(Grid.Cells[44, Grid.RowCount-1]));
  Grid1.Rows[Grid1.RowCount-1] := Grid.Rows[Grid.RowCount-1];
  Grid1.RowCount := Grid1.RowCount + 1;
  Grid.RowCount := Grid.RowCount + 1;
end;
4:
begin
  delete(InputM,1,4);
  for i := 0 to 50 do
    begin
      Grid.Cells[Unit1.Position[i],Grid.RowCount-1] := copy(InputM,1,pos(';',InputM)-1);
      delete(InputM,1,pos(';',InputM));
    end;
  Grid.Cells[0,Grid.RowCount-1] := inttostr(Grid.RowCount-1);
  Grid.Cells[0,Grid.RowCount-1] := inttostr(Grid.RowCount-1);
  Unit2.ArrayLenth := 30;
  findInf(listForm.GridC, Grid.Cells[5,Grid.RowCount-1]);
  Grid.Cells[6,Grid.RowCount-1] := a[2];
  findInf(listForm.GridC, Grid.Cells[14,Grid.RowCount-1]);
  Grid.Cells[15,Grid.RowCount-1] := a[2];
  Unit2.ArrayLenth := 15;
  findInf(listForm.GridD, Grid.Cells[20,Grid.RowCount-1]);
  Grid.Cells[21,Grid.RowCount-1] := a[11];
  Grid.Cells[22,Grid.RowCount-1] := a[14];
  Unit1.FilterGrid;
  Grid.RowCount := Grid.RowCount + 1;
end;
5:
begin
  delete(InputM,1,8);
  for i := 0 to 50 do
    begin
      Grid.Cells[Unit1.Position[i],RowSelected] := copy(InputM,1,pos(';',InputM)-1);
      delete(InputM,1,pos(';',InputM));
    end;
  Grid.Cells[0,RowSelected] := inttostr(RowSelected);
  Grid.Cells[0,RowSelected] := inttostr(RowSelected);
  Unit2.ArrayLenth := 30;
  findInf(listForm.GridC, Grid.Cells[5,RowSelected]);
  Grid.Cells[6,RowSelected] := a[2];
  findInf(listForm.GridC, Grid.Cells[14,RowSelected]);
  Grid.Cells[15,RowSelected] := a[2];
  Unit2.ArrayLenth := 15;
  findInf(listForm.GridD, Grid.Cells[20,RowSelected]);
  Grid.Cells[21,RowSelected] := a[11];
  Grid.Cells[22,RowSelected] := a[14];
  Unit1.FilterGrid;
end;
end;
end;
end;


//нажатие кнопки "Новый заказ" в выпадающем меню
procedure TMainForm.N1Click(Sender: TObject);
var daycode: string;
    i: integer;
    count: integer;
begin
//переход к форме карточки заказа и её очистка
MainForm.Enabled := false;
cardForm.Visible := true;
cardForm.VertScrollBar.Position := 0;
cardForm.ComboBox1.Text := ''; cardForm.ComboBox3.Text := '';
cardForm.ComboBox4.Text := '';
cardForm.ComboBox2.ItemIndex := 0; cardForm.ComboBox5.ItemIndex := 0;
cardForm.Edit1.Text := ''; cardForm.Edit2.Text := ''; cardForm.Edit3.Text := '';
cardForm.Edit4.Text := ''; cardForm.Edit5.Text := ''; cardForm.Edit6.Text := '';
cardForm.Memo6.Clear; cardForm.Edit8.Text := ''; cardForm.Edit9.Text := '0';
cardForm.Edit10.Text := '0'; cardForm.Edit12.Text := '';
cardForm.Edit13.Text := ''; cardForm.Edit14.Text := ''; cardForm.Edit15.Text := '';
cardForm.Edit16.Text := ''; cardForm.Edit17.Text := '0'; cardForm.Edit18.Text := '0';
cardForm.Edit19.Text := '0'; cardForm.Edit20.Text := '0'; cardForm.Edit21.Text := '0';
cardForm.Edit22.Text := '0'; cardForm.Edit23.Text := '0'; cardForm.Edit24.Text := '0';
cardForm.Edit25.Text := '0'; cardForm.Edit26.Text := '0'; cardForm.Edit27.Text := '0';
cardForm.Edit28.Text := ''; cardForm.Edit31.Text := '';
cardForm.Memo1.Lines.Clear; cardForm.Memo2.Lines.Clear; cardForm.Memo3.Lines.Clear;
cardForm.Memo4.Lines.Clear;
cardForm.DateTimePicker1.Date := date; cardForm.DateTimePicker2.Date := date;
cardForm.DateTimePicker3.Date := date; cardForm.DateTimePicker4.Date := date;
cardForm.DateTimePicker5.Date := date; cardForm.DateTimePicker6.Date := date;
cardForm.DateTimePicker7.Date := date; cardForm.DateTimePicker8.Date := date;
cardForm.DateTimePicker9.Date := date; cardForm.DateTimePicker10.Date := date;
cardForm.DateTimePicker11.Date := date; cardForm.DateTimePicker12.Date := date;
cardForm.DateTimePicker13.Date := date; cardForm.DateTimePicker14.Date := date;
//Вычисление номера новой заявки
daycode := floattostr(date-(strtodate('01.01.'+copy(datetostr(date),7,4))-500));
i := Grid.RowCount - 2;
count := 1;
while (pos(daycode,Grid.Cells[1,i])=1) and (i > 0) do
  begin
    if Grid.Cells[1,i][5] = cardForm.edit30.Text then count := count + 1;
    i := i - 1;
  end;
cardForm.Edit29 .Text := daycode + inttostr(count) + cardForm.edit30.Text;

RowSelected := -1;
end;

//нажатие кнопки "контрагенты" в выпадающем меню
procedure TMainForm.N8Click(Sender: TObject);
var i: integer;
begin
mainForm.Enabled := false;
listForm.Visible := true;
listForm.Grid.ColCount := listForm.GridC.ColCount;
listForm.Grid.RowCount := listForm.GridC.RowCount;
loadGrid(listForm.GridC);
end;

//нажатие кнопки "водители" в выпадающем меню
procedure TMainForm.N9Click(Sender: TObject);
var i: integer;
begin
mainForm.Enabled := false;
listForm.Visible := true;
listForm.Grid.ColCount := listForm.GridD.ColCount;
listForm.Grid.RowCount := listForm.GridD.RowCount;
loadGrid(listForm.GridD);
end;

//нажатие кнопки "Вид" в выпадающем меню
procedure TMainForm.N14Click(Sender: TObject);
begin
viewForm.Visible := true;
mainForm.Enabled := false;
end;

//нажатие кнопки "Служебные" в выпадающем меню
procedure TMainForm.N15Click(Sender: TObject);
begin
if Grid1.Top = 8 then
  begin
    Grid1.Height := Grid1.Height - 32;
    Grid1.Top := 40;
    MainMenu1.Items.Items[4].Items[1].Caption := 'Служебные скрыть';
  end
else
  begin
    Grid1.Top := 8;
    Grid1.Height := Grid1.Height + 32;
    MainMenu1.Items.Items[4].Items[1].Caption := 'Служебные';
  end;
end;

procedure TMainForm.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin RowSelected := ARow; end;

//двойной щелчок по таблице
procedure TMainForm.GridDblClick(Sender: TObject);
var daycode: string;
    i, count: integer;
begin
//переход к форме карточки заказа и её заполнение данными
MainForm.Enabled := false;
cardForm.Visible := true;
cardForm.VertScrollBar.Position := 0;

cardForm.Edit7.Text := Grid1.Cells[2,RowSelected];
cardForm.ComboBox1.Text := Grid1.Cells[5,RowSelected];
cardForm.Edit1.Text := Grid1.Cells[6,RowSelected];
cardForm.Edit2.Text := Grid1.Cells[7,RowSelected];
cardForm.Memo1.Lines.Clear;
cardForm.Memo1.Lines.Add(Grid1.Cells[46,RowSelected]);
cardForm.Edit3.Text := Grid1.Cells[47,RowSelected];
cardForm.Memo2.Lines.Clear;
cardForm.Memo2.Lines.Add(Grid1.Cells[48,RowSelected]);
cardForm.Edit4.Text := Grid1.Cells[8,RowSelected];
cardForm.Edit5.Text := Grid1.Cells[49,RowSelected];
cardForm.Edit6.Text := Grid1.Cells[50,RowSelected];
cardForm.Memo3.Lines.Clear;
cardForm.Memo3.Lines.Add(Grid1.Cells[51,RowSelected]);
cardForm.Memo6.Clear;
cardForm.Memo6.Lines.Add(Grid1.Cells[52,RowSelected]);
cardForm.Edit8.Text := Grid1.Cells[53,RowSelected];
cardForm.Memo4.Lines.Clear;
cardForm.Memo4.Lines.Add(Grid1.Cells[54,RowSelected]);
cardForm.Edit9.Text := Grid1.Cells[9,RowSelected];
cardForm.ComboBox2.Text := Grid1.Cells[10,RowSelected];
if Grid.Cells[11,RowSelected] = '' then
  cardForm.Edit10.Text := '0'
else
  cardForm.Edit10.Text := Grid1.Cells[11,RowSelected];
cardForm.Edit11.Text := Grid1.Cells[13,RowSelected];
cardForm.ComboBox3.Text := Grid1.Cells[14,RowSelected];
cardForm.Edit12.Text := Grid1.Cells[15,RowSelected];
cardForm.ComboBox4.Text := Grid1.Cells[20,RowSelected];
findInf(listForm.GridD, Grid1.Cells[20,RowSelected]);
  cardForm.Edit13.Text := a[2];
  cardForm.Edit31.Text := a[3];
  cardForm.Edit14.Text := a[11];
cardForm.Edit15.Text := Grid1.Cells[16,RowSelected];;
cardForm.ComboBox5.Text := Grid1.Cells[17,RowSelected];
cardForm.Edit16.Text := Grid1.Cells[55,RowSelected];
cardForm.ComboBox6.Text := Grid1.Cells[56,RowSelected];
cardForm.Edit17.Text := Grid1.Cells[30,RowSelected];
cardForm.DateTimePicker3.Date := strtodate(Grid1.Cells[57,RowSelected]);
cardForm.DateTimePicker4.Date := strtodate(Grid1.Cells[58,RowSelected]);
cardForm.DateTimePicker5.Date := strtodate(Grid1.Cells[59,RowSelected]);
cardForm.DateTimePicker6.Date := strtodate(Grid1.Cells[31,RowSelected]);
cardForm.Edit18.Text := Grid1.Cells[32,RowSelected];
cardForm.DateTimePicker7.Date := strtodate(Grid1.Cells[33,RowSelected]);
cardForm.Edit19.Text := Grid1.Cells[34,RowSelected];
cardForm.DateTimePicker8.Date := strtodate(Grid1.Cells[35,RowSelected]);
cardForm.Edit20.Text := Grid1.Cells[36,RowSelected];
cardForm.DateTimePicker9.Date := strtodate(Grid1.Cells[37,RowSelected]);
cardForm.Edit21.Text := '';
cardForm.Edit22.Text := Grid1.Cells[38,RowSelected];
cardForm.DateTimePicker10.Date := strtodate(Grid1.Cells[39,RowSelected]);
cardForm.Edit23.Text := Grid1.Cells[40,RowSelected];
cardForm.DateTimePicker11.Date := strtodate(Grid1.Cells[41,RowSelected]);
cardForm.Edit24.Text := Grid1.Cells[42,RowSelected];
cardForm.DateTimePicker12.Date := strtodate(Grid1.Cells[43,RowSelected]);
cardForm.Edit25.Text := Grid1.Cells[44,RowSelected];
cardForm.DateTimePicker13.Date := strtodate(Grid1.Cells[45,RowSelected]);

cardForm.DateTimePicker1.Date := strtodate(Grid1.Cells[23,RowSelected]);
cardForm.DateTimePicker2.Date := strtodate(Grid1.Cells[24,RowSelected]);
cardForm.DateTimePicker14.Date := strtodate(Grid1.Cells[3,RowSelected]);


cardForm.Edit27 .Text := Grid.Cells[19,RowSelected];
cardForm.Edit28 .Text := Grid.Cells[29,RowSelected];
cardForm.Edit29 .Text := Grid.Cells[1,RowSelected];
cardForm.Edit30 .Text := Grid.Cells[4,RowSelected];
end;

procedure TMainForm.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var r: TRect;
    i: integer;
begin
if (Button = mbRight)and(Y<=24) then
  begin
  Grid1.PopupMenu := PopupMenu1;
  for i := 0 to Grid1.ColCount - 1 do
    begin
      R := Grid1.CellRect(i,0);
      if (R.Left <= X)and(R.Right >= X) then
      case i of
      1,2,3,4,6,7,8,9,
      13,15,16,18,
      19,21,22,23,24,25,
      26,27,28,29:
        begin
          popupMenu1.Items.Items[0].Visible := false;
          popupMenu1.Items.Items[1].Visible := false;
          popupMenu1.Items.Items[2].Visible := false;
          popupMenu1.Items.Items[3].Visible := false;
          popupMenu1.Items.Items[4].Visible := false;
          popupMenu1.Items.Items[5].Visible := false;
        end;
      5,14,20:
        begin
          popupMenu1.Items.Items[0].Caption := 'Все';
          popupMenu1.Items.Items[0].Visible := true;
          popupMenu1.Items.Items[1].Visible := false;;
          popupMenu1.Items.Items[2].Visible := false;
          popupMenu1.Items.Items[3].Visible := false;
          popupMenu1.Items.Items[4].Visible := false;
          popupMenu1.Items.Items[5].Caption := 'Выбрать';
          popupMenu1.Items.Items[5].Visible := true;
          if i = 20 then SenderGrid := listForm.GridD
            else SenderGrid := listForm.GridC;
          Unit1.FilterCol := i;
        end;
      10,17:
        begin
          popupMenu1.Items.Items[0].Caption := 'Все';
          popupMenu1.Items.Items[0].Visible := true;
          popupMenu1.Items.Items[1].Caption := '?';
          popupMenu1.Items.Items[1].Visible := true;
          popupMenu1.Items.Items[2].Caption := 'нал';
          popupMenu1.Items.Items[2].Visible := true;
          popupMenu1.Items.Items[3].Caption := 'безнал';
          popupMenu1.Items.Items[3].Visible := true;
          popupMenu1.Items.Items[4].Caption := 'с НДС';
          popupMenu1.Items.Items[4].Visible := true;
          popupMenu1.Items.Items[5].Visible := false;
          Unit1.FilterCol := i;
        end;
      11,12:
        begin
          popupMenu1.Items.Items[0].Caption := 'Все';
          popupMenu1.Items.Items[0].Visible := true;
          popupMenu1.Items.Items[1].Caption := 'Пустые';
          popupMenu1.Items.Items[1].Visible := true;
          popupMenu1.Items.Items[2].Caption := 'Заполненные';
          popupMenu1.Items.Items[2].Visible := true;
          popupMenu1.Items.Items[3].Visible := false;
          popupMenu1.Items.Items[4].Visible := false;
          popupMenu1.Items.Items[5].Visible := false;
          Unit1.FilterCol := i;
        end;
      end;
    end
  end
else
  Grid1.PopupMenu := nil;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var i: integer;
begin

end;

procedure TMainForm.popupClick(Sender: TObject);
var i: integer;
begin
with Sender as TMenuItem do
  Unit1.Filter[Unit1.FilterCol,1] := Caption;
filterGrid;
end;

procedure TMainForm.N51Click(Sender: TObject);
begin
case Unit1.FilterCol of
5:  Unit1.Filter[Unit1.FilterCol,1] := '1';
14: Unit1.Filter[Unit1.FilterCol,1] := '2';
20: Unit1.Filter[Unit1.FilterCol,1] := '3';
end;
filterForm.OnActivate(filterForm);
mainForm.Enabled := false;
filterForm.Visible := true;
end;

//Отработка закрытия формы
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Отключаемся от сервера
Client1.Active := false;
Client2.Active := false;
Client3.Active := false;
loginForm.Close;
end;

//Входящие сообщения от базы водителей
procedure TMainForm.Client2Read(Sender: TObject; Socket: TCustomWinSocket);
var InputM,s: string;
    InputN,i: integer;
    t: boolean;
begin
InputM := socket.ReceiveText;
while InputM<>'' do
  begin
    if copy(InputM,1,8) = '#drivers' then InputN := 1; //получение списка водителей
    if copy(InputM,1,9) = '#drewrite' then InputN := 2; //изменение данных о водителе
case InputN of
1:
begin
  delete(InputM,1,8);
  for i := 0 to 14 do
    begin
      listForm.GridD.Cells[i+1,listForm.GridD.RowCount-1] := copy(InputM,1,pos(';',InputM)-1);
      delete(InputM,1,pos(';',InputM));
    end;
  listForm.GridD.Cells[0,listForm.GridD.RowCount - 1] := '001';

  listForm.Grid.Rows[listForm.GridD.RowCount - 1] := listForm.GridD.Rows[listForm.GridD.RowCount - 1];
  listForm.GridD.RowCount := listForm.GridD.RowCount + 1;
  listForm.Grid.RowCount := listForm.GridD.RowCount;
  loadGrid(listForm.GridD);
  GridRefresh(listForm.GridD);
end;
2:
begin
  delete(InputM,1,9);
  for i := 0 to 14 do
    begin
      listForm.GridD.Cells[i+1,RowSelected] := copy(InputM,1,pos(';',InputM)-1);
      delete(InputM,1,pos(';',InputM));
    end;
  loadGrid(listForm.GridD);
  GridRefresh(listForm.GridD);
end;
end;
end;
end;

//входящее сообщение от базы контрагентов
procedure TMainForm.Client3Read(Sender: TObject; Socket: TCustomWinSocket);
var InputM,s: string;
    InputN,i: integer;
    t: boolean;
begin
InputM := socket.ReceiveText;
while InputM<>'' do
  begin
    if copy(InputM,1,9) = '#counters' then InputN := 1; //получение списка контрагентов
    if copy(InputM,1,9) = '#crewrite' then InputN := 2;
case InputN of
1:
begin
  delete(InputM,1,9);
  for i := 0 to 30 do
    begin
      listForm.GridC.Cells[i+1,listForm.GridC.RowCount-1] := copy(InputM,1,pos(';',InputM)-1);
      delete(InputM,1,pos(';',InputM));
    end;
  listForm.GridC.Cells[0,listForm.GridC.RowCount - 1] := '11';
  listForm.Grid.Rows[listForm.GridC.RowCount - 1] := listForm.GridC.Rows[listForm.GridC.RowCount - 1];
  listForm.GridC.RowCount := listForm.GridC.RowCount + 1;
  listForm.Grid.RowCount := listForm.GridC.RowCount;
  loadGrid(listForm.GridC);
  GridRefresh(listForm.GridC);
end;
2:
begin
  delete(InputM,1,9);
  for i := 0 to 30 do
    begin
      listForm.GridC.Cells[i+1,RowSelected] := copy(InputM,1,pos(';',InputM)-1);
      delete(InputM,1,pos(';',InputM));
    end;
  loadGrid(listForm.GridC);
  GridRefresh(listForm.GridC);
end;
end;
end;
end;

//Отработка события ошибки подключения к серверу
procedure TMainForm.Client1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var IP,IP1: string;
    Port: integer;
begin
if ErrorCode <> 0 then
  MessageDlgPos('Не удалось подключиться.' + #13 +
              'Вероятно неправильно указан адрес сервера,' + #13 +
              'либо сервер не запущен.',
              mtError, [mbOK], 0, -1, -1);

ErrorCode := 0;
end;

//Отработка события подключения к серверу
procedure TMainForm.Client1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
Client2.Active := false;
Client2.Host := loginForm.edit3.Text;
Client2.Active := true;
Client3.Active := false;
Client3.Host := loginForm.edit3.Text;
Client3.Active := true;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var HTMLPage: TStrings;
begin
HTMLPage := TStringList.Create;
HTMLPage.Add('<html>');
HTMLPage.Add('<head>');
HTMLPage.Add('<title>');
HTMLPage.Add('New Page');
HTMLPage.Add('</title>');
HTMLPage.Add('</head>');

HTMLPage.Add('<body>');
HTMLPage.Add('<table>');

HTMLPage.Add('/table');
HTMLPage.Add('</body>');
HTMLPage.Add('</html>');

HTMLPage.SaveToFile('page.html');
HTMLPage.Free;
//ShellExecute(handle, 'open', 'page.html', nil, nil, SW_SHOWNORMAL);
end;

end.

