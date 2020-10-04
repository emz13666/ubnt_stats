unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, Provider, SqlExpr, DB, ExtCtrls, TeeProcs, TeEngine,
  Chart, StdCtrls, Grids, DBGrids, TTDBGrid, DBClient, DBLocal, DBLocalS,
  FMTBcd, Series, BubbleCh, ComCtrls, Clipbrd, ComObj, ActiveX, Menus, snmpsend,asn1util,
  ADODB, jpeg, shellapi, DelphiCryptlib, cryptlib,  updater, ReloadDriver, UnitMemo, MyUtils, UnitChangePTX;

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
    Bullet1: TMenuItem;
    xrebootPTX1: TMenuItem;
    TabSheet3: TTabSheet;
    ToolTipsDBGrid2: TToolTipsDBGrid;
    Button8: TButton;
    DataSource3: TDataSource;
    ReloadDrivers1: TMenuItem;
    VEIDUMP1: TMenuItem;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    TableLog: TADOQuery;
    TableLogdatetime: TDateTimeField;
    TableLogmessage: TWideStringField;
    btnVeiDump3: TButton;
    GPS1: TMenuItem;
    N4: TMenuItem;
    TimerNoZastavka: TTimer;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    telnetcheckhardwarerev1: TMenuItem;
    OMStip1: TMenuItem;
    btnChangePTX: TButton;
    FTPFileZilla1: TMenuItem;
    OMStip2: TMenuItem;
    Gpsgps1: TMenuItem;
    fullversion1: TMenuItem;
    ConnectCan1281: TMenuItem;
    ConnectCan1291: TMenuItem;
    OMS1: TMenuItem;
    netHubAll1: TMenuItem;
    netGoicAll1: TMenuItem;
    reset1: TMenuItem;
    OMS2: TMenuItem;
    Canclients1: TMenuItem;
    adapdrivers1: TMenuItem;
    telnet2: TMenuItem;
    GetImageVersion1: TMenuItem;
    CheckHardwarerev1: TMenuItem;
    proclist1: TMenuItem;
    servicesstartFTP01: TMenuItem;
    killprocdevicemonitorexe1: TMenuItem;
    startcerdispc1: TMenuItem;
    windowsptxAdministration1: TMenuItem;
    explorer1: TMenuItem;
    OMSsniff1: TMenuItem;
    OMSsniffMenu: TMenuItem;
    N9: TMenuItem;
    PressurePro1: TMenuItem;
    VIST1: TMenuItem;
    Vims1: TMenuItem;
    RoadRoughness1: TMenuItem;
    VEI1: TMenuItem;
    rmdirHubGoicReset1: TMenuItem;
    PTXPWRUP1: TMenuItem;
    killprocdeliteexe1: TMenuItem;
    killprocdeliteexe2: TMenuItem;
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
    procedure xrebootPTX1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ReloadDrivers1Click(Sender: TObject);
    procedure VEIDUMP1Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure btnVeiDump3Click(Sender: TObject);
    procedure GPS1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TimerNoZastavkaTimer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure telnetcheckhardwarerev1Click(Sender: TObject);
    procedure btnChangePTXClick(Sender: TObject);
    procedure FTPFileZilla1Click(Sender: TObject);
    procedure fullversion1Click(Sender: TObject);
    procedure telnet2Click(Sender: TObject);
    procedure OMSsniffMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type TSSHobj=class
    Fbusy : boolean;
    FCommand:shortString;
    FAnswer:TStrings;
    FSleepTm:integer;
    function SSH_Client(Server, Userid, Pass: string): TCryptSession;
    function execSSHCommand(command: shortString; Answer:TStrings; timeout:word): boolean;
  public
    SSH:TCryptSession;
    property busy: boolean read FBusy;
    property command:shortstring read FCommand write FCommand;
    property Answer: TStrings read FAnswer write FAnswer;
    property sleeptm:integer read FSleeptm write FSleeptm default 600;
    function Lock : boolean;
    procedure Unlock;
    constructor Create;
    destructor Destroy; override;
    function Execute : boolean;
end;

var
  Form1: TForm1;
  NamesModems: Array of string;
  flagWLANConnections: boolean;
  startDate, endDate : TDate;
  vncConf: TStrings;
implementation



uses unit3, MapSettings, MapFail;
{$R *.dfm}
{$R res_vnc.res}

procedure SetKey(Key:Integer);
begin
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP,0);
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY,0);
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP,0);
end;

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
var ExeFInfo:TFileInfo;
begin
//  Modems.CommandText := 'select * from modems as t1 LEFT OUTER JOIN ptx as t2 ON t1.id_modem=t2.id_modem';
  PageControl1.ActivePageIndex := 0;
  UpdateThread := TUpdater.Create(true);
  UpdateThread.LocationUpdate := '\\server2008\Зиновьев\projects\ubiquiti_stats\ubnt_stats';
  UpdateThread.Resume;

  try
    Modems.Open;
    TableLog.Open;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
  end;
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

  GetFileInfo(Application.ExeName,ExefInfo);
  Caption := Caption + '(ver. '+ IntToStr(ExeFInfo.FileVersion.MajorVersion)+'.'+
    IntToStr(ExeFInfo.FileVersion.MinorVersion)+'.'+
    IntToStr(ExeFInfo.FileVersion.Release)+'.'+
    IntToStr(ExeFInfo.FileVersion.Build)+')';
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
  ToolTipsDBGrid1.Tag := 0;
end;//try
ToolTipsDBGrid1.Tag := 0;
end;//procedure

procedure TForm1.Button1Click(Sender: TObject);
var tmpDateTime: TDateTime;
    successPing, failPing:integer;
    sumAvg: real;
    color1:TColor;
begin
  ToolTipsDBGrid1.Tag := 1;
  Label8.Caption := 'Средний уровень сигнала';
  flagWLANConnections := false;
  Chart1.ShowHint := true;
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
  try
    Query.Open;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
    exit;
  end;
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
  Chart1.Series[0].AddXY(tmpDateTime,-63);
  Chart1.Series[0].AddXY(tmpDateTime,-100);
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
try
  Book_Mark := Modems.GetBookmark;
  Modems.Close;
  Modems.Open;
  Modems.GotoBookmark(Book_Mark);
  Modems.FreeBookmark(Book_Mark);
except
  DBConnection.Close;
end;
end;

procedure TForm1.btnMACClick(Sender: TObject);
var s1,s4:string;
   snmp : tsnmpsend;
begin
  ToolTipsDBGrid1.Tag := 1;
  try
    Modems.First;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
    exit;
  end;


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
       ToolTipsDBGrid1.Tag := 0;
     end;
     ShowMessage('MAC-address: '+s4+' Updated ok.');
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
   0: Modems.SQL.Text := 'select * from modems as t1 LEFT OUTER JOIN ptx as t2 ON t1.id_modem=t2.id_modem order by t1.name';
   1: Modems.SQL.Text := 'select * from modems as t1 RIGHT OUTER JOIN ptx as t2 ON t1.id_modem=t2.id_modem order by t1.name';
  end;
  try
    Modems.Open;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
  end;
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
  try
    ExportToExcel(ToolTipsDBGrid1);
  finally
    ToolTipsDBGrid1.Tag := 0;
  end;
end;

procedure TForm1.modems_avg1CalcFields(DataSet: TDataSet);
begin
  ToolTipsDBGrid1.Tag := 1;
  Query.Close;
  Query.sql.Text := 'Select avg(signal_level) from statss where id_modem='+DataSet.Fields[0].AsString+
    ' and date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+' and signal_level>-100';
  try
    Query.Open;
    modems_avgavg_signal.AsInteger := Round(Query.Fields[0].AsFloat);
    Query.Close;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
  end;
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
  try
    modems_avg.Open;
    ExportToExcel_Dataset(modems_avg);
    modems_avg.Close;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
  end;
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
  try
    Query.Open;
    Query.FindLast;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query.Open;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query.Open;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query.Open;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query.Open;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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

 (* Query123.Connection.Close;
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
  end;    *)

  Query123.Connection.Close;
  Query123.sql.Text := 'select date, DATE_FORMAT(time,"%H:%i") t, count(distinct id_modem) from statss where date='+
    QuotedStr(FormatDateTime('yyyy-mm-dd', MonthCalendar1.Date))+
    ' and mac_ap='+QuotedStr('DC:9F:DB:0C:B6:4C')+' Group by t';
  try
    Query123.Open;
  except
    DBConnection.Close;
    ADOConnection_query.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  ToolTipsDBGrid1.Tag := 0;
  ADOConnection_Query.Close;
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
  try
    Query.Open;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query_2.ExecSQL;
  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query_2.ExecSQL;
  except
      DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  try
    Query_2.ExecSQL;

  except
    DBConnection.Close;
    ShowMessage('Невозможно подключиться к базе данных');
    exit;
  end;
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
  Button16.Visible := not Button16.Visible;
  Button20.Visible := not Button20.Visible;
  btnVeiDump3.Visible :=not btnVeiDump3.Visible;
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
    flagWLANConnections := true;
    Chart1.ShowHint := false;
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
  LenData := 255;
  FillChar(Data,255,#0);
  BytePoped := SSH.PopData(addr(Data), LenData);
  sleep(200);
  // Memo11.Lines.Add(Data);
  //вычищаем стек SSH
   while BytePoped > 0 do begin
    LenData := 255;
    FillChar(Data,255,#0);
    BytePoped := SSH.PopData(addr(Data), LenData);
    SSH.FlushData;
   end;
  //Формируем запрос и посылаем серверу
  FillChar(Data,255,#0);
  DataString := 'cat /local/clientcode/lgk/opns/sh'+formatDateTime('yymmdd',MonthCalendar1.Date)+
     'n.transact |grep "'+Modemsname.AsString+' .*GPS_ARR" ; cat /local/clientcode/lgk/opns/sh'+formatDateTime('yymmdd',MonthCalendar1.Date)+
     'd.transact |grep "'+Modemsname.AsString+' .*GPS_ARR"'#13;
  move(Datastring[1],Data,Length(DataString));
  LenData := length(DataString);
  SSH.PushData(addr(Data), LenData, BytePushed);
  SSH.FlushData;
  sleep(1000);

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
var i: word;  rs: TResourceStream;
begin
  if not FileExists(ExtractFilePath(Application.ExeName)+'Template.vnc') then
    // извлекаем из ресурса и сохраняем
    try
      rs := TResourceStream.Create(HInstance, 'TEMPLATE_VNC', RT_RCDATA);
      rs.SaveToFile(ExtractFilePath(Application.ExeName)+'Template.vnc');
      rs.Free;
    except
    end;
  if not FileExists(ExtractFilePath(Application.ExeName)+'VNC-Viewer.exe') then
    // извлекаем из ресурса и сохраняем
    try
      rs := TResourceStream.Create(HInstance, 'VNC_EXE', RT_RCDATA);
      rs.SaveToFile(ExtractFilePath(Application.ExeName)+'VNC-Viewer.exe');
      rs.Free;
    except
    end;
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

procedure TForm1.xrebootPTX1Click(Sender: TObject);
var IP:string;
    wnd1:integer;

var EventLog:THandle;
    MyMsg:Array[0..2] of PChar;
    buf: string;
begin
        IP := Modemsip_address_1.AsString;
        ShellExecute(0,nil,PChar('cmd.exe'),pchar('/C "'+'telnet '+IP+'"'),nil,SW_restore);
        sleep(700);
        wnd1 := FindWindow(nil,PChar('Telnet '+IP));
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
            SendMessage(wnd1,WM_CHAR,ord('x'),0);
            SendMessage(wnd1,WM_CHAR,ord('r'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('b'),0);
            SendMessage(wnd1,WM_CHAR,ord('o'),0);
            sleep(50);
            SendMessage(wnd1,WM_CHAR,ord('o'),0);
            SendMessage(wnd1,WM_CHAR,ord('t'),0);
            SendMessage(wnd1,WM_CHAR,ord(#13),0);

            //Записываем событие в системный журнал событий Windows
           buf:='xreboot on '+IP+' execute success.';
           EventLog:=RegisterEventSource(nil,PChar('EMZ_xreboot'));
           MyMsg[0]:=PChar(Buf);
           ReportEvent(EventLog,EVENTLOG_INFORMATION_TYPE,0,0,nil,1,0,@MyMsg,nil);
           //Записываем событие в таблицу log
           Query.Close;
           Query.SQL.Text := 'Insert into log values('+QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',now))+', '+
             QuotedStr('xreboot on '+IP+' execute success')+')';
           Query.ExecSQL;
           Query.Close;
        end;
    Ping1Click(Sender);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
try
  TableLog.Close;
  TableLog.Open;
except
  DBConnection.Close
end;
end;

procedure TForm1.ReloadDrivers1Click(Sender: TObject);
var rs: TResourceStream;
begin
  if not FileExists(ExtractFilePath(Application.ExeName)+'mmsShell.exe') then
    // извлекаем из ресурса и сохраняем
    try
      rs := TResourceStream.Create(HInstance, 'MMS_SHELL_EXE', RT_RCDATA);
      rs.SaveToFile(ExtractFilePath(Application.ExeName)+'mmsShell.exe');
      rs.Free;
    except
    end;
  frmReloadDrv := TfrmReloadDrv.Create(Application);
  frmReloadDrv.ShowModal;
end;
 
procedure TForm1.VEIDUMP1Click(Sender: TObject);
type TArrayString = array [0..254] of AnsiChar;
var
 SSH: TCryptSession;
//  Data: PAnsiChar;
 Data: TArrayString;
 tmpStr, DataString: string;
 LenData: Integer;
 BytePushed: Integer;
 BytePoped: Integer;
 tmpTick: Cardinal;
begin
  tmpTick := GetTickCount;
  frmMEMO := TfrmMEMO.Create(Application);
  frmMEMO.Show;

  frmMEMO.Memo11.Lines.Clear;
  Application.ProcessMessages;
   frmMEMO.Memo11.Lines.Add('------begin------');
 cryptInit;

 SSH := SSH_Client('10.70.121.3', 'lgktech', 'linux1');
 if SSH = nil then
   Exit;

 SSH.FlushData; // обязательно нужно использовать перед вызовом PopData

 Sleep(1000);
 LenData := 255;
 FillChar(Data,255,#0);
 BytePoped := SSH.PopData(addr(Data), LenData);
 frmMEMO.Memo11.Lines.Add(Data);
 FillChar(Data,255,#0);
   DataString := 'cat OMSsniff/'+formatDateTime('yyyy-mm-dd',MonthCalendar1.Date)+'.sniff.eth0.raw | grep "'+Modemsname.AsString+'.*VEI"'#13;
   frmMEMO.Memo11.Lines.Add(DataString);
   move(Datastring[1],Data,Length(DataString));
 LenData := length(DataString);
 SSH.PushData(addr(Data), LenData, BytePushed);
 sleep(200);
 frmMEMO.Memo11.Lines.Add('------PopData--------');
 SSH.FlushData;
 Sleep(1000);
//извлекаем сначала то что запушили ранее (trash мусор)
 FillChar(Data,255,#0);
 BytePoped := SSH.PopData(addr(Data), LenData+1);
 Sleep(200);
 BytePoped := 1;
 tmpStr := '';
 while BytePoped > 0 do begin
   LenData := 1;
   FillChar(Data,255,#0);
   BytePoped := SSH.PopData(addr(Data), LenData);
  // sleep(200);
   if (Data[0]<>#13)and(Data[0]<>#10) then tmpStr:= tmpStr+Data[0]
   else
   begin
     if (Data[0]<>#10) then frmMEMO.Memo11.Lines.Add(tmpStr);
     tmpStr := '';
   end;
 end;
 FreeAndNil(SSH);
 cryptEnd;
 frmMEMO.Memo11.Lines.Add('------end--------');
  frmMEMO.Memo11.Lines.Add(IntToStr(GetTickCount-tmpTick)+' millisec');
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Button20Click(sender);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  ReloadDrivers1Click(sender);
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  xrebootPTX1Click(sender);
end;

procedure TForm1.Button20Click(Sender: TObject);
type TArrayString = array [0..254] of AnsiChar;
var
 SSH: TCryptSession;
//  Data: PAnsiChar;
 Data: TArrayString;
 tmpStr,tmpStr1, DataString: string;
 LenData,EnterPos: Integer;
 BytePushed: Integer;
 BytePoped,j: Integer;
 tmpTick: Cardinal;
procedure FindEnter;
var i: integer;
begin
  EnterPos:=0;
  i := 254;
  while (Data[i]<>#13)and(i>0) do begin inc(EnterPos);dec(i) end;
end;

begin
  tmpTick := GetTickCount;
  frmMEMO := TfrmMEMO.Create(Application);
  frmMEMO.Show;

  frmMEMO.Memo11.Lines.Clear;
  Application.ProcessMessages;
   frmMEMO.Memo11.Lines.Add('------begin------');
 cryptInit;

 SSH := SSH_Client('10.70.121.3', 'lgktech', 'linux1');
 if SSH = nil then
   Exit;

 SSH.FlushData; // обязательно нужно использовать перед вызовом PopData

 Sleep(500);
 LenData := 255;
 FillChar(Data,255,#0);
 BytePoped := SSH.PopData(addr(Data), LenData);
 frmMEMO.Memo11.Lines.Add(Data);
 FillChar(Data,255,#0);
   DataString := 'cat OMSsniff/'+formatDateTime('yyyy-mm-dd',MonthCalendar1.Date)+'.sniff.eth0.raw | grep "'+Modemsname.AsString+'.*VEI"'#13;
   frmMEMO.Memo11.Lines.Add(DataString);
   move(Datastring[1],Data,Length(DataString));
 LenData := length(DataString);
 SSH.PushData(addr(Data), LenData, BytePushed);
 frmMEMO.Memo11.Lines.Add('------PopData--------');
 SSH.FlushData;
 Sleep(1000);

 LenData := 255;
 FillChar(Data,255,#0);
 BytePoped := SSH.PopData(addr(Data), LenData);
 FindEnter;
 tmpStr := Data;
 SetLength(tmpStr,255-EnterPos-1);
 frmMEMO.Memo11.Lines.Add(tmpStr);
 tmpStr :=''; for j:=255-EnterPos+1 to BytePoped-1 do tmpStr := tmpStr+Data[j];
 while BytePoped > 0 do begin
   LenData := 255;
   FillChar(Data,255,#0);
   BytePoped := SSH.PopData(addr(Data), LenData);
   FindEnter;
   tmpStr1 := data;
   SetLength(tmpStr1,255-EnterPos-1);
   frmMEMO.Memo11.Lines.Add(tmpStr+tmpStr1);
   tmpStr :=''; for j:=255-EnterPos+1 to BytePoped-1 do tmpStr := tmpStr+Data[j];
 end;
 frmMEMO.Memo11.Lines.Add(tmpStr);
 FreeAndNil(SSH);
 cryptEnd;
 frmMEMO.Memo11.Lines.Add('------end--------');
 frmMEMO.Memo11.Lines.Add(IntToStr(GetTickCount-tmpTick)+' millisec');
end;

procedure TForm1.btnVeiDump3Click(Sender: TObject);
var
  tmpTick: cardinal;
  datastring, CommandString, File_name: string;
begin
  tmpTick := GetTickCount;
  frmMEMO := TfrmMEMO.Create(Application);
  frmMEMO.Show;

  frmMEMO.Memo11.Lines.Clear;
  Application.ProcessMessages;

  DataString := 'cat OMSsniff/'+formatDateTime('yyyy-mm-dd',MonthCalendar1.Date)+'.sniff.eth0.raw | grep '+Modemsname.AsString+'.*VEI';
  File_name := ExtractFilePath(Application.ExeName)+'tmpVeiDump.txt';
  CommandString := '"c:\Program files\putty\plink.exe" -ssh  -pw "linux1" lgktech@10.70.121.3 "'+ datastring +'" > "'+File_name+'"';



//  ShellExecute(0,nil,PChar('cmd.exe'),pchar('/K '+ CommandString),nil,SW_HIDE);
  winexec(PChar(CommandString),SW_HIDE);
  Sleep(1500);
  if FileExists(File_name) then frmMEMO.Memo11.Lines.LoadFromFile(File_name) else frmMEMO.Memo11.Lines.Add(CommandString);
  frmMEMO.Memo11.Lines.Add('');
  frmMEMO.Memo11.Lines.Add(IntToStr(GetTickCount-tmpTick)+' millisec');
end;

procedure TForm1.GPS1Click(Sender: TObject);
var
// i,j, currentNumAutoOrExcav: integer;
 tmpDateTime: TDateTime;

begin
  if (Copy(Modemsname.AsString,1,1)<>'A')and(Copy(Modemsname.AsString,1,1)<>'E')then begin
    ShowMessage('Выберите авто или экскаватор');
    exit;
  end;

    flagWLANConnections := true;
    Chart1.ShowHint := false;

  ToolTipsDBGrid1.Tag := 1;
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Изменение GPS координаты (Х) для '+Modemsname.Asstring);
  Chart1.Series[0].Active:= false;
  Chart1.Series[1].Active:= false;
  Chart1.Series[2].Active:= false;
  Chart1.Series[3].Active:= false;
  Chart1.Series[4].Active:= false;
  Chart1.Series[5].Active:= false;
  Chart1.Series[6].Active:= false;
  Chart1.Series[7].Active:= false;
  Chart1.Series[8].Active:= false;

    {if Copy(Modemsname.AsString,1,1)='A' then begin
     currentNumAutoOrExcav := StrToInt(Copy(Modemsname.AsString,2,length(Modemsname.AsString)-1));
  end else begin
     currentNumAutoOrExcav := StrToInt(Copy(Modemsname.AsString,3,length(Modemsname.AsString)-2));
  end;
  Chart1.Series[0].AddXY(MonthCalendar1.Date,currentNumAutoOrExcav-1);
  Chart1.Series[0].AddXY(MonthCalendar1.Date,currentNumAutoOrExcav+1);
     }
  Query.Close;
  Query.sql.Text := 'select date, time, signal_level, status, x from statss where ';
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
          Modemsid_modem.AsString+' and statss.x > 0 order by date, time';
  try
    Query.Open;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
    exit;
  end;
  if Query.RecordCount = 0 then begin  ToolTipsDBGrid1.Tag :=0;exit;end;
  ProgressBar1.Min := 0;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Query.RecordCount;
  Query.First;

 //строим график по полученным данным
  while not Query.Eof do
  begin
    if CheckBox2.Checked then
    begin
      ProgressBar1.Position := ProgressBar1.Position +1;
      Application.ProcessMessages;
    end;
    tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
    Chart1.Series[0].AddXY(tmpDateTime,Query.FieldByName('x').AsInteger{currentNumAutoOrExcav},'',clBlack);
    Query.Next;
  end;

 Chart1.Series[0].Active := true;
   ToolTipsDBGrid1.Tag := 0;
   ProgressBar1.Position := 0;
   Query.Close;
end;

procedure TForm1.N4Click(Sender: TObject);
var posit, paintx, painty, i, count_neuchtenn:integer;
    apppath, imagepath, str, mac_bs, filePNG:string;
    kx, ky:real;
    tmpImg: TImage;
begin
     if Query.Active then query.Active:=false;
     if Modemsis_access_point.AsInteger=0 then begin ShowMessage('Выберите базовую станцию');
       exit;
     end;
     mac_bs := Modemsmac_address.AsString;
     query.SQL.Clear;
     query.SQL.Add('select s.x, s.y, s.signal_level as signal_level, s.id_modem, s.date, s.time, s.id, s.mac_ap from statss s');
     query.SQL.Add('where (s.date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date))+')');
     form1.Query.SQL.Add('and (s.mac_ap='+ QuotedStr(mac_bs)+')');
     form1.query.SQL.Add('and (s.x>0) ');
     form1.Query.SQL.Add('and (s.signal_level>-100)');


     // Сортируем полученные записи по уровню сигнала для того, чтобы сначала рисовались точки,
     // в которых была плохая связь, а потом точки, в которых были пропадания связи.
     // Тогда, если в одной точке были и пропадания и плохой сигнал, последней нарисуется пропадание
     form1.Query.SQL.Add(' order by s.signal_level DESC');
     //posit:=LastPos('\',Application.ExeName);
     //apppath:=copy(Application.ExeName,1,posit);
     frmShowMap := TfrmShowMap.Create(Application);
     tmpImg := TImage.Create(frmShowMap);
     filePNG := 'W:\УКиСС\Участок АСУ ГТК\map.png';

     if FileExists(ExtractFilePath(Application.ExeName)+'map.png') then
             tmpImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'map.png');
     if FileExists(filePNG) then  tmpImg.Picture.LoadFromFile(filePNG);

     frmShowMap.imgMap.Picture.Bitmap.Assign(tmpImg.Picture.Graphic);
     tmpImg.Free;


     //ShowMessage(form1.Query.SQL.Text);
     frmShowMap.Show;
     frmShowMap.Label1.Visible := false;
     frmShowMap.imgMap.Visible := false;
     form1.query.Active:=true;
     form1.query.First;
     // Если не найдено пакетов, завершаем выполнение
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
           paintx:=round((form1.query.fieldByName('x').AsInteger-img_startx)*kx);
           // на плане карьера координатная ось у перевернута. Координаты идут снизу вверх
           painty:=round(img_height-((form1.query.fieldByName('y').AsInteger-img_starty)*ky));
           //ShowMessage(form1.Query.FieldByName('signal_level').AsString);
           frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:=clGreen;// Если уровень сигнала >=-65
           if (form1.Query.FieldByName('signal_level').AsInteger-256 < -70) then
              frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:=clBlue;
           if form1.Query.FieldByName('signal_level').AsInteger-256 < -78 then
                frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:= clYellow;
           if form1.Query.FieldByName('signal_level').AsInteger-256 < -85 then
                frmShowMap.imgmap.Canvas.Pixels[paintx,painty]:= clRed;
           frmShowMap.Gauge1.Progress := frmShowMap.Gauge1.Progress +1;
           Application.ProcessMessages;
           form1.query.Next;
     end;
     frmShowMap.imgMap.Visible := true;
     frmShowMap.Gauge1.Visible := false;
     form1.Query.Active:=false;
end;

procedure TForm1.TimerNoZastavkaTimer(Sender: TObject);
begin
 //чтобы не было заставки )))
  try  setkey(VK_CONTROL);except end;
end;

procedure TForm1.N5Click(Sender: TObject);
var tmpDateTime: TDateTime;
    color1:TColor;
    sumAvg: real;
begin
  if Modemsis_access_point.AsInteger=0 then exit;
  ToolTipsDBGrid1.Tag := 1;
  Label8.Caption := 'Средний уровень сигнала';
  flagWLANConnections := true;
  Chart1.ShowHint := false;
  sumAvg :=0;
  Query.Close;
   { if CheckBox1.Checked then
      Query.sql.Text := 'select date, time, signal_level, color, status, name from statss, modems where statss.id_modem='+
        Modemsid_modem.AsString+' and statss.mac_ap=modems.mac_address'
    else}
  color1 := Modemscolor.AsInteger;

      Query.sql.Text := 'select s.date, s.time, AVG(s.signal_level) signal_level, DATE_FORMAT(s.time,"%H:%i") t from statss s, modems m where s.mac_ap='+
          QuotedStr(Modemsmac_address.AsString) + ' and ';
      if CheckBox3.Checked then
      begin
        if FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date) <> FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date) then
          Query.sql.Text := Query.sql.Text +
            ' (((s.date > '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+') ' +
            ' and (s.date < '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+')) ' +
            ' or ((s.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+') and ' +
            '(s.time >= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker3.Time))+')) ' +
            ' or ((s.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date))+') and ' +
            '(s.time <= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker4.Time))+'))) '
         else
           Query.sql.Text := Query.sql.Text +
            ' (s.date = '+ QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+' and ' +
            's.time >= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker3.Time))+' and ' +
            's.time <= '+ QuotedStr(FormatDateTime('hh:nn:00',DateTimePicker4.Time))+') '

      end
      else
      begin
        Query.sql.Text := Query.sql.Text +
          ' s.date='+QuotedStr(FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date));
      end;
      Query.sql.Text := Query.sql.Text + ' and s.id_modem<>'+
          Modemsid_modem.AsString+' and s.id_modem=m.id_modem  group by t order by s.date, s.time';
  try
    Query.Open;
  except
    DBConnection.Close;
    ToolTipsDBGrid1.Tag := 0;
    exit;
  end;
  Query.FindLast;
  if Query.RecordCount = 0 then exit;
  ProgressBar1.Min := 0;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Query.RecordCount;
  Query.First;
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('График среднего уровня сигнала wi-fi для клиентов'+Modemsname.Asstring);
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
  while not Query.Eof do
  begin
    if CheckBox2.Checked then
    begin
      ProgressBar1.Position := ProgressBar1.Position +1;
      Application.ProcessMessages;
    end;
    tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
    Chart1.Series[0].AddXY(tmpDateTime,round(Query.FieldByName('signal_level').AsFloat),'',color1);
    sumAvg := sumAvg + round(Query.FieldByName('signal_level').AsFloat);
    Query.Next;
  end;
  tmpDateTime := StrToDateTime(Query.Fields[0].AsString+' '+Query.Fields[1].AsString);
  Chart1.Series[0].AddXY(tmpDateTime,round(Query.FieldByName('signal_level').AsFloat),'',color1);
  Chart1.Series[1].AddXY(tmpDateTime,-78);
  ProgressBar1.Position := 0;
  sumAvg := sumAvg/Query.RecordCount;
  Query.Close;

  lAvgLevel.Caption := FloatToStrF(sumAvg,ffFixed,7,1);
  Chart1.Series[0].Active := true;
  Chart1.Series[1].Active := true;
  ToolTipsDBGrid1.Tag := 0;

end;

procedure TForm1.telnetcheckhardwarerev1Click(Sender: TObject);
var IP: string;
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
            SendMessage(wnd1,WM_CHAR,ord('g'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('t'),0);
            SendMessage(wnd1,WM_CHAR,ord('i'),0);
            SendMessage(wnd1,WM_CHAR,ord('m'),0);
            SendMessage(wnd1,WM_CHAR,ord('a'),0);
            SendMessage(wnd1,WM_CHAR,ord('g'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('v'),0);
            SendMessage(wnd1,WM_CHAR,ord('e'),0);
            SendMessage(wnd1,WM_CHAR,ord('r'),0);
            SendMessage(wnd1,WM_CHAR,ord('s'),0);
            SendMessage(wnd1,WM_CHAR,ord('i'),0);
            SendMessage(wnd1,WM_CHAR,ord('o'),0);
            SendMessage(wnd1,WM_CHAR,ord('n'),0);
            SendMessage(wnd1,WM_CHAR,ord(#13),0);

        end;

end;

{ TSSHobj }

constructor TSSHobj.Create;
begin
     inherited;
     SSH:=SSH_Client('10.70.121.3','asugtkscript','gtkasu2012');
     Answer:=TStringList.Create;
     FSleepTm:=600;
end;

destructor TSSHobj.Destroy;
begin
     FreeAndNil(SSH);
     Answer.Free;
     inherited;
end;

// Функция выполнения команды и получение данных от выполнения по SSH для текущей сессии SSH
function TSSHobj.execSSHCommand(command: shortString; Answer:TStrings; timeout:word): boolean;
type TArrayString = array [0..254] of AnsiChar;
var
  LenData,LenData1, cnt1, i2,i3: Integer;
  BytePushed: Integer;
  BytePoped: Integer;
  data:TArrayString;
  dataString,tmpstr:ShortString;
  sleeptm1:integer;
  diffsleep:integer;
  countretries:word;
  currentretries:word;
  hellostr:string;
  findhello:boolean;
begin
      hellostr:='lgkdisp:~$';
      sleeptm1:=20;
      countretries:=10;
      if timeout<300 then timeout:=300;
      diffsleep:=round(timeout / countretries);
      result:=false;
      if SSH = nil then Exit;
      // Очищает буфер вывода
      SSH.FlushData; // обязательно нужно использовать перед вызовом PopData
      Sleep(sleeptm1);
      LenData := 255;
      FillChar(Data,255,#0);
      // Получаем строку приветствия сервера
      BytePoped := SSH.PopData(addr(Data), LenData);
      sleep(sleeptm1);
      currentretries:=0;
      tmpstr:='';
      i2:=0;
      // Возможно в дальнейшем нужно будет просто дождаться возвращения пустого набора данных
      while (data[i2]<>#0) do begin
          tmpstr:=tmpstr+data[i2];
          inc(i2);
      end;
      if tmpstr='' then findhello:=true
          else findhello:=pos(hellostr,tmpstr)>0;
      while (not findhello) and (currentretries<countretries) do begin
            inc(currentretries);
            Sleep(diffsleep);
            BytePoped := SSH.PopData(addr(Data), LenData);
            sleep(sleeptm1);
            i2:=0;
            while (data[i2]<>#0) do begin
                tmpstr:=tmpstr+data[i2];
                inc(i2);
            end;
            findhello:=pos(hellostr,tmpstr)>0;
      end;
      if currentretries=countretries then begin
         Result:=false;
         exit;
      end;
      // Заполняем переменную данных нулями
      FillChar(Data,255,#0);
      dataString:=command;
      // Если команда была передана без символа окончания строки, то добавляем этот символ
      if datastring[length(datastring)-1]<>#13 then dataString:=dataString+#13;
      // Вторая #13 нужна для того, чтобы после результата получили строку приветствия
      dataString:=datastring+#13;
      move(Datastring[1],Data,Length(DataString));
      LenData := length(DataString);
      // Отправка команды на сервер
      SSH.PushData(addr(Data), LenData, BytePushed);
      sleep(sleeptm1 div 5);
      while (BytePushed<LenData) and (currentretries<countretries) do begin
            inc(currentretries);
            Sleep(diffsleep);
      end;
      if currentretries=countretries then begin
         Result:=false;
         exit;
      end;
      SSH.FlushData;
      sleep(sleeptm1);

      //извлекаем сначала то что запушили ранее (выполняемые команды)
      FillChar(Data,255,#0);
      BytePoped := SSH.PopData(addr(Data), LenData+1);
      sleep(sleeptm1);
      if Not Assigned(Answer) then Answer:=TStringList.Create;
      Answer.Clear;
      tmpstr:='';
      LenData := 1;
      FillChar(Data,255,#0);
      BytePoped := SSH.PopData(addr(Data), LenData);
      //sleep(sleeptm1);
      while ((BytePoped > 0) or (currentretries<countretries)) and ( not result) do begin
              if BytePoped>0 then begin
                  if (Data[0]<>#13)and(Data[0]<>#10) then tmpStr:= tmpStr+Data[0]
                  else
                  begin
                       if Data[0]=#13 then begin
                          findhello:=Pos(hellostr,tmpstr)>0;
                          if (not findhello) then Answer.Add(tmpstr);
                          // Так как последней строкой должно быть lgkdisp:~$,
                          // то если текущая строка соответствует ей, то проставлять флаг корректности
                          if findhello and (length(tmpstr)<=12) then begin
                              result:=true;
                          end else begin
                              result:=false;
                          end;
                       end;
                       tmpStr := '';
                  end;
              end else begin
                  // Если нет новых символов в очереди, то проверяем, не получили ли правильный вывод
                  if pos(hellostr,tmpstr)>0 then begin
                      result:=true;
                      continue;
                  end;
                  inc(currentretries);
                  sleep(diffsleep);
                  //continue;
                  //SSH.FlushData;
                  //sleep(sleeptm1 div 2);
              end;
              FillChar(Data,1,#0);
              BytePoped := SSH.PopData(addr(Data), LenData);
              //sleep(sleeptm1 div 5);
      end;
      //if pos('lgkdisp:~$',tmpstr)>0 then result:=true;
      //if not Result then sleep(timeout);
end;

function TSSHobj.Execute: boolean;
begin
     result:=execSSHCommand(command,Answer,sleeptm);
end;

function TSSHobj.Lock : boolean;
var slp,cnt:integer;
begin
     slp:=100;
     cnt:=0;
     while FBusy and (cnt<100) do begin
         inc(cnt);
         sleep(slp);
     end;
     if not FBusy then begin
        Fbusy:=true;
        result:=true;
     end else result:=false;
end;

function TSSHobj.SSH_Client(Server, Userid, Pass: string): TCryptSession;
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
     Application.MessageBox(PChar(E.Message),'Connnection error');
     FreeAndNil(result);
   end;
 end;
end;

procedure TSSHobj.Unlock;
begin
      Fbusy:=false;
end;

procedure TForm1.btnChangePTXClick(Sender: TObject);
begin
  if Modemsname.AsString='A500' then
    ShowMessage('Нельзя заменить РТХ на виртуальном самосвале.')
  else
    if Modemsid_modem.AsInteger=0 then
      ShowMessage('Нельзя заменить резервный РТХ.')
    else
      if Modemsid_ptx.AsInteger=0 then
        ShowMessage('Это оборудование без РТХ.')
      else
      begin
        frmChangePTX := TfrmChangePTX.Create(Application);
        frmChangePTX.ShowModal;
      end;
end;

procedure TForm1.FTPFileZilla1Click(Sender: TObject);
begin

 if not FileExists('C:\Program Files\FileZilla FTP Client\filezilla.exe') then begin
   ShowMessage('FileZilla not found');
   exit;
 end;
 ShellExecute(0,nil,PChar('C:\Program Files\FileZilla FTP Client\filezilla.exe'),pchar('ftp://admin:modular@'+Modemsip_address_1.AsString),nil,SW_restore);
 sleep(400);
end;

procedure TForm1.fullversion1Click(Sender: TObject);
var Cmd1,cmd2: string;
  i:integer;
  wnd1:  hwnd;
begin
 if not FileExists('c:\Program files\putty\putty.exe') then begin
   ShowMessage('Putty not found');
   exit;
 end;

 ShellExecute(0,nil,PChar('c:\program files\putty\putty.exe'),pchar('lgktech@10.70.121.3 -pw linux1'),nil,SW_restore);
 sleep(1000);
 wnd1:=FindWindow(nil,PChar('10.70.121.3 - PuTTY'));
 if wnd1>0 then begin
    cmd2:=(Sender as TMenuItem).Caption;
    cmd2 := StringReplace(cmd2, '&', '', [rfReplaceAll]);
    Cmd1 := 'expect -c ''spawn OMStip '+Modemsname.AsString+';expect ">";send "'+cmd2+'\r";expect ">";interact'''#13;
    if (Sender as TMenuItem).Name = 'OMStip2' then cmd1:='OMStip '+Modemsname.AsString+#13;
    if (Sender as TMenuItem).Name = 'rmdirHubGoicReset1' then begin
      Cmd1 := 'expect -c ''spawn OMStip '+Modemsname.AsString+';expect ">";send "rmdir pfs\r";expect ">";send "net/Hub/All\r";';
      cmd1 := Cmd1 + 'expect ">";send "net/Goic/All\r";expect ">";send "reset\r";interact'''#13;
    end;
    if (Sender as TMenuItem).Name = 'reset1' then
      cmd1 := 'expect -c ''spawn OMStip '+Modemsname.AsString+';expect ">";send "reset\r";interact'''#13;
    for i:=1 to Length(Cmd1) do
          SendMessage(wnd1,WM_CHAR,Ord(Cmd1[i]),0);
  end
  else ShowMessage('Превышен интервал ожидания. Повторите попытку.');
end;


procedure TForm1.telnet2Click(Sender: TObject);
var Cmd1,cmd2: string;
  wnd1, i:integer;
begin
 if not FileExists('c:\Program files\putty\putty.exe') then begin
   ShowMessage('Putty not found');
   exit;
 end;
 ShellExecute(0,nil,PChar('c:\program files\putty\putty.exe'),pchar('lgktech@10.70.121.3 -pw linux1'),nil,SW_restore);
 sleep(1000);
 wnd1:=FindWindow(nil,PChar('10.70.121.3 - PuTTY'));

 if wnd1>0 then begin
    Cmd1 := 'expect -c ''spawn telnet '+Modemsip_address_1.AsString+';expect "login:";send "\r";expect "Password:";';
    Cmd1 := Cmd1 + 'send "\r";expect "login:";send "admin\r";expect "Password:";send "modular\r";';
      cmd2:=(Sender as TMenuItem).Caption;
      cmd2 := StringReplace(cmd2, '&', '', [rfReplaceAll]);
      cmd2 := 'expect ">";send "' + cmd2 + '\r";interact''';
    if (Sender as TMenuItem).Name = 'telnet2' then cmd2:='interact''';
    if (Sender as TMenuItem).Name ='windowsptxAdministration1' then begin
      cmd2:='\"\\windows\\ptx\\Administration\\GPS Information.exe\"';
      cmd2 := 'expect ">";send "' + cmd2 + '\r";interact''';
    end;
    if (Sender as TMenuItem).Name ='killprocdeliteexe2' then begin
      cmd2:='killproc devicemonitor.exe';
      cmd2 := 'expect ">";send "' + cmd2 + '\r";expect ">";send "killproc delite.exe\r";interact''';
    end;

    Cmd1 := Cmd1 + cmd2+ #13;
    for i:=1 to Length(Cmd1) do
          SendMessage(wnd1,WM_CHAR,Ord(Cmd1[i]),0);
 end
 else ShowMessage('Превышен интервал ожидания. Повторите попытку.');
end;

procedure TForm1.OMSsniffMenuClick(Sender: TObject);
var Cmd1: string;
    wnd1, i:integer;
begin
 if not FileExists('c:\Program files\putty\putty.exe') then begin
   ShowMessage('Putty not found');
   exit;
 end;
 ShellExecute(0,nil,PChar('c:\program files\putty\putty.exe'),pchar('lgktech@10.70.121.3 -pw linux1'),nil,SW_restore);
 sleep(1000);
 wnd1:=FindWindow(nil,PChar('10.70.121.3 - PuTTY'));

 if wnd1>0 then begin
    Cmd1 := 'cat OMSsniff/' + FormatDateTime('yyyy-mm-dd',MonthCalendar1.Date)+'.sniff.eth0.raw |grep '+Modemsname.AsString;
    if (Sender as TMenuItem).Name = 'OMSsniffMenu' then cmd1 := cmd1 + #13;
    if (Sender as TMenuItem).Name = 'N9' then cmd1 := cmd1 + '|egrep -e  "1023475713|LLS"'#13;
    if (Sender as TMenuItem).Name = 'PressurePro1' then cmd1 := cmd1 + '|grep 8389'#13;
    if (Sender as TMenuItem).Name = 'VIST1' then cmd1 := cmd1 + '|grep 6040'#13;
    if (Sender as TMenuItem).Name = 'Vims1' then cmd1 := cmd1 + '|egrep -e "8395|8397"'#13;
    if (Sender as TMenuItem).Name = 'RoadRoughness1' then cmd1 := cmd1 + '|grep 82214'#13;
    if (Sender as TMenuItem).Name = 'VEI1' then cmd1 := cmd1 + '|grep VEI'#13;
    if (Sender as TMenuItem).Name = 'PTXPWRUP1' then cmd1 := cmd1 + '|grep PWRUP'#13;
    for i:=1 to Length(Cmd1) do
          SendMessage(wnd1,WM_CHAR,Ord(Cmd1[i]),0);
 end
 else ShowMessage('Превышен интервал ожидания. Повторите попытку.');
end;

end.

