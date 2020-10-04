unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, Provider, SqlExpr, DB, ExtCtrls, TeeProcs, TeEngine,
  Chart, StdCtrls, Grids, DBGrids, TTDBGrid, DBClient, DBLocal, DBLocalS,
  FMTBcd, Series, BubbleCh, ComCtrls, Clipbrd, ComObj, ActiveX, Menus, snmpsend,asn1util,
  ADODB, jpeg, shellapi, DelphiCryptlib, cryptlib;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    ToolTipsDBGrid1: TToolTipsDBGrid;
    Button1: TButton;
    Chart1: TChart;
    Series1: TPointSeries;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MonthCalendar1: TMonthCalendar;
    Button2: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter3: TSplitter;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    N1: TMenuItem;
    Label7: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    btnMAC: TButton;
    Updatemac1: TMenuItem;
    Button3: TButton;
    Timer1: TTimer;
    RadioGroup1: TRadioGroup;
    Button4: TButton;
    CheckBox4: TCheckBox;
    Button5: TButton;
    Button6: TButton;
    DBConnection: TADOConnection;
    Query_3: TADOQuery;
    Modems: TADOQuery;
    Modemsid_modem: TLargeintField;
    Modemsis_access_point: TSmallintField;
    Modemsname: TWideStringField;
    Modemsip_address: TWideStringField;
    Modemsmac_address: TWideStringField;
    Modemsplace_install: TWideStringField;
    Modemspower: TSmallintField;
    Modemsprim: TWideStringField;
    Modemscolor: TLargeintField;
    Modemsonline: TSmallintField;
    Modemsid_ptx: TLargeintField;
    Modemsid_modem_1: TLargeintField;
    Modemsserial: TWideStringField;
    Modemsip_address_1: TWideStringField;
    Modemsos_ver: TWideStringField;
    Modemsdispatch_ver: TWideStringField;
    Modemsoem_driver_ver: TWideStringField;
    Modemsprim_1: TWideStringField;
    Modemsmac_address_1: TWideStringField;
    modems_avg: TADOQuery;
    LargeintField1: TLargeintField;
    SmallintField1: TSmallintField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    SmallintField2: TSmallintField;
    WideStringField5: TWideStringField;
    LargeintField2: TLargeintField;
    SmallintField3: TSmallintField;
    LargeintField3: TLargeintField;
    LargeintField4: TLargeintField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    WideStringField12: TWideStringField;
    modems_avgavg_signal: TIntegerField;
    Query: TADOQuery;
    DataSource2: TDataSource;
    ADOConPowerView: TADOConnection;
    qryStatusEvents: TADOQuery;
    Series2: TLineSeries;
    qryUpdate: TADOQuery;
    GroupBox2: TGroupBox;
    lAvgLevel: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    lFailPing: TLabel;
    lSuccessPing: TLabel;
    LFailPerc: TLabel;
    lSuccessPerc: TLabel;
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    NqualDay: TMenuItem;
    WLANConnections1: TMenuItem;
    qryModems: TADOQuery;
    qryModemsid_modem: TLargeintField;
    GroupBox4: TGroupBox;
    Button7: TButton;
    lbl_more_78: TLabel;
    lbl_less_78: TLabel;
    lbl_no_answer: TLabel;
    Lbl_avg: TLabel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    ADOConnection_query: TADOConnection;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Label11: TLabel;
    NFailMap: TMenuItem;
    Label12: TLabel;
    Series9: TLineSeries;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button12: TButton;
    Button13: TButton;
    Query_2: TADOQuery;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Ping1: TMenuItem;
    GPSARRIVE1: TMenuItem;
    VNC1: TMenuItem;
    telnet1: TMenuItem;
    Bullet1: TMenuItem;
    function SSH_Client(Server, Userid, Pass: string): TCryptSession;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ToolTipsDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolTipsDBGrid1DblClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnMACClick(Sender: TObject);
    procedure Updatemac1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label3DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure modems_avg1CalcFields(DataSet: TDataSet);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure WLANConnections1Click(Sender: TObject);
    procedure NqualDayClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button110Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure NFailMapClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure lAvgLevelDblClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Ping1Click(Sender: TObject);
    procedure GPSARRIVE1Click(Sender: TObject);
    procedure VNC1Click(Sender: TObject);
    procedure telnet1Click(Sender: TObject);
    procedure Bullet1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  NamesModems: Array of string;
  flagWLANConnections: boolean;
  startDate, endDate : TDate;
  vncConf: TStrings;
implementation

uses unit3, MapSettings;
{$R *.dfm}

function TForm1.SSH_Client(Server, Userid, Pass: string): TCryptSession;
begin
 result := TCryptSession.Create(CRYPT_SESSION_SSH);
 with result do begin
   ServerName := Server;  { set hostname or IP address }
   UserName := Userid;    { set user identification }
   Password := Pass;      { set password }
 end;
 try
   result.Activate;       { establish SSH connection to server }
 except
   on E: ECryptError do
   begin
     //Memo11.Add(E.Message);
     FreeAndNil(result);
   end;
 end;
end;

function convert_s(s: string):string;
var i: byte;
    ch: char;
begin
  Result := '';
  for i:=1 to Length(s)-1 do
  begin
  ch := s[i];
  Result := Result+IntToHex(ord(ch),2)+':';
  end;
  ch := s[Length(s)];
  Result := Result+IntToHex(ord(ch),2);
end;

// Функция получения количества секунд, прошедших с начала смены по фактическому времени tm
function TimeToShiftSec(tm:TTime):integer;
var tm1:TTime;
begin
     if tm>=strtotime('7:30') then tm1:=tm-StrToTime('7:30') else tm1:=tm+StrToTime('4:30');
     if tm1>=StrToTime('12:00') then tm1:=tm1-StrToTime('12:00');
     // 86400 - количество секунд в сутках
     result:=round(tm1*86400);
end;

// Функция для определения номера смены по дате и времени
function DateToShift(dt:TDate; tm:TTime):integer;
var shift:integer;
begin
         shift:=round((int(dt)-int(strToDate('01.01.1970')))*2);
         if tm>=StrToTime('7:30') then shift:=shift+1;
         if tm>=StrToTime('19:30') then shift:=shift+1;
         result:=shift;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  Modems.CommandText := 'select * from modems as t1 LEFT OUTER JOIN ptx as t2 ON t1.id_modem=t2.id_modem';
  Modems.Open;
//  Query.SQL.Text := 'select place_install, color from modems where is_access_point=1';
  MonthCalendar1.Date := Date;
  DateTimePicker2.Date := date;
  DateTimePicker1.Date := date;
{
  Query.Open;
  if Query.RecordCount < 4 then exit;
  Label1.Caption := Query.Fields[0].AsString;
  Label1.Color := Query.Fields[1].AsInteger;
  Query.Next;
  Label2.Caption := Query.Fields[0].AsString;
  Label2.Color := Query.Fields[1].AsInteger;
  Query.Next;
  Label3.Caption := Query.Fields[0].AsString;
  Label3.Color := Query.Fields[1].AsInteger;
  Query.Next;
  Label4.Caption := Query.Fields[0].AsString;
  Label4.Color := Query.Fields[1].AsInteger;
  Query.Close;
  }
  //ProgressBar1.Left := CheckBox2.Left+CheckBox2.Width+10;
  //CheckBox2.Left := Label12.Left+Label12.Width+10;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Modems.Close;
  DBConnection.Close;
end;

function IsOLEObjectInstalled(Name: String): boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)), ClassID);
  if Rez = S_OK then  // Объект найден
    Result := true
  else
    Result := false;
end;

procedure TForm1.EXCEL1Click(Sender: TObject);
var clpbrd : TClipboard;
var image1: TImage;  ExcelApp, WorkBook: Variant;
begin
ToolTipsDBGrid1.Tag := 1;
//установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Экспорт невозможен. Excel не установлен.');
    exit;
  end;

  clpbrd := Clipboard;
//  clpbrd.Assign(Chart1.);
  image1 := TImage.Create(Form1);
try

  image1.Parent := Form1;
  image1.Width := Chart1.Width;
  image1.Height := Chart1.Height;
  Chart1.PaintTo(image1.Canvas,0,0);
  clpbrd.Assign(image1.Picture.Bitmap);


 // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');


  WorkBook := ExcelApp.WorkBooks.Add;
  Workbook.WorkSheets[1].Paste;
  ExcelApp.visible := true;
finally
  image1.Free;
end;//try
ToolTipsDBGrid1.Tag := 0;
end;//procedure

procedure TForm1.Button1Click(Sender: TObject);
var tmpDateTime: TDateTime;
    successPing, failPing:integer;
    successPerc, failPerc, sumAvg: real;
    color1:TColor;
begin
  ToolTipsDBGrid1.Tag := 1;
  Label8.Caption := 'Средний уровень сигнала';
  flagWLANConnections := false;
  Query.Close;
   { if CheckBox1.Checked then
      Query.sql.Text := 'select date, time, signal_level, color, status, name from statss, modems where statss.id_modem='+
        Modemsid_modem.AsString+' and statss.mac_ap=modems.mac_address'
    else}
    begin
      Query.sql.Text := 'select date, time, signal_level, color, status, name from statss, modems where ';
      if CheckBox3.Checked then
      begin
        if FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date) <> FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date) then
          Query.sql.Text := Query.sql.Text +
            ' (((statss.date > '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+') ' +
            ' and (statss.date < '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+')) ' +
            ' or ((statss.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+') and ' +
            '(statss.time >= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker3.Time))+')) ' +
            ' or ((statss.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') and ' +
            '(statss.time <= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker4.Time))+'))) '
         else
           Query.sql.Text := Query.sql.Text +
            ' (statss.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+' and ' +
            'statss.time >= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker3.Time))+' and ' +
            'statss.time <= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker4.Time))+') '

      end
      else
      begin
        Query.sql.Text := Query.sql.Text +
          ' statss.date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date));
      end;
      Query.sql.Text := Query.sql.Text + ' and statss.id_modem='+
          Modemsid_modem.AsString+' and statss.mac_ap=modems.mac_address order by date, time';
    end;
  Query.Open;
  Query.FindLast;
  if Query.RecordCount = 0 then exit;
  ProgressBar1.Min := 0;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Query.RecordCount;
  Query.First;
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('График изменения уровня сигнала wi-fi для '+Modemsname.Asstring);
  Chart1.Series[0].Active:= false;
  Chart1.Series[1].Active:= false;
  Chart1.Series[2].Active:= false;
  Chart1.Series[3].Active:= false;
  Chart1.Series[4].Active:= false;
  Chart1.Series[5].Active:= false;
  Chart1.Series[6].Active:= false;
  Chart1.Series[7].Active:= false;
  Chart1.Series[8].Active:= false;

  SetLength(NamesModems,0);
  tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
  Chart1.Series[1].AddXY(tmpDateTime,-78);
  // successPing - количество успешных Pingов во всех статусах
  // FailPing - Неудачные пинги (-100) в статусе
  successPing:=0;
  failPing:=0;
  sumAvg:=0;
  while not Query.Eof do
  begin
    if CheckBox2.Checked then
    begin
      ProgressBar1.Position := ProgressBar1.Position +1;
      Application.ProcessMessages;
    end;
      SetLength(NamesModems,Length(NamesModems)+1);
      tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
      if Query.Fields[2].AsInteger=156 then
      begin
        color1:=clLtGray;
        // Если статус оборудования - готов, то это неудачный пинг (пропадание связи).
        // Иначе считаем, что в это время PTX не работал, значит это не проблема связи
        if query.FieldByName('status').AsInteger=2 then begin
           color1:=clYellow;
           inc(failPing);
        end;
        Chart1.Series[0].AddXY(tmpDateTime,(Query.FieldByName('signal_level').AsInteger-256),'',color1);
        NamesModems[High(NamesModems)] := '';
      end
      else
      begin
        color1:=clLtGray;
        if query.FieldByName('status').AsInteger=2 then begin
           color1:=Query.FieldByName('color').AsInteger;
           inc(successPing);
           sumAvg:=sumAvg+(Query.FieldByName('signal_level').AsInteger-256);
        end;
        Chart1.Series[0].AddXY(tmpDateTime,Query.FieldByName('signal_level').AsInteger-256,'',color1);
        NamesModems[High(NamesModems)] := Query.FieldByName('name').AsString + ' ';
      end;
    Query.Next;
  end;
  tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
  Chart1.Series[0].AddXY(tmpDateTime,(Query.FieldByName('signal_level').AsInteger-256),'',Query.FieldByName('color').AsInteger);
  Chart1.Series[1].AddXY(tmpDateTime,-78);
  ProgressBar1.Position := 0;
  Query.Close;

  Chart1.Series[0].Active := true;
  Chart1.Series[1].Active := true;
  ToolTipsDBGrid1.Tag := 0;
  if successPing>0 then begin
     lAvgLevel.Caption:=FloatToStrF(sumavg/successPing,ffFixed,7,1);
     lSuccessPing.Caption:=inttostr(successPing);
     lFailPing.Caption:=inttostr(failPing);
  end else begin
     lAvgLevel.Caption:='-100';
  end;
  if (SuccessPing+failPing)>0 then begin
     lSuccessPerc.Caption:=floattostr(round(SuccessPing/(SuccessPing+failPing)*1000)/10);
     lFailPerc.Caption:=floattostr(100-StrToFloat(lSuccessPerc.Caption))+'%';
     lSuccessPerc.Caption:=lSuccessPerc.Caption+'%';
  end else begin
     lSuccessPerc.Caption:='0%';
     lFailPerc.Caption:='0%';
  end;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked then CheckBox3.Checked := false;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
   if CheckBox3.Checked then CheckBox1.Checked := false;
end;


procedure TForm1.ToolTipsDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

begin
   if Modemsis_access_point.AsInteger=1 then
      begin
        ToolTipsDBGrid1.Canvas.Brush.Color := RGB(0,150,200);
        ToolTipsDBGrid1.Canvas.Font.Color := clBlack;
      end
      else

           if Modemsonline.AsInteger=1 then
              begin
                ToolTipsDBGrid1.Canvas.Brush.Color := clLime;
                ToolTipsDBGrid1.Canvas.Font.Color := clBlack;
              end
           else
              begin
                ToolTipsDBGrid1.Canvas.Brush.Color := clRed;
                ToolTipsDBGrid1.Canvas.Font.Color := clBlack;
              end;


      {  if (gdSelected in State) then
  begin
    ToolTipsDBGrid1.Canvas.Brush.Color := clBlue;
    ToolTipsDBGrid1.Canvas.Font.Color :=  clWhite;
  end;}

  ToolTipsDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TForm1.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  pt:TPoint;
begin
 if not flagWLANConnections then
    Chart1.Hint := namesModems[ValueIndex]+IntToStr(Trunc(Chart1.Series[0].YValue[ValueIndex]))+' dBm '+
      FormatDateTime('dd.mm.yyyy hh:nn:ss',Chart1.Series[0].XValue[ValueIndex])
 else
    exit;
 //    Chart1.Hint := IntToStr(Trunc(Chart1.Series[0].YValue[ValueIndex]))+' Connections '+
  //    FormatDateTime('dd.mm.yyyy hh:nn:ss',Chart1.Series[0].XValue[ValueIndex]);

   pt := chart1.ClientToScreen(Point(X,Y)) ;
   Application.ActivateHint(pt) ;
end;

procedure TForm1.ToolTipsDBGrid1DblClick(Sender: TObject);
begin
  Button1.Click;
end;

procedure TForm1.C1Click(Sender: TObject);
begin
Button1.Click;
end;

procedure TForm1.N1Click(Sender: TObject);
var Book_Mark: Pointer;
begin
  Book_Mark := Modems.GetBookmark;
  Modems.Close;
  Modems.Open;
  Modems.GotoBookmark(Book_Mark);
  Modems.FreeBookmark(Book_Mark);
end;

procedure TForm1.btnMACClick(Sender: TObject);
var s1,s4:string;
   snmp : tsnmpsend;
begin
  ToolTipsDBGrid1.Tag := 1;
  Modems.First;
  while not Modems.Eof do
  begin
     snmp := tsnmpsend.Create;
     try
       snmp.Query.Clear;
       snmp.Query.Community:='ubnt_mlink54';
       snmp.TargetHost := Modemsip_address.AsString;
       snmp.Query.PDUType := PDUGetRequest;
       s1:='1.2.840.10036.1.1.1.1.5';
       snmp.Query.MIBAdd(s1,'',ASN1_NULL);
       if snmp.SendRequest then
         begin
           Application.ProcessMessages;
           s4:=snmp.Reply.MIBGet(s1);
           Query_3.Close;
           Query_3.SQL.Text := 'Update modems set mac_address='+QuotedStr(s4)+' where id_modem='+Modemsid_modem.AsString;
           Query_3.ExecSQL;
           Query_3.Close;
         end;
     finally
       snmp.Free;
     end;
     Modems.Next;
  end;
  ToolTipsDBGrid1.Tag := 0;
end;

procedure TForm1.Updatemac1Click(Sender: TObject);
 var s1,s4:string;
   snmp : tsnmpsend;
begin
     ToolTipsDBGrid1.Tag := 1;
     snmp := tsnmpsend.Create;
     try
       snmp.Query.Clear;
       snmp.Query.Community:='ubnt_mlink54';
       snmp.TargetHost := Modemsip_address.AsString;
       snmp.Query.PDUType := PDUGetRequest;
       s1:='1.2.840.10036.1.1.1.1.5';
       snmp.Query.MIBAdd(s1,'',ASN1_NULL);
       if snmp.SendRequest then
         begin
           Application.ProcessMessages;
           s4:=snmp.Reply.MIBGet(s1);
           Query_3.Close;
           Query_3.SQL.Text := 'Update modems set mac_address='+QuotedStr(s4)+' where id_modem='+Modemsid_modem.AsString;
           Query_3.ExecSQL;
           Query_3.Close;
         end;
     finally
       snmp.Free;
     end;
     ToolTipsDBGrid1.Tag := 0;
end;


procedure TForm1.Button3Click(Sender: TObject);
var S: TStringList; counter:byte;
begin
  ToolTipsDBGrid1.Tag := 1;
  S := TStringList.Create;
  S.Add('wireless.1.mac_acl.status=disabled');
  S.Add('wireless.1.mac_acl.policy=allow');
  Modems.First;
  counter := 1;
  while not Modems.Eof do
  begin
    if Length(Modemsmac_address.AsString) > 5 then
    begin
      S.Add('wireless.1.mac_acl.'+IntToStr(counter)+'.comment='+Modemsname.AsString);
      S.Add('wireless.1.mac_acl.'+IntToStr(counter)+'.mac='+Modemsmac_address.AsString);
      S.Add('wireless.1.mac_acl.'+IntToStr(counter)+'.status=enabled');
      inc(counter);
    end;
    Application.ProcessMessages;
    Modems.Next;
  end;
  S.SaveToFile(ExtractFilePath(Application.ExeName)+'mac_acl.txt');
  S.Free;
  ToolTipsDBGrid1.Tag := 0;
end;

procedure TForm1.Label3DblClick(Sender: TObject);
begin
  Button3.Enabled := true;
  btnMAC.Enabled := true;
  Button6.Enabled := true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if ToolTipsDBGrid1.Tag = 0 then
    N1Click(Sender);
end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
  CheckBox3.Checked := true;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
ToolTipsDBGrid1.Tag := 1;
  Modems.Close;
  case RadioGroup1.ItemIndex of
   0: Modems.SQL.Text := 'select * from modems as t1 LEFT OUTER JOIN ptx as t2 ON t1.id_modem=t2.id_modem';
   1: Modems.SQL.Text := 'select * from modems as t1 RIGHT OUTER JOIN ptx as t2 ON t1.id_modem=t2.id_modem';
  end;
  Modems.Open;
  ToolTipsDBGrid1.tag :=0;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
 Timer1.Enabled :=   CheckBox4.Checked;
end;

procedure ExportToExcel(Var Grid: TToolTipsDBGrid);
var
  bm: TBookmark;
  col, row: Integer;
  sline: string;
  mem: TMemo;
  Layout: array[0.. KL_NAMELENGTH] of char;
  ExcelApp, WorkBook: Variant;
begin
//установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Экспорт невозможен. Excel не установлен.');
    exit;
  end;

 // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');


  WorkBook := ExcelApp.WorkBooks.Add;
  Screen.Cursor := crHourglass;
  Grid.DataSource.DataSet.DisableControls;
  bm := Grid.DataSource.DataSet.GetBookmark;
  Grid.DataSource.DataSet.First;

  // Сперва отправляем данные в memo
  // работает быстрее, чем отправлять их напрямую в Excel
  mem := TMemo.Create(Form1);
  mem.Parent := Form1;
  mem.Visible := false;
  mem.Clear;
  sline := '';

  // добавляем информацию для имён колонок
  for col := 0 to Grid.Columns.Count-1 do
    sline := sline + Grid.Columns[col].Title.Caption + #9;
  mem.Lines.Add(sline);

  // получаем данные из DBGrid
  for row := 0 to Grid.DataSource.DataSet.RecordCount-1 do
  begin
    sline := '';
    for col := 0 to Grid.Columns.Count-1 do
      if Grid.Columns[col].Field.AsString='30.12.1899' then
        sline := sline + #9
      else
        sline := sline + Grid.Columns[col].Field.AsString + #9;
    mem.Lines.Add(sline);
    Grid.DataSource.DataSet.Next;
  end;

  // копируем данные в clipboard
  mem.SelectAll;
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  mem.CopyToClipboard;
  mem.Free;


  // отправляем их в Excel

  Workbook.WorkSheets[1].Paste;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Size := 11;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Bold := true;
  Workbook.WorkSheets[1].Columns.AutoFit;
  Workbook.WorkSheets[1].Range['A1',EmptyParam].Select;

  ExcelApp.Visible := true;

  Grid.DataSource.DataSet.GotoBookmark(bm);
  Grid.DataSource.DataSet.FreeBookmark(bm);
  Grid.DataSource.DataSet.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ToolTipsDBGrid1.Tag := 1;
  ExportToExcel(ToolTipsDBGrid1);
  ToolTipsDBGrid1.Tag := 0;
end;

procedure TForm1.modems_avg1CalcFields(DataSet: TDataSet);
begin
  ToolTipsDBGrid1.Tag := 1;
  Query.Close;
  Query.sql.Text := 'Select avg(signal_level) from statss where id_modem='+DataSet.Fields[0].AsString+
    ' and date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+' and signal_level>-100';
  Query.Open;
  modems_avgavg_signal.AsInteger := Round(Query.Fields[0].AsFloat);
  Query.Close;
  ToolTipsDBGrid1.Tag := 0;
end;


procedure ExportToExcel_dataset(Var Grid: TADOQuery);
var
  bm: TBookmark;
  col, row: Integer;
  sline: string;
  mem: TMemo;
  Layout: array[0.. KL_NAMELENGTH] of char;
  ExcelApp, WorkBook: Variant;
begin
//установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Экспорт невозможен. Excel не установлен.');
    exit;
  end;

 // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');


  WorkBook := ExcelApp.WorkBooks.Add;
  Screen.Cursor := crHourglass;
  Grid.DisableControls;
  bm := Grid.GetBookmark;
  Grid.First;

  // Сперва отправляем данные в memo
  // работает быстрее, чем отправлять их напрямую в Excel
  mem := TMemo.Create(Form1);
  mem.Parent := Form1;
  mem.Visible := false;
  mem.Clear;
  sline := '';

  // добавляем информацию для имён колонок
  for col := 0 to Grid.FieldCount-1 do
    sline := sline + Grid.Fields[col].FieldName + #9;
  mem.Lines.Add(sline);

  // получаем данные из DBGrid
  for row := 0 to Grid.RecordCount-1 do
  begin
    sline := '';
    for col := 0 to Grid.FieldCount-1 do
        sline := sline + Grid.Fields[col].AsString + #9;
    mem.Lines.Add(sline);
    Grid.Next;
  end;

  // копируем данные в clipboard
  mem.SelectAll;
  // переключаем раскладку на русский
  LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
  mem.CopyToClipboard;
  mem.Free;


  // отправляем их в Excel

  Workbook.WorkSheets[1].Paste;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Size := 11;
  Workbook.WorkSheets[1].Range['A1','AA1'].Font.Bold := true;
  Workbook.WorkSheets[1].Columns.AutoFit;
  Workbook.WorkSheets[1].Range['A1',EmptyParam].Select;

  ExcelApp.Visible := true;

  Grid.GotoBookmark(bm);
  Grid.FreeBookmark(bm);
  Grid.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ToolTipsDBGrid1.Tag := 1;
  modems_avg.Open;
  ExportToExcel_Dataset(modems_avg);
  modems_avg.Close;
  ToolTipsDBGrid1.Tag := 0;
end;

procedure TForm1.Button6Click(Sender: TObject);
var s1,s4:string;
   snmp : tsnmpsend;
   s,s_1,s_2: TStrings;
begin
  ToolTipsDBGrid1.Tag := 1;
  S := TStringList.Create;
  s_1 := TStringList.Create;
//  s_2 := TStringList.Create;
//  s_2.Add('ip neigh flush all');
  Modems.First;
  while not Modems.Eof do
  begin
    if (Length(Modemsmac_address.AsString) > 5)and(Length(Modemsip_address.AsString) > 5) then
    begin
      S.Add('arp -s '+Modemsip_address.AsString+' '+Modemsmac_address.AsString);
      s_1.Add('arp -s '+Modemsip_address.AsString+' '+StringReplace(Modemsmac_address.AsString,':','-',[rfReplaceAll]));
      S.Add('arp -s '+Modemsip_address_1.AsString+' '+Modemsmac_address.AsString);
      s_1.Add('arp -s '+Modemsip_address_1.AsString+' '+StringReplace(Modemsmac_address.AsString,':','-',[rfReplaceAll]));
//      s_2.Add('arp -d '+ Modemsip_address.AsString);
//      s_2.Add('arp -d '+ Modemsip_address_1.AsString);
    end;
    Application.ProcessMessages;
    Modems.Next;
  end;
  S.SaveToFile(ExtractFilePath(Application.ExeName)+'arp_add.sh');
  s_1.SaveToFile(ExtractFilePath(Application.ExeName)+'arp_add.cmd');
  s_2.SaveToFile(ExtractFilePath(Application.ExeName)+'arp_del_all.sh');
  S.Free;
  s_1.Free;
//  s_2.Free;
  ToolTipsDBGrid1.Tag := 0;

end;

procedure TForm1.WLANConnections1Click(Sender: TObject);
var tmpDateTime: TDateTime;
    awg_count: word;
begin
  if Modemsis_access_point.AsInteger=0 then exit;
  flagWLANConnections := true;
  ToolTipsDBGrid1.Tag := 1;
  Query.Close;
  Query.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr(Modemsmac_address.AsString)+' Group by t';
  Query.Open;
  Query.FindLast;
  if Query.RecordCount = 0 then exit;
  ProgressBar1.Min := 0;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Query.RecordCount;
  Query.First;
  awg_count :=0;
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('График изменения количества клиентов на базовой станции '+Modemsname.Asstring);
  Chart1.Series[0].Active:= false;
  Chart1.Series[1].Active:= false;
  Chart1.Series[2].Active:= false;
  Chart1.Series[3].Active:= false;
  Chart1.Series[4].Active:= false;
  Chart1.Series[5].Active:= false;
  Chart1.Series[6].Active:= false;
  Chart1.Series[7].Active:= false;
  Chart1.Series[8].Active:= false;  

  while not Query.Eof do
  begin
    if CheckBox2.Checked then
    begin
      ProgressBar1.Position := ProgressBar1.Position +1;
      Application.ProcessMessages;
    end;
      tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
      Chart1.Series[0].AddXY(tmpDateTime,Query.Fields[2].AsInteger,'',Modemscolor.AsInteger);
      awg_count := awg_count + Query.Fields[2].AsInteger;
    Query.Next;
  end;
  ProgressBar1.Position := 0;
  awg_count := awg_count div Query.RecordCount;
  Label8.Caption :='Среднее кол-во:';
  lAvgLevel.Caption := IntToStr(awg_count);
  Query.Close;

  Chart1.Series[0].Active := true;

  ToolTipsDBGrid1.Tag := 0;
end;

procedure TForm1.NqualDayClick(Sender: TObject);
var dt:TDate;
    ins:boolean;
    sum_level, count_level, success_ping, fail_ping:integer;begin
     if frmSelectDate.ShowModal()=mrOK then begin
        if startDate<1 then begin
           ShowMessage('Начальная дата для создания отчета не указана');
           exit;
        end;
        if endDate<1 then begin
           ShowMessage('Конечная дата для создания отчета не указана');
           exit;
        end;
        if startdate>enddate then begin
           ShowMessage('Конечная дата не может быть меньше, чем начальная');
           exit;
        end;
        if qryModems.Active=false then qryModems.Active:=true;
        // Создаем книгу excel
        
        // Смотрим все смены из выбранных
        dt:=startDate;
        ins:=true;
        while dt<=endDate do begin
             qryModems.First;
             while not qryModems.Eof do begin
                 if query.Active then query.Active:=false;
                 query.SQL.Clear;
                 Query.sql.Add('select signal_level, status from statss ');
                 query.SQL.Add(' where (date='+#39+DateToStr(dt)+#39+' ) and (id_modem='+qryModemsid_modem.AsString+')');
                 query.Active:=true;
                 sum_level:=0;
                 success_ping:=0;
                 fail_ping:=0;
                 while not Query.Eof do begin
                       if (query.FieldByName('status').AsInteger=2) then begin
                          if query.FieldByName('signal_level').AsInteger>-100 then begin
                             inc(success_ping);
                             sum_level:=sum_level+query.FieldByName('signal_level').AsInteger;
                          end else begin
                             inc(fail_ping);
                          end;
                       end;
                 end;
                 
                 qryModems.Next;
             end;
             dt:=dt+1;
             ins:=false;
        end;
     end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  count_all, count_less_78, count_more_78, count_fail: Longword;
  avg_SIGNAL_LEVEL: string;
begin
  Button7.Enabled := false;
  Application.ProcessMessages;

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
   ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2';
  Query.Open;
  count_all := Query.Fields[0].AsInteger;

  Query.Close;
  Query.SQL.Text := 'SELECT avg(signal_level) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 and signal_level>-100';
  Query.Open;
  avg_SIGNAL_LEVEL := FloatToStrF(Query.Fields[0].AsFloat,ffFixed,7,2);

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 and signal_level>=-78';
  Query.Open;
  count_more_78 := Query.Fields[0].AsInteger;

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 and signal_level<-78 and signal_level>-100';
  Query.Open;
  count_less_78 := Query.Fields[0].AsInteger;

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 and signal_level=-100';
  Query.Open;
  count_fail := Query.Fields[0].AsInteger;
  Query.Close;

  lbl_more_78.Caption := ' >= 78 dB: '+IntToStr(count_more_78)+' ('+FloatToStrF(count_more_78/count_all*100,ffFixed,7,2)+' %)';
  lbl_less_78.Caption := '  < 78 dB: '+IntToStr(count_less_78)+' ('+FloatToStrF(count_less_78/count_all*100,ffFixed,7,2)+' %)';
lbl_no_answer.Caption := 'Нет ответа: '+IntToStr(count_fail)+' ('+FloatToStrF(count_fail/count_all*100,ffFixed,7,2)+' %)';
   Lbl_avg.Caption := 'Средний уровень сигнала: '+ avg_SIGNAL_LEVEL+' dB';
  Button7.Enabled := true;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  count_all, count_less_78, count_more_78, count_fail: Longword;
  avg_SIGNAL_LEVEL: string;
begin
  Button9.Enabled := false;
  Application.ProcessMessages;

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and id_modem='+Modemsid_modem.AsString+' and status=2';
  Query.Open;
  count_all := Query.Fields[0].AsInteger;

  Query.Close;
  Query.SQL.Text := 'SELECT avg(signal_level) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+' and id_modem='+Modemsid_modem.AsString+' and status=2 and (signal_level>-100)';
  Query.Open;
  avg_SIGNAL_LEVEL := FloatToStrF(Query.Fields[0].AsFloat,ffFixed,7,2);

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+' and id_modem='+Modemsid_modem.AsString+' and status=2 and signal_level>=-78';
  Query.Open;
  count_more_78 := Query.Fields[0].AsInteger;

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+' and id_modem='+Modemsid_modem.AsString+' and status=2 and signal_level<-78 and signal_level>-100';
  Query.Open;
  count_less_78 := Query.Fields[0].AsInteger;

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) FROM `statss` WHERE date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+' and id_modem='+Modemsid_modem.AsString+' and status=2 and signal_level=-100';
  Query.Open;
  count_fail := Query.Fields[0].AsInteger;
  Query.Close;
  try
  lbl_more_78.Caption := ' >= 78 dB: '+IntToStr(count_more_78)+' ('+FloatToStrF(count_more_78/count_all*100,ffFixed,7,2)+' %)';
  lbl_less_78.Caption := '  < 78 dB: '+IntToStr(count_less_78)+' ('+FloatToStrF(count_less_78/count_all*100,ffFixed,7,2)+' %)';
lbl_no_answer.Caption := 'Нет ответа: '+IntToStr(count_fail)+' ('+FloatToStrF(count_fail/count_all*100,ffFixed,7,2)+' %)';
   Lbl_avg.Caption := 'Средний уровень сигнала: '+ avg_SIGNAL_LEVEL+' dB';
   except
   end;
  Button9.Enabled := true;

end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  Button10.Visible := not Button10.Visible
end;

procedure TForm1.Button10Click(Sender: TObject);

begin
  if not CheckBox3.Checked then begin ShowMessage('Задайте период!');exit end;
  Button10.Enabled := false;
  Application.ProcessMessages;

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_all  FROM statss WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and id_modem='+Modemsid_modem.AsString+' and status=2 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);


  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, avg(signal_level) as avg_SIGNAL_LEVEL FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and id_modem='+Modemsid_modem.AsString+' and signal_level>-100 and status=2 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_more_78 FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and id_modem='+Modemsid_modem.AsString+' and status=2 and signal_level>=-78 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_less_78 FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and id_modem='+Modemsid_modem.AsString+' and status=2 and signal_level<-78 and signal_level>-100 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_fail FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and id_modem='+Modemsid_modem.AsString+' and status=2 and signal_level=-100 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);
  Query.Close;
  Button10.Enabled := true;


end;

procedure TForm1.Button110Click(Sender: TObject);

begin
  if not CheckBox3.Checked then begin ShowMessage('Задайте период!');exit end;
  Button10.Enabled := false;
  Application.ProcessMessages;

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_all  FROM statss WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and status=2 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);


  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, avg(signal_level) as avg_SIGNAL_LEVEL FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and signal_level>-100 and status=2 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_more_78 FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and status=2 and signal_level>=-78 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_less_78 FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and status=2 and signal_level<-78 and signal_level>-100 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT date, id_modem, count(*) as count_fail FROM `statss` WHERE (date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+ ' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') '+
    ' and status=2 and signal_level=-100 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);
  Query.Close;
  Button10.Enabled := true;
end;

procedure TForm1.Button11Click(Sender: TObject);

var tmpDateTime: TDateTime;
    Query123: TADOQuery;
begin
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;
  flagWLANConnections := true;
  ToolTipsDBGrid1.Tag := 1;

  Chart1.Series[0].Active:= false;
  Chart1.Series[1].Active:= false;
  Chart1.Series[2].Active:= false;
  Chart1.Series[3].Active:= false;
  Chart1.Series[4].Active:= false;
  Chart1.Series[5].Active:= false;
  Chart1.Series[6].Active:= false;
  Chart1.Series[7].Active:= false;
  Chart1.Series[8].Active:= false;

  Query123.Connection.Close;
  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:8C:50:54')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    ProgressBar1.Min := 0;
    ProgressBar1.Position := 0;
    ProgressBar1.Max := Query123.RecordCount*20;
    Query123.First;
    Chart1.Series[4].Clear;
    Chart1.Series[4].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[4].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',65280);
      Query123.Next;
    end;
    Chart1.Series[4].Active := true;
  end;


  Query123.Connection.Close; Query123.Free;
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;

  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:8C:50:8B')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    Query123.First;
    Chart1.Series[6].Clear;
    Chart1.Series[1].Clear;
    Chart1.Title.Text.Clear;
    Chart1.Title.Text.Add('График изменения количества клиентов на базовых станциях');
    Chart1.Series[6].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[6].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',16711680);
      Query123.Next;
    end;
    Chart1.Series[6].Active := true;
  end;


  Query123.Connection.Close; Query123.Free;
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;

  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:98:D2:5D')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    Query123.First;
    Chart1.Series[2].Clear;
    Chart1.Series[2].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[2].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',32768);
      Query123.Next;
    end;
    Chart1.Series[2].Active := true;
  end;

  Query123.Connection.Close; Query123.Free;
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;

  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:8C:4F:3D')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    Query123.First;
    Chart1.Series[3].Clear;
    Chart1.Series[3].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[3].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',255);
      Query123.Next;
    end;
    Chart1.Series[3].Active := true;
  end;


  Query123.Connection.Close; Query123.Free;
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;

  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:8C:4F:2C')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    Query123.First;
    Chart1.Series[5].Clear;
    Chart1.Series[5].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[5].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',808080);
      Query123.Next;
    end;
    Chart1.Series[5].Active := true;
  end;

  Query123.Connection.Close; Query123.Free;
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;

  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:28:8A:A9')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    Query123.First;
    Chart1.Series[7].Clear;
    Chart1.Series[7].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[7].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',clYellow);
      Query123.Next;
    end;
    Chart1.Series[7].Active := true;
  end;

  Query123.Connection.Close; Query123.Free;
  Query123 := TADOQuery.Create(Form1);
  Query123.Connection := ADOConnection_query;

  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('00:27:22:28:49:3B')+' Group by t';
  Query123.Open;
  Query123.FindLast;
  if Query123.RecordCount > 0 then begin
    Query123.First;
    Chart1.Series[8].Clear;
    Chart1.Series[8].Active:= false;
    while not Query123.Eof do
    begin
      if CheckBox2.Checked then
      begin
        ProgressBar1.Position := ProgressBar1.Position +1;
        Application.ProcessMessages;
      end;
        tmpDateTime := StrToDateTime(Query123.Fields[0].AsString+' '+Query123.Fields[1].AsString);
        Chart1.Series[8].AddXY(tmpDateTime,Query123.Fields[2].AsInteger,'',clAqua);
      Query123.Next;
    end;
    Chart1.Series[8].Active := true;
  end;

  ToolTipsDBGrid1.Tag := 0;
  ADOConnection_Query.Close;
  Query123.Free;
  ProgressBar1.Position := 0;
end;

procedure TForm1.NFailMapClick(Sender: TObject);
begin
  frmMapSettings := TfrmMapSettings.Create(Application);
  frmMapSettings.Show;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  count_all, count_less_78, count_more_78, count_fail: Longword;
begin

  Query.Close;
  Query.SQL.Text := 'SELECT avg(signal_level), date FROM `statss` WHERE (date between '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+')'+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 and signal_level>-100 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) as COUNT_ALL, date FROM `statss` WHERE (date between '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+')'+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
  Query.SQL.Text := 'SELECT count(*) as COUNT_FAIL, date FROM `statss` WHERE (date between '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+')'+
    ' and ((id_modem<37 and id_modem>4) or id_modem>140) and status=2 and signal_level=-100 group by date';
  Query.Open;
  ExportToExcel_dataset(Query);

  Query.Close;
end;

procedure TForm1.Label12Click(Sender: TObject);
begin
  Button12.Visible := not Button12.Visible
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Query_2.Close;
  Query_2.SQL.Text := 'delete from tmp_stats';
  Query_2.ExecSQL;
  Query_2.Close;

  Query_2.Close;
  Query_2.SQL.Text := 'Insert into tmp_stats select * from statss ss where ((id_modem<37 and id_modem>4) or (id_modem>140 and id_modem<150))'+
    ' and status=2 and((ss.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and ss.time<''7:00:00'''+') or (ss.date='+ QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date-1))+
    ' and ss.time>''19:30:00'''+'))';
  Query_2.ExecSQL;
  Query_2.Close;


  Query.Close;
  Query.SQL.Text := 'SELECT mm.id_modem, mm.name, count(mm.id_modem) as COUNT_ALL FROM modems mm LEFT JOIN tmp_stats ss ON '+
    'ss.id_modem=mm.id_modem group by mm.id_modem having (mm.id_modem<37 and mm.id_modem>4) or (mm.id_modem>140 and mm.id_modem<150)';
  Query.Open;


  Query_3.Close;
  Query_3.SQL.Text := 'SELECT mm.id_modem, mm.name, count(ss.id_modem) as COUNT_FAIL FROM modems mm LEFT JOIN tmp_stats ss ON '+
    'ss.id_modem=mm.id_modem and ss.signal_level=-100 group by mm.id_modem having (mm.id_modem<37 and mm.id_modem>4) or (mm.id_modem>140 and mm.id_modem<150)';
  Query_3.Open;

  Query_2.Close;
  Query_2.SQL.Text := 'delete from stats_fail_auto_tmp';
  Query_2.ExecSQL;
  Query_2.Close;

  while not Query_3.Eof do
  begin
    if Query.FieldByName('id_modem').AsInteger < Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query.Next;
    end
    else if Query.FieldByName('id_modem').AsInteger > Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query_3.Next;
    end;
    if Query.FieldByName('id_modem').AsInteger = Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query_2.SQL.Text := 'insert into stats_fail_auto_tmp(name, percent, date) values('+
        QuotedStr(Query.FieldByName('name').AsString) +','+
        StringReplace(FloatToStrF(Query_3.FieldByName('COUNT_FAIL').AsInteger*100/Query.FieldByName('COUNT_ALL').AsInteger,ffFixed,4,2),',','.',[rfReplaceAll])+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+')';
      Query_2.ExecSQL;
      Query_2.Close;
    end;
    Query.Next;
    Query_3.Next;
  end;

  Query_3.Close;
  Query.Close;

  Query_2.SQL.Text := 'select name, percent, date from stats_fail_auto_tmp order by name';
  Query_2.Open;
  ExportToExcel_dataset(Query_2);

  Query_2.Close;
  Query_2.SQL.Text := 'delete from tmp_stats';
  Query_2.ExecSQL;
  Query_2.Close;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Query_2.Close;
  Query_2.SQL.Text := 'delete from tmp_stats';
  Query_2.ExecSQL;
  Query_2.Close;

  Query_2.Close;
  Query_2.SQL.Text := 'insert into tmp_stats select * from statss ss where ((id_modem<37 and id_modem>4) or (id_modem>140 and id_modem<150)) and status=2 and ss.date = '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+
    ' and ss.time>''7:30:00'' and ss.time<''19:30:00''';
  Query_2.ExecSQL;
  Query_2.Close;


  Query.Close;
  Query.SQL.Text := 'SELECT mm.id_modem, mm.name, count(mm.id_modem) as COUNT_ALL FROM modems mm LEFT JOIN tmp_stats ss ON '+
    'ss.id_modem=mm.id_modem group by mm.id_modem having (mm.id_modem<37 and mm.id_modem>4) or (mm.id_modem>140 and mm.id_modem<150)';
  Query.Open;


  Query_3.Close;
  Query_3.SQL.Text := 'SELECT mm.id_modem, mm.name, count(ss.id_modem) as COUNT_FAIL FROM modems mm LEFT JOIN tmp_stats ss ON '+
    'ss.id_modem=mm.id_modem and ss.signal_level=-100 group by mm.id_modem having (mm.id_modem<37 and mm.id_modem>4) or (mm.id_modem>140 and mm.id_modem<150)';
  Query_3.Open;

  Query_2.Close;
  Query_2.SQL.Text := 'delete from stats_fail_auto_tmp';
  Query_2.ExecSQL;
  Query_2.Close;

  while not Query_3.Eof do
  begin
    if Query.FieldByName('id_modem').AsInteger < Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query.Next;
    end
    else if Query.FieldByName('id_modem').AsInteger > Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query_3.Next;
    end;
    if Query.FieldByName('id_modem').AsInteger = Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query_2.SQL.Text := 'insert into stats_fail_auto_tmp(name, percent,date) values('+
        QuotedStr(Query.FieldByName('name').AsString) +','+
        StringReplace(FloatToStrF(Query_3.FieldByName('COUNT_FAIL').AsInteger*100/Query.FieldByName('COUNT_ALL').AsInteger,ffFixed,4,2),',','.',[rfReplaceAll])+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+')';
      Query_2.ExecSQL;
      Query_2.Close;
    end;
    Query.Next;
    Query_3.Next;
  end;

  Query_3.Close;
  Query.Close;

  Query_2.SQL.Text := 'select name, percent, date from stats_fail_auto_tmp order by name';
  Query_2.Open;
  ExportToExcel_dataset(Query_2);

  Query_2.Close;
  Query_2.SQL.Text := 'delete from tmp_stats';
  Query_2.ExecSQL;
  Query_2.Close;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  Query_2.Close;
  Query_2.SQL.Text := 'delete from tmp_stats';
  Query_2.ExecSQL;
  Query_2.Close;

  Query_2.Close;
  Query_2.SQL.Text := 'insert into tmp_stats select * from statss ss where ((id_modem<37 and id_modem>4) or (id_modem>140 and id_modem<150)) and status=2 and ss.date = '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date));
  Query_2.ExecSQL;
  Query_2.Close;


  Query.Close;
  Query.SQL.Text := 'SELECT mm.id_modem, mm.name, count(mm.id_modem) as COUNT_ALL FROM modems mm LEFT JOIN tmp_stats ss ON '+
    'ss.id_modem=mm.id_modem group by mm.id_modem having (mm.id_modem<37 and mm.id_modem>4) or (mm.id_modem>140 and mm.id_modem<150)';
  Query.Open;


  Query_3.Close;
  Query_3.SQL.Text := 'SELECT mm.id_modem, mm.name, count(ss.id_modem) as COUNT_FAIL FROM modems mm LEFT JOIN tmp_stats ss ON '+
    'ss.id_modem=mm.id_modem and ss.signal_level=-100 group by mm.id_modem having (mm.id_modem<37 and mm.id_modem>4) or (mm.id_modem>140 and mm.id_modem<150)';
  Query_3.Open;

  Query_2.Close;
  Query_2.SQL.Text := 'delete from stats_fail_auto_tmp';
  Query_2.ExecSQL;
  Query_2.Close;

  while not Query_3.Eof do
  begin
    if Query.FieldByName('id_modem').AsInteger < Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query.Next;
    end
    else if Query.FieldByName('id_modem').AsInteger > Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query_3.Next;
    end;
    if Query.FieldByName('id_modem').AsInteger = Query_3.FieldByName('id_modem').AsInteger then
    begin
      Query_2.SQL.Text := 'insert into stats_fail_auto_tmp(name, percent,date) values('+
        QuotedStr(Query.FieldByName('name').AsString) +','+
        StringReplace(FloatToStrF(Query_3.FieldByName('COUNT_FAIL').AsInteger*100/Query.FieldByName('COUNT_ALL').AsInteger,ffFixed,4,2),',','.',[rfReplaceAll])+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+')';
      Query_2.ExecSQL;
      Query_2.Close;
    end;
    Query.Next;
    Query_3.Next;
  end;

  Query_3.Close;
  Query.Close;

  Query_2.SQL.Text := 'select name, percent, date from stats_fail_auto_tmp order by name';
  Query_2.Open;
  ExportToExcel_dataset(Query_2);

  Query_2.Close;
  Query_2.SQL.Text := 'delete from tmp_stats';
  Query_2.ExecSQL;
  Query_2.Close;
end;

procedure TForm1.lAvgLevelDblClick(Sender: TObject);
begin
  Button16.Visible := not Button16.Visible
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Query_2.Close;
  Query_2.SQL.Clear;
  Query_2.SQL.Add('Update statss set status=1 where id_modem='+Modemsid_modem.AsString);
  Query_2.SQL.Add('and signal_level=-100 and date='+QuotedStr(FormatDateTime('yyy-mm-dd',MonthCalendar1.Date)));
  Query_2.SQL.Add('and time>'+QuotedStr(FormatDateTime('hh:mm',DateTimePicker3.Time)));
  Query_2.SQL.Add('and time<'+QuotedStr(FormatDateTime('hh:mm',DateTimePicker4.Time)));
  Query_2.ExecSQL;
  Query_2.Close;
end;

function ptx_ip(modem_ip: string):string;
var tmp: string;
begin
  tmp := modem_ip[Length(modem_ip)];
  if modem_ip[Length(modem_ip)-1] <> '.' then
  begin
    tmp := modem_ip[Length(modem_ip)-1]+tmp;
    if modem_ip[Length(modem_ip)-2] <> '.' then
      tmp := modem_ip[Length(modem_ip)-2]+tmp
  end;
  Result := '10.70.122.'+tmp;
end;

procedure TForm1.Ping1Click(Sender: TObject);
begin
 if Modems.FieldByName('ip_address').AsString <>'' then
 begin
  ShellExecute(0,nil,PChar('cmd.exe'),pchar('/K ping -t '+Modems.FieldByName('ip_address').AsString),nil,SW_restore);
  ShellExecute(0,nil,PChar('cmd.exe'),pchar('/K ping -t '+ptx_ip(Modems.FieldByName('ip_address').AsString)),nil,SW_restore);
 end
 else
   ShowMessage('No ip');

end;

function getdatetime(s:string):TDateTime;
var i: byte;
    s_tmp: string;
    time_tmp: TTime;
    Date_tmp: TDate;
begin
  if s='' then begin Result := 0; exit;end;
  s_tmp:='';
  i := length(s);
  while (s[i]<>' ')and(i>0) do
  begin
    s_tmp := s[i] + s_tmp;
    dec(i);
  end;
  try time_tmp := StrToTime(s_tmp);
  except Result :=0;exit;
  end;
    if time_tmp>StrToTime('19:30:00') then Date_tmp := Form1.MonthCalendar1.Date-1
    else Date_tmp := Form1.MonthCalendar1.Date;
  try Result := StrToDateTime(FormatDateTime('dd.mm.yyyy',Date_tmp)+' '+FormatDateTime('hh:mm:ss',time_tmp));
  except Result :=0;
  end;
end;

procedure TForm1.GPSARRIVE1Click(Sender: TObject);
label label1;
type TArrayString = array [0..254] of AnsiChar;
var
 SSH: TCryptSession;
 Data: TArrayString;
 DataString,tmpStr: string;
 LenData,
 BytePushed,
 BytePoped: Longint;
 ListBox1: TStrings;
 i,j, currentNumAutoOrExcav: integer;
 tmpDateTime: TDateTime;

begin
  if (Copy(Modemsname.AsString,1,1)<>'A')and(Copy(Modemsname.AsString,1,1)<>'E')then begin
    ShowMessage('Выберите авто или экскаватор');
    exit;
  end;
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('GPS ARRIVE для '+Modemsname.Asstring);
  Chart1.Series[0].Active:= false;
  Chart1.Series[1].Active:= false;
  Chart1.Series[2].Active:= false;
  Chart1.Series[3].Active:= false;
  Chart1.Series[4].Active:= false;
  Chart1.Series[5].Active:= false;
  Chart1.Series[6].Active:= false;
  Chart1.Series[7].Active:= false;
  Chart1.Series[8].Active:= false;


  cryptInit;

   SSH := SSH_Client('10.70.121.3', 'lgktech', 'linux1');
   if SSH = nil then begin ShowMessage('SSH=nil');   Exit;end;

  if Copy(Modemsname.AsString,1,1)='A' then begin
     currentNumAutoOrExcav := StrToInt(Copy(Modemsname.AsString,2,length(Modemsname.AsString)-1));
  end else begin
     currentNumAutoOrExcav := StrToInt(Copy(Modemsname.AsString,3,length(Modemsname.AsString)-2));
  end;
  Chart1.Series[0].AddXY(MonthCalendar1.Date,currentNumAutoOrExcav-1);
  Chart1.Series[0].AddXY(MonthCalendar1.Date,currentNumAutoOrExcav+1);

  //выбираем из файла транзакций за выбранную дату и по 2 сменам смену все GPS_ARRIVE по авто
  //Memo11.Clear;
  SSH.FlushData; // обязательно нужно использовать перед вызовом PopData
  Sleep(800);
  LenData := 255;
  FillChar(Data,255,#0);
  BytePoped := SSH.PopData(addr(Data), LenData);
  // Memo11.Lines.Add(Data);
  //вычищаем стек SSH
   while BytePoped > 0 do begin
    LenData := 255;
    FillChar(Data,255,#0);
    BytePoped := SSH.PopData(addr(Data), LenData);
   end;
  //Формируем запрос и посылаем серверу
  FillChar(Data,255,#0);
  DataString := 'cat /local/clientcode/lgk/opns/sh'+formatDateTime('yymmdd',MonthCalendar1.Date)+
     'n.transact |grep "'+Modemsname.AsString+' .*GPS_ARR" && cat /local/clientcode/lgk/opns/sh'+formatDateTime('yymmdd',MonthCalendar1.Date)+
     'd.transact |grep "'+Modemsname.AsString+' .*GPS_ARR"'#13;
  move(Datastring[1],Data,Length(DataString));
  LenData := length(DataString);
  SSH.PushData(addr(Data), LenData, BytePushed);
  SSH.FlushData;
  Sleep(800);
  //извлекаем мусор
  FillChar(Data,255,#0);
  BytePoped := SSH.PopData(addr(Data), LenData+12);
  BytePoped := SSH.PopData(addr(Data), LenData+6);

  ListBox1 := TStringList.Create;
 BytePoped := 1;
 tmpStr := '';
 while BytePoped > 0 do begin
   LenData := 1;
   FillChar(Data,255,#0);
   BytePoped := SSH.PopData(addr(Data), LenData);
   if (Data[0]<>#13)and(Data[0]<>#10) then tmpStr:= tmpStr+Data[0]
   else
   begin
     if (Data[0]<>#10) then ListBox1.Add(tmpStr);
     tmpStr := '';
   end;
 end;
 //строим график по полученным данным
 if ListBox1.Count<>0 then
 begin
     for j:=0 to ListBox1.Count-1 do
     begin
       tmpDateTime :=  getdatetime(ListBox1[j]);
       if tmpDateTime=0 then Continue;
       Chart1.Series[0].AddXY(tmpDateTime,currentNumAutoOrExcav,'',clGreen)
     end;
  end;

 FreeAndNil(SSH);
 cryptEnd;
 ListBox1.Free;
 Chart1.Series[0].Active := true;
end;

procedure TForm1.VNC1Click(Sender: TObject);
var i: word;
begin
  vncConf:=TStringList.Create;
  vncConf.LoadFromFile(ExtractFilePath(Application.ExeName)+'Template.vnc');
  for i:= 0 to vncConf.Count - 1 do begin
      if pos('Host=',vncConf[i])>0 then vncConf[i]:='Host='+Modemsip_address_1.AsString;
  end;
  vncConf.SaveToFile(ExtractFilePath(Application.ExeName)+'Template.vnc');
  FreeAndNil(vncConf);
  ShellExecute(0,nil,PChar(ExtractFilePath(Application.ExeName)+'VNC-Viewer.exe'),pchar('-WarnUnencrypted=0 -config Template.vnc'),nil,SW_restore);
end;

procedure TForm1.telnet1Click(Sender: TObject);
var IP:string;
    wnd1:integer;
begin

        IP:=Modemsip_address_1.AsString;
        ShellExecute(0,nil,PChar('cmd.exe'),pchar('/C "'+'telnet '+IP+'"'),nil,SW_restore);
        sleep(400);
        wnd1:=FindWindow(nil,PChar('Telnet '+IP));
        if wnd1>0 then begin
            sleep(1500);
            SendMessage(wnd1,WM_CHAR,ord('a'),0);
            SendMessage(wnd1,WM_CHAR,ord('d'),0);
            SendMessage(wnd1,WM_CHAR,ord('m'),0);
            SendMessage(wnd1,WM_CHAR,ord('i'),0);
            SendMessage(wnd1,WM_CHAR,ord('n'),0);
            SendMessage(wnd1,WM_CHAR,ord(#13),0);
            sleep(1500);
            SendMessage(wnd1,WM_CHAR,ord('m'),0);
            SendMessage(wnd1,WM_CHAR,ord('o'),0);
            SendMessage(wnd1,WM_CHAR,ord('d'),0);
            SendMessage(wnd1,WM_CHAR,ord('u'),0);
            SendMessage(wnd1,WM_CHAR,ord('l'),0);
            SendMessage(wnd1,WM_CHAR,ord('a'),0);
            SendMessage(wnd1,WM_CHAR,ord('r'),0);
            SendMessage(wnd1,WM_CHAR,ord(#13),0);
            sleep(1500);
            SendMessage(wnd1,WM_CHAR,ord('c'),0);
            SendMessage(wnd1,WM_CHAR,ord('h'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('c'),0);
            SendMessage(wnd1,WM_CHAR,ord('k'),0);
            SendMessage(wnd1,WM_CHAR,ord('h'),0);
            SendMessage(wnd1,WM_CHAR,ord('a'),0);
            SendMessage(wnd1,WM_CHAR,ord('r'),0);
            SendMessage(wnd1,WM_CHAR,ord('d'),0);
            SendMessage(wnd1,WM_CHAR,ord('w'),0);
            SendMessage(wnd1,WM_CHAR,ord('a'),0);
            SendMessage(wnd1,WM_CHAR,ord('r'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('r'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('v'),0);
            SendMessage(wnd1,WM_CHAR,ord(#13),0);

        end;
end;
procedure TForm1.Bullet1Click(Sender: TObject);
begin
   ShellExecute(0,nil,PChar('http://'+Modemsip_address.AsString),nil,nil,SW_restore);
end;

end.

