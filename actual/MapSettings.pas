unit MapSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, unit1, MapFail, ComCtrls, Spin, ExtCtrls;

type
  TfrmMapSettings = class(TForm)
    GBTrucks: TGroupBox;
    gbExcavs: TGroupBox;
    cbAllTrucks: TCheckBox;
    cbAllExcavs: TCheckBox;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    rxCLBTrucks: TRxCheckListBox;
    rxCLBExcavs: TRxCheckListBox;
    Date_begin: TDateTimePicker;
    Label1: TLabel;
    Date_end: TDateTimePicker;
    Label2: TLabel;
    edtSignalBegin: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtSignalEnd: TSpinEdit;
    Label5: TLabel;
    edtColor1: TSpinEdit;
    SpeedButton1: TSpeedButton;
    ColorDialog1: TColorDialog;
    edtColor2: TSpinEdit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure rxCLBTrucksStateChange(Sender: TObject; Index: Integer);
    procedure cbAllTrucksClick(Sender: TObject);
    procedure cbAllExcavsClick(Sender: TObject);
    procedure rxCLBExcavsStateChange(Sender: TObject; Index: Integer);
    procedure bbCancelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    function proverka_net_svyazi: boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    allTrucks:boolean;
    allExcavs:boolean;
    checkedTrucks:integer;
    checkedExcavs:integer;
  end;

var
  frmMapSettings: TfrmMapSettings;
  color_1, color2: TColor;

implementation

uses DB, ADODB;

{$R *.dfm}

// Функция возвращает последнее вхождение подстроки
function LastPos(substring, str: string): word;
var s:string;
    a, asum, c:integer;
    f:boolean;
begin
     c:=length(substring);
     f:=false;
     s:=str;
     asum:=0;
     while not f do begin
           a:=pos(substring, s);
           if a>0 then begin
              delete(s,1,a+c-1);
              asum:=asum+a+c-1;
           end else f:=true;
     end;
     result:=asum-c+1;
end;


procedure TfrmMapSettings.FormCreate(Sender: TObject);
var coltrucks, colexcavs:integer;
begin
     SpeedButton1.Glyph.Canvas.Brush.Color := clRed;
     color_1 := clRed;
     SpeedButton1.Glyph.Canvas.FillRect(Rect(10,9,SpeedButton1.Width,SpeedButton1.Height));
     SpeedButton2.Glyph.Canvas.Brush.Color := clBlue;
     color2 := clBlue;
     SpeedButton2.Glyph.Canvas.FillRect(Rect(10,9,SpeedButton1.Width,SpeedButton1.Height));

     Date_begin.Date := date;
     Date_end.Date := Date;
     coltrucks:=0;
     colexcavs:=0;
     allTrucks:=true;
     allExcavs:=true;
     rxCLBTrucks.Items.Clear;
     rxCLBExcavs.Items.Clear;
     checkedTrucks:=0;
     checkedExcavs:=0;
     // Выбираем из базы все самосвалы
     if form1.Query.Active then form1.Query.Active:=false;
     with form1 do begin
         query.SQL.Clear;
         query.SQL.Add('select id, name, equipment_type from equipment where (equipment_type=1) or (equipment_type=2) order by name');
         query.Active:=true;
     end;
     form1.Query.First;
     // Выводим все самосвалы в диалоговое окно
     while not form1.Query.Eof do begin
         if Form1.Query.FieldByName('equipment_type').AsInteger=1 then begin
            rxCLBTrucks.Items.Add(form1.Query.FieldByName('name').AsString);
            rxCLBTrucks.Checked[coltrucks]:=true;
            //rxCLBTrucks.Items.Values[form1.Query.FieldByName('name').AsString]:=form1.Query.fieldbyname('id').AsString;
            inc(coltrucks);
         end else begin
            rxCLBExcavs.Items.Add(form1.Query.fieldByName('name').AsString);
            rxCLBExcavs.Checked[colexcavs]:=true;
            //rxCLBTrucks.Items.Values[form1.Query.FieldByName('name').AsString]:=form1.Query.fieldByName('id').AsString;
            inc(colExcavs);
         end;
         form1.Query.Next;
     end;
  Form1.Query.Close;
end;

procedure TfrmMapSettings.bbOkClick(Sender: TObject);
var posit, paintx, painty, i, count_neuchtenn:integer;
    apppath, imagepath, str:string;
    kx, ky:real;
    tmpImg: TImage;
    filePNG: string;
begin
     if (checkedTrucks+checkedExcavs)=0 then begin
         ShowMessage('Вы не выбрали ни одной единицы техники.');
         exit;
     end;
     if form1.Query.Active then form1.query.Active:=false;
     form1.query.SQL.Clear;
     if not (allTrucks and allExcavs ) then form1.query.SQL.Add('select s.x, s.y, s.signal_level as signal_level, s.id_modem, s.date, s.time, s.id from statss s, modems m ')
        else form1.query.SQL.Add('select s.x, s.y, s.signal_level as signal_level, s.id_modem, s.date, s.time, s.id from statss s');
     form1.query.SQL.Add('where (s.date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',Date_begin.Date)) + ' and '+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Date_end.Date))+')');
     form1.query.SQL.Add('and (s.status=2) and (s.x>0) ');
     form1.Query.SQL.Add('and (s.signal_level<='+IntToStr(edtSignalEnd.value)+')');
     form1.Query.SQL.Add('and (s.signal_level>='+IntToStr(edtSignalBegin.Value)+')');
     // Если выбраны не все единицы техники, то выполняем выборку по единицам
     if not (allTrucks and allExcavs ) then begin
         if (checkedTrucks+checkedExcavs)>((rxCLBTrucks.Items.Count+rxCLBExcavs.Items.Count) div 2) then begin
            form1.Query.SQL.Add('and not(');
            for i:=0 to rxCLBTrucks.Items.Count-1 do begin
                if not rxCLBTrucks.Checked[i] then begin
                    form1.Query.SQL.Add('(m.name="'+rxCLBTrucks.Items.Strings[i]+'") or ');
                end;
            end;
            for i:=0 to rxCLBExcavs.Items.Count-1 do begin
                if not rxCLBExcavs.Checked[i] then begin
                    form1.Query.SQL.Add('(m.name="'+rxCLBExcavs.Items.Strings[i]+'") or ');
                end;
            end;
            // Убираем последнее слово or
            str:=form1.Query.SQL.Strings[form1.Query.SQL.Count-1];
            form1.Query.SQL.Strings[form1.Query.SQL.Count-1]:=copy(str,1,length(str)-4);
            form1.Query.SQL.Add(')');
         end else begin
            form1.Query.SQL.Add('and (');
            for i:=0 to rxCLBTrucks.Items.Count-1 do begin
                if rxCLBTrucks.Checked[i] then begin
                    form1.Query.SQL.Add('(m.name="'+rxCLBTrucks.Items.Strings[i]+'") or ');
                end;
            end;
            for i:=0 to rxCLBExcavs.Items.Count-1 do begin
                if rxCLBExcavs.Checked[i] then begin
                    form1.Query.SQL.Add('(m.name="'+rxCLBExcavs.Items.Strings[i]+'") or ');
                end;
            end;
            // Убираем последнее слово or
            str:=form1.Query.SQL.Strings[form1.Query.SQL.Count-1];
            form1.Query.SQL.Strings[form1.Query.SQL.Count-1]:=copy(str,1,length(str)-4);
            form1.Query.SQL.Add(')');
         end;
         form1.Query.SQL.Add('and (m.id_modem=s.id_modem)');
     end;
     // Сортируем полученные записи по уровню сигнала для того, чтобы сначала рисовались точки,
     // в которых была плохая связь, а потом точки, в которых были пропадания связи.
     // Тогда, если в одной точке были и пропадания и плохой сигнал, последней нарисуется пропадание
     form1.Query.SQL.Add(' order by signal_level DESC');
     //posit:=LastPos('\',Application.ExeName);
     //apppath:=copy(Application.ExeName,1,posit);
     frmShowMap := TfrmShowMap.Create(Application);
     count_neuchtenn := 0;

     tmpImg := TImage.Create(frmShowMap);
     filePNG := 'W:\УКиСС\Участок АСУ ГТК\map.png';

     if FileExists(ExtractFilePath(Application.ExeName)+'map.png') then
             tmpImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'map.png');
     if FileExists(filePNG) then  tmpImg.Picture.LoadFromFile(filePNG);

     frmShowMap.imgMap.Picture.Bitmap.Assign(tmpImg.Picture.Graphic);
     tmpImg.Free;

     //ShowMessage(form1.Query.SQL.Text);
     frmMapSettings.Close;
     frmShowMap.Show;
     frmShowMap.imgMap.Visible := false;
     form1.query.Active:=true;
     form1.query.First;
     // Если не найдено потерянных пакетов, завершаем выполнение
     if form1.query.RecordCount=0 then begin
        ShowMessage('Нет данных');
        exit;
     end;
     frmShowMap.Gauge1.MinValue := 0;
     frmShowMap.Gauge1.MaxValue := Form1.Query.RecordCount;
     frmShowMap.Gauge1.Progress := 0;
      // Рисуем все точки на экране
     // размер рисунка 978*631
     // верхняя левая координата 12213, 5721
     // правая нижняя координата 16296, 3087
     // разница кооридинат для рисунка 16296-12213=х=4083, у=5721-3087=2634
     // коэффициент для х=978/4083, для y=631/2634
     kx:=img_width/(img_endx-img_startx);
     ky:=img_height/(img_endy-img_starty);

     while not form1.Query.Eof do begin
           frmShowMap.Gauge1.Progress := frmShowMap.Gauge1.Progress +1;
           Application.ProcessMessages;
            if CheckBox1.Checked or CheckBox2.Checked then
           //Если текущая точка - это пропадание сигнала, то проверяем, единичное ли это пропадание связи.
           //Если да, то не учитываем данную точку. Если же соседние точки - тоже пропадание сигнала, тогда рисуем.
              if not proverka_net_svyazi then begin form1.query.Next; inc(count_neuchtenn); continue; end;

           paintx:=round((form1.query.fieldByName('x').AsInteger-img_startx)*kx);
           // на плане карьера координатная ось у перевернута. Координаты идут снизу вверх
           painty:=round(img_height-((form1.query.fieldByName('y').AsInteger-img_starty)*ky));
           //ShowMessage(form1.Query.FieldByName('signal_level').AsString);
           if (form1.Query.FieldByName('signal_level').AsInteger-256 <= edtColor1.Value) then begin
              frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:=color_1;
           end else begin
              if form1.Query.FieldByName('signal_level').AsInteger-256 <= edtColor2.Value then
                frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:=Color2
              else frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:=clGreen;
           end;
           form1.query.Next;
     end;

     //imagepath:=apppath+'FailPing'+FormatDateTime('yyyymmdd',form1.MonthCalendar1.date)+'.jpg';
     frmShowMap.Label1.Caption := 'Количество ненарисованных единичных пропаданий связи: '+IntToStr(count_neuchtenn)+' ('+FloatToStrF(count_neuchtenn*100/Form1.Query.RecordCount,ffFixed,5,2)+' %)   Всего: '+IntToStr(Form1.Query.RecordCount);
     frmShowMap.imgMap.Visible := true;
     frmShowMap.Gauge1.Visible := false;
     form1.Query.Active:=false;
end;

procedure TfrmMapSettings.rxCLBTrucksStateChange(Sender: TObject;
  Index: Integer);
begin
     if rxCLBTrucks.Checked[index] then inc(checkedTrucks) else dec(checkedTrucks);
     if checkedTrucks=rxCLBTrucks.Items.Count then allTrucks:=true
        else allTrucks:=false;
end;

procedure TfrmMapSettings.cbAllTrucksClick(Sender: TObject);
begin
     if not cbAllTrucks.Checked then rxCLBTrucks.ApplyState(cbUnchecked,false)
        else rxCLBTrucks.ApplyState(cbChecked,false);
end;

procedure TfrmMapSettings.cbAllExcavsClick(Sender: TObject);
begin
     if not cbAllExcavs.Checked then rxCLBExcavs.ApplyState(cbUnchecked,false)
        else rxCLBExcavs.ApplyState(cbChecked,false);
end;

procedure TfrmMapSettings.rxCLBExcavsStateChange(Sender: TObject;
  Index: Integer);
begin
     if rxCLBExcavs.Checked[index] then inc(checkedExcavs) else dec(checkedExcavs);
     if checkedExcavs=rxCLBExcavs.Items.Count then allExcavs:=true
        else allExcavs:=false;
end;

procedure TfrmMapSettings.bbCancelClick(Sender: TObject);
begin
     frmMapSettings.Close;
end;

procedure TfrmMapSettings.SpeedButton1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
     SpeedButton1.Glyph.Canvas.Brush.Color := ColorDialog1.Color;
     SpeedButton1.Glyph.Canvas.FillRect(Rect(10,9,SpeedButton1.Width,SpeedButton1.Height));
     color_1 := ColorDialog1.Color;
  end;
end;

procedure TfrmMapSettings.SpeedButton2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
     SpeedButton2.Glyph.Canvas.Brush.Color := ColorDialog1.Color;
     SpeedButton2.Glyph.Canvas.FillRect(Rect(10,9,SpeedButton1.Width,SpeedButton1.Height));
     color2 := ColorDialog1.Color;
  end;

end;

function TfrmMapSettings.proverka_net_svyazi: boolean;
var
  pred_signal, next_signal: integer;
begin
  Result := true;
  with Form1.Query_3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from statss');
    SQL.Add('where id_modem='+Form1.Query.fieldByName('id_modem').AsString);
    SQL.Add('and date='+QuotedStr(FormatDateTime('yyyy-mm-dd',Form1.Query.FieldByName('date').AsDateTime)));
    SQL.Add('and time>='+QuotedStr(FormatDateTime('hh:nn:00',Form1.Query.FieldByName('time').AsDateTime)));
    SQL.Add('and time<='+QuotedStr(FormatDateTime('hh:nn:59',Form1.Query.FieldByName('time').AsDateTime)));
    Open;
    pred_signal:=0;
    next_signal:=0;
    First;
    while not eof do
    begin
      if FieldByName('id').AsInteger = Form1.Query.FieldByName('id').AsInteger then
      begin
         //если первая запись
         if pred_signal=0 then
         begin
           Next;
           next_signal := FieldByName('signal_level').AsInteger-256;
           if next_signal >-100 then Result := false;
           break;
         end;
         //если последняя запись
         if eof then
         begin
           if pred_signal >-100 then Result := false;
           break;
         end;
         Next;
         next_signal := FieldByName('signal_level').AsInteger-256;
         //не учитываем единичные точки. 
         if CheckBox1.Checked then
           if (next_signal>-100)and(pred_signal>-100) then Result := false;
         //не учитываем двойные точки.
         if CheckBox2.Checked then
           if (next_signal>-100)or(pred_signal>-100) then Result := false;
         break;
      end
      else
      begin
         pred_signal := FieldByName('signal_level').AsInteger-256;
         Next;
      end;
    end;//while

    Close;
  end;
end;

procedure TfrmMapSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

end.
