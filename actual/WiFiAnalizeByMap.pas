unit WiFiAnalizeByMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Activex, ADODB, StdCtrls, ComCtrls, Grids, Math, ScorpioDB, MyUtils;

type TMyRect=record
     xstart:integer;
     ystart:integer;
     xend:integer;
     yend:integer;
end;

type TWiFiQual=record
     EQName:string;
     count:integer;
     countSuccess:integer;
     countSuccessCurrentBS:integer;
     signal_avg:real;
     signal_avgCurrentBS:real;
end;

type
  TfrmWiFiAnalize = class(TForm)
    GBSettings: TGroupBox;
    SGWiFiQual: TStringGrid;
    ldate: TLabel;
    PSetDate: TDateTimePicker;
    lEquip: TLabel;
    CBEquipment: TComboBox;
    lStation: TLabel;
    CBStation: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure SGWiFiQualDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGWiFiQualFixedCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    { Private declarations }
    WiFiQual:array of TWiFiQual;
    procedure SgSort(var aSg : TStringGrid; aCol : Integer; fromsmalltoLarge:boolean);
  public
    { Public declarations }
    date:TDate;
    //ModemIndex:integer;
    EQid:LongInt;
    EQName:string;
    signal:integer;
    StationName:string;
    x:integer;
    y:integer;
    mapcoords:TMyRect;
    equipname:string;
    currentColSort:integer;
    fromsmall:boolean;
  end;

function SortParams(List:TStringList;index1,index2:integer):integer;

var
  frmWiFiAnalize: TfrmWiFiAnalize;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmWiFiAnalize.FormShow(Sender: TObject);
var QTemp:TMyADOQuery;
    QTemp2:TADOQuery;
  currentidmodem: Integer;
  i:integer;
  modemname:string;
  bsMac:string;
  currentlevel:shortint;
  sumQual:TWiFiQual;
  NeedHeight:integer;
  currEQId:Largeint;
begin
     i:=0;
     equipname:=Self.EQName;
     SetLength(WiFiQual,i);
     CoInitialize(nil);
     QTemp:=TMyADOQuery.Create(nil,Form1.DBConnection);
     QTemp2:=TADOQuery.Create(nil);
     QTemp2.Connection:=Form1.DBConnection;
     // Получаем мак-адрес базовой станции, по которой проводится расчет
     if self.StationName<>'' then begin
        if QTemp2.Active then QTemp2.Close;
        QTemp2.SQL.Clear;
        QTemp2.SQL.Add('select mac_address from modems where (name="'+StationName+'") and (is_access_point=1)');
        try
           QTemp2.Open;
        except
            ShowMessage('Ошибка связи с БД ubiquiti');
            FreeAndNil(QTemp);
            FreeAndNil(QTemp2);
            exit;
        end;
        QTemp2.Last;
        if QTemp2.RecordCount<>0 then bsMac:=QTemp2.FieldByName('mac_address').AsString
           else bsMac:='';
        QTemp2.Close;
     end;
     // Закончили получать мак-адрес
     QTemp.Clear;
     // Выбираем данные по квадрату карты
     {QTemp.SQL.Add('select signal_level, mac_ap, id_modem from statss');
     QTemp.SQL.Add('where (date="'+FormatDateTime('yyyy-mm-dd',self.date)+'")');
     QTemp.SQL.Add('and (x between '+inttostr(mapcoords.xstart)+' and '+inttostr(mapcoords.xend)+')');
     QTemp.SQL.Add('and (y between '+inttostr(mapcoords.ystart)+' and '+inttostr(mapcoords.yend)+')');
     QTemp.SQL.Add('and (status=2)');
     QTemp.SQL.Add('order by id_modem');}
     QTemp.SQL.Add('select s.signal_level, s.mac_ap, e.name, e.id as EQid from statss s');
     QTemp.SQL.Add('inner join equipment e on (e.id=s.id_equipment)');
     QTemp.SQL.Add('inner join stats_status ss on ((ss.id_equipment=s.id_equipment) and (s.datetime >= ss.datetimestart) and (s.datetime < ss.datetimeend))');
     QTemp.SQL.Add('where (s.date="@dt1")');
     QTemp.SQL.Add('and (s.x between @xstart and @xend)');
     QTemp.SQL.Add('and (s.y between @ystart and @yend)');
     QTemp.SQL.Add('and (ss.datetimeend > "@dttmstart" )');
     QTemp.SQL.Add('and (ss.datetimestart <= "@dttmend")');
     QTemp.SQL.Add('and (ss.status=2)');
     QTemp.SQL.Add('and (e.useInMonitoring=1)');
     QTemp.SQL.Add('order by e.name');
     QTemp.vars.Add('dt1',MySQLDate(self.date));
     QTemp.vars.Add('dttmstart',MySQLDateTime(self.date));
     QTemp.vars.Add('dttmend',MySQLDateTime(self.date+1-1/24/3600));
     QTemp.vars.Add('xstart',inttostr(mapcoords.xstart));
     QTemp.vars.Add('xend',inttostr(mapcoords.xend));
     QTemp.vars.Add('ystart',inttostr(mapcoords.ystart));
     QTemp.vars.Add('yend',inttostr(mapcoords.yend));
     QTemp.ReplaceVars;
     QTemp.SQL.SaveToFile('SQL1.txt');
     try
        QTemp.Open;
     except
        ShowMessage('Ошибка связи с БД ubiquiti');
        FreeAndNil(QTemp);
        FreeAndNil(QTemp2);
        exit;
     end;
     QTemp.First;
     currEQId:=0;
     while not QTemp.Eof do begin
         // Eсли имя отличается от предыдущего,
         // создать новую запись в массиве WiFiQual
         if QTemp.FieldByName('EQid').AsLargeInt<>currEQId then begin
            // Определить имя модема по id
            {if QTemp2.Active then QTemp2.Close;
            QTemp2.SQL.Clear;
            QTemp2.SQL.Add('select name from modems where id_modem='+QTemp.FieldByName('id_modem').AsString);
            try
               QTemp2.Open;
            except
                ShowMessage('Ошибка связи с БД ubiquiti');
                FreeAndNil(QTemp2);
                FreeAndNil(QTemp);
                exit;
            end;
            QTemp2.Last;
            if QTemp2.RecordCount<>0 then modemname:=QTemp2.FieldByName('name').AsString else modemname:='';}
            currEQId:=QTemp.FieldByName('EQId').AsLargeInt;
            inc(i);
            SetLength(WiFiQual,i);
            WiFiQual[i-1].EQName:=QTemp.FieldByName('name').AsString;
            WiFiQual[i-1].count:=0;
            WiFiQual[i-1].countSuccess:=0;
            WiFiQual[i-1].signal_avg:=-100;
            QTemp2.Close;
            // Если id соответствует тому, по которому проводим анализ,
            // то записываем его имя, чтобы два раза не проверять
            //if QTemp.FieldByName('id_modem').AsInteger=self.ModemIndex then equipname:=modemname;
         end;
         inc(WiFiQual[i-1].count);
         // Если уровень сигнала >-100, то записываем в удачные попытки связи
         currentlevel:=QTemp.FieldByName('signal_level').AsInteger-256;
         if currentlevel>-100 then begin
            inc(WiFiQual[i-1].countSuccess);
            WiFiQual[i-1].signal_avg:=((WiFiQual[i-1].signal_avg * (WiFiQual[i-1].countSuccess-1)) +currentlevel)/WiFiQual[i-1].countSuccess;
            // Если текущий сигнал был от проверяемой базы, то дописываем информацию
            // в анализ по БC
            if QTemp.FieldByName('mac_ap').AsString=bsMac then begin
                inc(WiFiQual[i-1].countSuccessCurrentBS);
                WiFiQual[i-1].signal_avgCurrentBS:=((WiFiQual[i-1].signal_avgCurrentBS * (WiFiQual[i-1].countSuccessCurrentBS-1)) +currentlevel)/WiFiQual[i-1].countSuccessCurrentBS;
            end;
         end;
         QTemp.Next;
     end;
     QTemp.Close;
     // Выводим значения параметров вычисления
     PSetDate.Date:=self.date;
     CBEquipment.Text:=equipname;
     CBStation.Text:=self.StationName;
     // Выводим таблицу результатов
     SGWiFiQual.RowCount:=Length(WiFiQual)+1;
     // выводим заголовки таблицы
     SGWiFiQual.Font.Style:=[fsBold];
     SGWiFiQual.Cells[0,0]:='Оборудование';
     SGWiFiQual.Cells[1,0]:='Всего, пак.';
     SGWiFiQual.Cells[2,0]:='Неудачно, пак.';
     SGWiFiQual.Cells[3,0]:='Успешно, пак.';
     SGWiFiQual.Cells[4,0]:='Ср. уровень';
     SGWiFiQual.Cells[5,0]:=StationName+'. Усп.';
     SGWiFiQual.Cells[6,0]:=StationName+' Ср. ур.';
     SGWiFiQual.Font.Style:=[];
     // Выводим результаты анализа на форму
     sumQual.EQName:='Среднее';
     sumQual.count:=0;
     sumQual.countSuccess:=0;
     sumQual.countSuccessCurrentBS:=0;
     sumQual.signal_avg:=-100;
     sumQual.signal_avgCurrentBS:=-100;
     for I := 0 to Length(WiFiQual)-1 do begin
         if WiFiQual[i].EQName=equipname then SGWiFiQual.Font.Style:=[fsBold]
            else SGWiFiQual.Font.Style:=[];
         // Если количество удачных попыток связи 0, то ставим средний уровень сигнала -100
         if WiFiQual[i].countSuccess=0 then WiFiQual[i].signal_avg:=-100;
         if WiFiQual[i].countSuccessCurrentBS=0 then WiFiQual[i].signal_avgCurrentBS:=-100;
         SGWiFiQual.Cells[0,i+1]:=WiFiQual[i].EQName;
         SGWiFiQual.Cells[1,i+1]:=inttostr(WiFiQual[i].count);
         SGWiFiQual.Cells[2,i+1]:=inttostr(WiFiQual[i].count-WiFiQual[i].countSuccess);
         SGWiFiQual.Cells[3,i+1]:=inttostr(WiFiQual[i].countSuccess);
         SGWiFiQual.Cells[4,i+1]:=FormatFloat('0.0',WiFiQual[i].signal_avg);
         SGWiFiQual.Cells[5,i+1]:=inttostr(WiFiQual[i].countSuccessCurrentBS);
         SGWiFiQual.Cells[6,i+1]:=FormatFloat('0.0',WiFiQual[i].signal_avgCurrentBS);
         sumQual.count:=sumQual.count+WiFiQual[i].count;
         sumQual.countSuccess:=sumQual.countSuccess+WiFiQual[i].countSuccess;
         sumQual.countSuccessCurrentBS:=sumQual.countSuccessCurrentBS+WiFiQual[i].countSuccessCurrentBS;
         sumQual.signal_avg:=sumQual.signal_avg+WiFiQual[i].signal_avg;
         sumQual.signal_avgCurrentBS:=sumQual.signal_avgCurrentBS+WiFiQual[i].signal_avgCurrentBS;
     end;
     NeedHeight:=(SGWiFiQual.RowCount*SGWiFiQual.DefaultRowHeight)+GBSettings.Height+60;
     if NeedHeight>600 then NeedHeight:=600;
     self.Height:=NeedHeight;
     SgSort(SGWiFiQual,4,true);
     currentColSort:=4;
     fromsmall:=true;
     // Закончили выводить таблицу результатов
     FreeAndNil(QTemp2);
     FreeAndNil(QTemp);
end;

procedure TfrmWiFiAnalize.SgSort(var aSg : TStringGrid; aCol : Integer; fromsmalltoLarge:boolean);
var
  SlSort, SlRow : TStringList;
  i, j,k : Integer;
begin
  //Сортируемый список.
  SlSort := TStringList.Create;

  //Добавляем в сортируемый список пары: "строка - объект".
  //В качестве строки будем записывать значения ячеек того
  //столбца, по которому надо провести сортировку. Будем брать те ячейки, которые
  //не принадлежат фиксированным строкам - чтобы не подвергнуть сортировке
  //шапку таблицы, если она есть.
  //А в качестве объекта будем присоединять копии соответствующих строк таблицы.
  for i := aSg.FixedRows to aSg.RowCount - 1 do begin
    //Создаём контейнер для копии строки таблицы.
    SlRow := TStringList.Create;
    //Копируем строку таблицы в контейнер.
    SlRow.Assign(aSg.Rows[i]);
    //Добавляем в сортируемый список пару:
    //строка: строка из ячейки целевого столбца;
    //объект: контейнер, содержащий копию строки таблицы.
    SlSort.AddObject(aSg.Cells[aCol, i], SlRow);
  end;

  //Сортируем столбец.
  try
      SlSort.CustomSort(sortParams);
  except
      SlSort.Sort;
  end;
  //Возвращаем в таблицу строки, отсортированные по столбцу с номером aCol.
  j := 0;
  k:=0;
  for i := aSg.FixedRows to aSg.RowCount - 1 do begin
    //Берём очередной контейнер.
    // Если сортировка от большего к меньшему, то заполняем строки в обратном порядке
    if fromsmalltoLarge then k:=j else k:=SlSort.Count-1-j;
    SlRow := SlSort.Objects[k] as TStringList;
    //Записываем содержимое контейнера в строку таблицы.
    aSg.Rows[i].Assign(SlRow);
    //Уничтожаем контейнер.
    SlRow.Free;
    //Следующий индекс списка.
    Inc(j);
  end;
  //Уничтожаем сортируемый список.
  SlSort.Free;
end;

procedure TfrmWiFiAnalize.SGWiFiQualDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var x1,x2,x3,y1,y2,y3:integer;
    Pencolor:TColor;
begin
     if SGWiFiQual.Cells[0,ARow]=equipname then begin
         SGWiFiQual.Canvas.Font.Style:=[fsbold];
         SGWiFiQual.Canvas.Font.Color:=clred;
         SGWiFiQual.Canvas.TextOut(rect.left+2,rect.Top+2,SGWiFiQual.Cells[ACol,ARow]);
     end else begin
          SGWiFiQual.Canvas.Font.Style:=[];
          SGWiFiQual.Canvas.Font.Color:=clblack;
     end;
     // Рисуем стрелку для того стобца, который отсортирован
     if ARow=0 then begin
        if ACol=currentColSort then begin
           if fromsmall then begin
              x1:=rect.Right-8;
              x2:=Rect.Right-2;
              x3:=Rect.Right-5;
              y1:=rect.Bottom-8;
              y2:=rect.Bottom-8;
              y3:=rect.Bottom-2;
           end else begin
              x1:=rect.Right-8;
              x2:=Rect.Right-2;
              x3:=Rect.Right-5;
              y1:=rect.Bottom-2;
              y2:=rect.Bottom-2;
              y3:=rect.Bottom-8;
           end;
           pencolor:=SGWiFiQual.Canvas.Pen.Color;
           SGWiFiQual.Canvas.Pen.Color:=clBlack;
           SGWiFiQual.Canvas.MoveTo(x1,y1);
           SGWiFiQual.Canvas.LineTo(x2,y2);
           SGWiFiQual.Canvas.MoveTo(x2,y2);
           SGWiFiQual.Canvas.LineTo(x3,y3);
           SGWiFiQual.Canvas.MoveTo(x3,y3);
           SGWiFiQual.Canvas.LineTo(x1,y1);
           SGWiFiQual.Canvas.Pen.Color:=pencolor;
           SGWiFiQual.Canvas.Font.Style:=[];
          SGWiFiQual.Canvas.Font.Color:=clblack;
        end;
     end;
     SGWiFiQual.Canvas.Font.Style:=[];
     SGWiFiQual.Canvas.Font.Color:=clblack;
end;

procedure TfrmWiFiAnalize.SGWiFiQualFixedCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
     if ARow=0 then begin
        if ACol=currentColSort then fromsmall:=not fromsmall
           else begin
              currentColSort:=ACol;
              fromsmall:=true;
           end;
        SgSort(SGWiFiQual,currentColSort,fromsmall);
     end;
end;

function SortParams(List: TStringList; index1,
  index2: integer): integer;
begin
     Result := CompareValue(StrToFloat(List[Index1]), StrToFloat(List[Index2]));
end;

end.
