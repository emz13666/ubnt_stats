unit DM;

interface

uses
  SysUtils, Classes, forms, DB, ADODB, MyUtils, iniFiles, DelphiCryptlib, cryptlib, ActiveX,
  Sockets;

const  s_unknown =0;
       s_Work    =1;
       s_NoData  =2;
       s_Disable =3;
       s_NotReady=4;
       s_damage  =5;
       s_restored=6;

// Констатны для статусов Modular
const
       ms_unknown=0;
       ms_damage=1;
       ms_ready=2;
       ms_delay=3;
       ms_wait=4;

const mos_Monitoring=0;
        mos_Disable=1;
        mos_Damage=2;

const MaxInterfacesCount=10;
      MaxParametersCount=3;

type
  TDM1 = class(TDataModule)
    ConnPowerView: TADOConnection;
    qStatus: TADOQuery;
    qStatusstarttime: TFloatField;
    qStatusstatus: TFloatField;
    ConnMySQL: TADOConnection;
    qModify: TADOQuery;
    qGetTruckID: TADOQuery;
    qGetTruckIDid: TLargeintField;
    qEquipment: TADOQuery;
    qEquipmentid: TLargeintField;
    qEquipmentname: TWideStringField;
    qPowerViewStatus1: TADOQuery;
    qPowerViewStatus1endtm: TFloatField;
    qEquipmentequipment_type: TIntegerField;
    qMonitoringStatus: TADOQuery;
    qMonitoringStatusid: TAutoIncField;
    qMonitoringStatusreason: TWideStringField;
    qMonitoringStatusFIO: TWideStringField;
    qMonitoringStatusdatetimestart: TDateTimeField;
    qMonitoringStatusreason_category: TSmallintField;
    qPVTemp: TADOQuery;
    qMySQLTemp: TADOQuery;
    qEquipmentip_address: TWideStringField;
    qFindInterface: TADOQuery;
    qExcavs: TADOQuery;
    qExcavsid: TLargeintField;
    qExcavsname: TWideStringField;
    qExcavsip_address: TWideStringField;
    qExcavsequipment_type: TIntegerField;
    ConnMySQLgetGPS: TADOConnection;
    qNetwork: TADOQuery;
    qNetworkid: TLargeintField;
    qNetworkname: TWideStringField;
    qNetworkip_address: TWideStringField;
    qNetworkequipment_type: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ConnectedDBUbiquiti : boolean;
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
    destructor Destroy;
    function Execute : boolean;
end;

type
  TParameterInterface=class(TObject)
  private
    FdisplayName:string;
    FName:string;
    Fvalue:string;
    Fedizm:string;
    FFormatVal:string;
  public
    property displayName: string read FDisplayName write FDisplayName;
    property name:string read FName write FName;
    property value:string read FValue write FValue;
    property edizm:string read Fedizm write FEdizm;
    property FormatVal:string read FFormatVal write FFormatVal;
end;

type TParameters = class
  private
    FParameters: array of TParameterInterface;
    function getParameter(index1:integer): TParameterInterface;
    function getCount:integer;
  public
    constructor Create;
    destructor destroy;
    property Parameters[index:integer] : TParameterInterface read getParameter; default;
    property Count:integer read getcount;
    procedure Add(Prmtr:TParameterInterface);
    procedure Delete(index1:integer);
end;

type
  CInterface = class(TObject)
    DisplayParameters : TParameters;
  private
    Fname:string;
    FDisplayName:string;
    Fstatus:integer;
    Fcomment:string;
    FErrorStr:string; // Комментарий при отображении ошибки
    FLastCheckDateTime:TDateTime;
    FOwner:TObject;
    FMonitoringStatus:shortint;
    FMonitoringSetting:shortint;
    FResumeMonitoringDateTime:TDateTime;
    function CheckTableMCPar: boolean;    // Старая проверка таблицы hist_mc_par на количество записей за смену. Оказалась не эффективной
    function GetLastDataMCPar: TDateTime;
    function CheckInterface:boolean; virtual; abstract;  // Функция проверки интерфейса
    function getInterfaceMYSQLID: integer; // Поиск номера интерфейса в БД Ubiquiti. Если не найден, возвращает -1
    function GetDetailsMonitoringStatus:string;
    function GetMonitoringSuspended:boolean;
  public
    property name: string read FName write FName;
    property DisplayName: string read FDisplayName write FDisplayName;
    property status: integer read FStatus write FStatus;
    property comment: string read FComment write FComment;
    property ErrorStr:string read FErrorStr write FErrorStr;
    property LastCheckDateTime: TDateTime read FLastCheckDateTime write FLastCheckDateTime;
    property Owner:TObject read FOwner write FOwner;
    property MonitoringStatus: shortint read FMonitoringStatus;
    property MonitoringSetting: shortint read FMonitoringSetting write FMonitoringSetting;
    property DetailsMonitoringStatus:string read GetDetailsMonitoringStatus;
    property ResumeMonitoringDateTime:TDateTime read FResumeMonitoringDateTime;   // Время возобнавления мониторинга интерфейса
    property IsMonitoringSuspended: boolean read GetMonitoringSuspended;        // Приостановлен ли сейчас мониторинг
    constructor Create;
    destructor Destroy;
    procedure Clear(); virtual; // Процедура очистки
    function Check : boolean; // Функция для запуска проверки интерфейса
    function AddDisplayParameter(parameterName:string): boolean; virtual;
    function GetMonitoringStatus : integer;
    property MySQLID: integer read getInterfaceMYSQLID; // Идентификатор интерфейса в БД Ubiquiti
    procedure MonitoringOn();                           // Процедура включения мониторинга интерфейса
    procedure MonitoringOff(reason,FIO:string;reason_category:integer);                          // Процедура отключения мониторинга интерфейса
    procedure MonitoringSuspend(ResumeTime:TDateTime);
    procedure MonitoringSuspendByHour;
    procedure MonitoringUnsuspend;
end;


type CInterfaces = class
  private
    FInterfaces: array of CInterface;
    FOwner:TObject;
    function getInterface(Index:integer): CInterface;
    function getCount: integer;
  public
    constructor Create;
    destructor Destroy;
    property Interfaces[index:integer]: CInterface read getInterface; default;
    property count:integer read getCount;
    property Owner:TObject read FOwner;
    procedure Add(Intfc:CInterface; MonitoringSetting:shortint);
    procedure Delete(index1:integer);
    function getByName(Name:string):CInterface;
end;

type
  TWiFiInterface = class(CInterface)
    LostPercent:TParameterInterface;
  private
    function CheckInterface : boolean; override;
  public
    constructor Create();
    destructor Destroy();
    function AddDisplayParameter(parameterName:string): boolean; override;
end;

type
   TGpsInterface = class(CInterface)
    LastGPSDateTime:TParameterInterface;
  private
    function CheckInterface : boolean; override;
  public
    function CheckByOMStip :boolean;
    constructor Create();
    destructor Destroy();
    function AddDisplayParameter(parameterName:string):boolean; override;
end;

type TPressureInterface= class(CInterface)
const Tire_Unknown=0;
   Tire_work=1;
   Tire_NoData=2;
   Tire_NotCorrect=3;
   private
    FCountWorkTires:TParameterInterface;
    FGSPPort:integer;
    function CheckTire(i:integer):shortint;
    function CheckInterface : boolean; override;
   public
    constructor Create();
    destructor Destroy();
    property GSPPort:integer read FGSPPort write FGSPPort;
    property CountWorkTires: TParameterInterface read FCountWorkTires write FCountWorkTires;
    function AddDisplayParameter(parameterName:string): boolean; override;
end;

type TVEIInterface = class(CInterface)
   private
    function CheckInterface : boolean; override;
   public
    constructor Create();
    function AddDisplayParameter(parameterName:string): boolean; override;
end;

type TPowerViewLoadDataInterface = class(CInterface)
    private
      function CheckLastData : boolean;
      function CheckInterface : boolean; override;
end;

type TRunTransactInterface = class(CInterface)
    private
      function CheckInterface : boolean; override;
end;

type TRunExceptInterface = class(CInterface)
    private
      function CheckInterface : boolean; override;
end;

type TRunGPSInterface = class(CInterface)
    private
      function CheckInterface : boolean; override;
end;

type TEquipment = class
    private
      Fname:string;
      FIPAddress:string;
      FBusy:boolean;
      FInterfacesEquipment : CInterfaces;
      FMySQLIndex:integer;
      procedure SetIPAddress(const Value: string);
      function GetStatus : shortint;
    public
      constructor Create;
      destructor Destroy;
      property name: string read FName write FName;
      property IPAddress:string read FIPAddress write SetIPAddress;
      property Interfaces : CInterfaces read FInterfacesEquipment write FInterfacesEquipment;
      property Status:shortint read GetStatus;
      property Busy:boolean read FBusy;             // Флаг занятости оборудования. Если True, то объект занят и с ним работать нельзя
      property MySQLIndex: integer read FMySQLIndex;
      function Lock : boolean;
      procedure Unlock;
      function AddInterface(interfaceName:string; MonitoringSetting: shortint):boolean; virtual;
      function Pinged : boolean;      // Флаг того, что оборудование пингуется
      function FindInterfaceByName(InterfaceName:string):CInterface;
      function getIPAddress:string;
      function GetMySQLIndex():boolean;
end;

type TMobileEquipment = class(TEquipment)
    private
      FModemIP:string;
      procedure SetModemIP(value:string);
    public
      property ModemIP:string read FModemIP write SetModemIP;
      function GetModularStatus:integer;
      function GetModularReadySeconds:integer;               // Функция возвращает, сколько секунд оборудование находится в статусе готов
      function IsReadyModular: boolean;
end;

type TExcav = class(TMobileEquipment)
      WiFi:TWiFiInterface;
      GPS:TGPSInterface;
    public
      constructor Create;
      destructor Destroy;
      function AddInterface(interfaceName:string; MonitoringSetting:shortint):boolean; override;
end;

type TTruck = class(TMobileEquipment)
      WiFi:TWiFiInterface;
      GPS:TGPSInterface;
      VEI:TVEIInterface;
      Pressure:TPressureInterface;
    public
      constructor Create;
      destructor Destroy;
      function AddInterface(interfaceName:string; MonitoringSetting:shortint):boolean; override;
end;

type TNetworkEQ = class(TEquipment)
      WiFi:TWiFiInterface;
    public
      constructor Create;
      destructor Destroy;
      function AddInterface(interfaceName:string; MonitoringSetting:shortint):boolean; override;
end;

type TServer = class(TEquipment)
     public
      function getIPAddress:string;
end;

type TDispatch = class(TServer)
     IsRunTransact:TRunTransactInterface;
     IsRunExcept:TRunExceptInterface;
     IsRunGPS: TRunGPSInterface;
     public
       constructor Create;
       destructor Destroy;
end;

type TPowerView = class(TServer)
       LoadDataInterface: TPowerViewLoadDataInterface;
     public
       constructor Create;
       destructor Destroy;
end;

// Тип Интерфейс оборудования для настроек программы
type TInterface = record
     name:string;
     MonitoringStatus:shortint;
     parameters: array of string;
end;
type TInterfacesArray=array of TInterface;

type TTaskSettings= record
    name: string;
    sleeptimeSec: integer;
end;
type TApplVersion = record
    Major : shortint;
    Minor : shortint;
    Release : shortint;
end;
type TNotificationSound = class
      FSettingFileName:string;
      FEnable:boolean;
      Fduration:integer;
      procedure SetEnable(value:boolean);
      procedure SetDuration(value:integer);
    public
      property Enable : boolean read FEnable write SetEnable;
      property Duration : integer read Fduration write SetDuration;
end;
// Класс настроек программы
type TSettings = class
       interfaces: TInterfacesArray;
       tasks: array of TTaskSettings;
     private
       FfileName : string;
       FsleepTimeSeconds : integer;
       FSleepTimeEquipment : integer;
       FSleepTimeExcavs : integer;
       FSleepTimeNetwork:integer;
       FSleepTimeServers : integer;
       FCopyExe: boolean;
       FNotCheckServers:boolean;
       FNotShowErrors:boolean;
       FClientWidth:integer;
       FClientHeight:integer;
       FUser:string;
       FUpdateFolder:string;
       FUpdatePostfix:string;
       FUpdateEnabled:boolean;
       FShowExcavs:boolean;
       FSound:TNotificationSound;
       FShowNetwork:boolean;
       function getInterfacesCount:integer;
       function getTasksCount:integer;
       function getIsAdmin:boolean;
       function getApplVersion:TApplVersion;
       procedure SetApplVersion(value:TApplVersion);
       function stringToApplVersion(value:string):TApplVersion;
       function VersionLess(version1,version2:TApplVersion):boolean;
       function GetSleepTimeCategoryValue(value:integer):integer;
       function GetSleepTimeEquipment: integer;
       function GetSleepTimeExcavs:integer;
       function GetSleepTimeServers:integer;
       procedure CreateNewVersionsSettings(var iniFile:TIniFile);
    function GetSleepTimeNetwork: integer;                // Запись новых настроек в файл settings.ini
     public
       property FileName:string read FFileName write FFileName;
       property SleepTimeSeconds: integer read FSleepTimeSeconds write FSleepTimeSeconds default 600;
       property SleepTimeEquipment: integer read GetSleepTimeEquipment write FSleepTimeEquipment;
       property SleepTimeExcavs: integer read GetSleepTimeExcavs write FSleepTimeExcavs;
       property SleepTimeServers: integer read GetSleepTimeServers write FSleepTimeServers;
       property SleepTimeNetwork: integer read GetSleepTimeNetwork write FSleepTimeNetwork;
       property CopyExe: boolean read FCopyExe;
       property NotCheckServers : boolean read FNotCheckServers write FNotCheckServers;
       property NotShowErrors: boolean read FNotShowErrors write FNotShowErrors;
       property InterfacesCount:integer read getInterfacesCount;
       property TasksCount:integer read getTasksCount;
       property ClientWidth:integer read FClientWidth;
       property ClientHeight:integer read FClientHeight;
       property User:string read FUser;
       property IsAdmin:boolean read getIsAdmin;
       property UpdateFolder:string read FUpdateFolder;
       property UpdatePostfix:string read FUpdatePostfix;
       property UpdateEnabled:boolean read FUpdateEnabled;
       property ShowExcavs:boolean read FShowExcavs write FShowExcavs;             // Флаг отображения мониторинга по экскаваторам
       property ApplVersion:TApplVersion read getApplVersion write setApplVersion; // Версия программы. Нужна для задания настроек при обновлениях программы
       property Sound: TNotificationSound read FSound write FSound;
       property ShowNetwork:boolean read FShowNetwork write FShowNetwork;         // Флаг отображения списка сетевого оборудования
       function ReadSettings(SettingsFileName:string): boolean;
       procedure SetClientSizes(width:integer; height:integer);
       constructor Create;
       destructor Destroy;
end;

var
  DM1: TDM1;
  OSSH:TSSHobj;

implementation

{$R *.dfm}

{ CInterface }

function CInterface.AddDisplayParameter(parameterName: string): boolean;
begin
     result:=false;
end;

// Функция блокирует объект оборудование и запускает проверку интерфейса
function CInterface.Check: boolean;
var monStat:shortint;
begin
     result:=false;
     if not TEquipment(Owner).Lock then exit;
     GetMonitoringStatus;
     result:=CheckInterface;
     // Изменения статуса для всех интерфейсов мобильного оборудования
         monStat:=GetMonitoringStatus;
         if (monStat=mos_Disable) then status:=3;
         if (monStat=mos_Damage) then begin
            if (status=1) or (status=6) then status:=6 else status:=5;
         end;
         if self.Owner.ClassType.ClassParent=TMobileEquipment then begin
           if status in [0,2] then begin
              if not TMobileEquipment(Owner).IsReadyModular then status:=4;
           end;
         end;
     if status<>2 then ErrorStr:='';
     TEquipment(Owner).Unlock;
     LastCheckDateTime:=Now();
end;

function CInterface.CheckTableMCPar: boolean;
var qTempPowerView2:TADOQuery;
    shiftid:integer;
    countToWork, cntRows, shiftsec:integer;
    tm:TTime;
begin
     result:=false;
     CoInitialize(Nil);
     qTempPowerView2:=TADOQuery.Create(dm1);
     qTempPowerView2.Connection:=dm1.ConnPowerView;
     tm:=Time();
     shiftid:=DateToShift(Date(),tm);
     shiftsec:=TimeToShiftSec(tm);
     qTempPowerView2.SQL.Add('select count(*) as cntRows from hist_mc_par where shiftindex='+inttostr(shiftid));
     qTempPowerView2.Open;
     qTempPowerView2.First;
     cntRows:=qTempPowerView2.FieldByName('cntRows').AsInteger;
     countToWork:=0;
     if shiftsec>60*4 then countToWork:=10;
     if shiftsec>3600 then countToWork:=100;
     if shiftsec>3600*6 then countToWork:=2000;
     // Если количество записей не меньше порога для текущего времени, то все в порядке
     if cntRows>=countToWork then result:=true;
     qTempPowerView2.Close;
     FreeAndNil(qTempPowerView2);
end;

procedure CInterface.Clear;
begin
     status:=0;
     comment:='';
     LastCheckDateTime:=0;
end;

constructor CInterface.Create;
begin
  inherited;
  Clear;
  name:='Интерфейс';
  comment:='';
  errorstr:='';
  MonitoringSetting:=1;
  DisplayParameters:=TParameters.Create;
end;

destructor CInterface.Destroy;
begin
  FreeAndNil(DisplayParameters);
end;

function CInterface.GetDetailsMonitoringStatus: string;
var qMonitStat1:TADOQuery;
begin
     result:='Статус мониторинга неизвестен';
     coInitialize(nil);
     qMonitStat1:=TADOQuery.Create(dm1);
     qMonitStat1.Connection:=dm1.ConnMySQL;
     qMonitStat1.SQL.Add('select imo.id, imo.reason, imo.FIO, imo.datetimestart, imo.reason_category');
     qMonitStat1.SQL.Add('from interface_monitoring_off imo, equipment e, ref_interface ri');
     qMonitStat1.SQL.Add('where (e.Name="'+TEquipment(Owner).name+'") and (e.id=imo.equipment)');
     qMonitStat1.SQL.Add('and (ri.Name="'+name+'") and (ri.id=imo.ref_interface) and (imo.Active=1)');
     qMonitStat1.Open;
     qMonitStat1.Last;
     if qMonitStat1.RecordCount>0 then begin
        result:='Мониторинг интерфейса '+Name+' отключен '+ FormatDateTime('dd.mm.yyyy',qMonitStat1.FieldByName('datetimestart').AsDateTime)+' в '+ FormatDateTime('hh:mm',qMonitStat1.FieldByName('datetimestart').AsDateTime)+'. ';
        result:=result+'ФИО: '+qMonitStat1.FieldByName('FIO').AsString+'. Причина: '+qMonitStat1.FieldByName('reason').AsString;
     end else result:='Мониторинг интерфейса '+Name+' включен';
     FreeAndNil(qMonitStat1);
end;

// Поиск id интерфейса в БД
function CInterface.getInterfaceMYSQLID: integer;
var qFindIntfcMYSQL:TADOQuery;
begin
     result:=-1;
     CoInitialize(nil);
     qFindIntfcMYSQL:=TADOQuery.Create(dm1);
     qFindIntfcMYSQL.Connection:=dm1.ConnMySQL;
     qFindIntfcMYSQL.SQL.Add('select id, name from ref_interface where name='+#39+name+#39);
     qFindIntfcMYSQL.Open;
     qFindIntfcMYSQL.Last;
     if qFindIntfcMYSQL.RecordCount>0 then result:=qFindIntfcMYSQL.FieldByName('id').AsInteger else result:=-1;
     qFindIntfcMYSQL.Close;
     FreeAndNil(qFindIntfcMySQL);
end;

function CInterface.GetLastDataMCPar: TDateTime;
var qTempPV:TADOQuery;
    tm:TTime;
    shiftid:integer;
    secondsfrom1970:Largeint;
begin
     result:=0;
     CoInitialize(Nil);
     qTempPV:=TADOQuery.Create(dm1);
     qTempPV.Connection:=dm1.ConnPowerView;
     tm:=Time();
     shiftid:=DateToShift(Date(),tm);
     //shiftsec:=TimeToShiftSec(tm);
     qTempPV.SQL.Add('select max(timestamp) as maxtime from hist_mc_par where shiftindex='+inttostr(shiftid));
     try
        qTempPV.Open;
     except
        exit;
     end;
     qTempPV.First;
     secondsFrom1970:=qTempPV.FieldByName('maxtime').AsLargeInt;
     qTempPV.Close;
     FreeAndNil(qTempPV);
     try
          result:=StrToDate('01.01.1970')+secondsfrom1970/3600/24;
     except
         result:=0;
     end;
end;

function CInterface.GetMonitoringStatus: integer;
var qMonitStat:TADOQuery;
    queryCreated:boolean;
begin
     if IsMonitoringSuspended then begin
         Result:=mos_Damage;
         FMonitoringStatus:=result;
         exit;
     end;
     queryCreated:=false;
     if dm1.connectedDBubiquiti then begin
        try
          if not dm1.qMySQLTemp.Active then qMonitStat:=dm1.qMySQLTemp else begin
             CoInitialize(nil);
            qMonitStat:=TADOQuery.Create(dm1);
            qMonitStat.Connection:=dm1.ConnMySQL;
            queryCreated:=true;       
          end;
          qMonitStat.SQL.Clear;
          qMonitStat.SQL.Add('select imo.id, imo.reason, imo.FIO, imo.datetimestart, imo.reason_category');
          qMonitStat.SQL.Add('from interface_monitoring_off imo, equipment e, ref_interface ri');
          qMonitStat.SQL.Add('where (e.Name="'+TEquipment(Owner).name+'") and (e.id=imo.equipment)');
          qMonitStat.SQL.Add('and (ri.Name="'+name+'") and (ri.id=imo.ref_interface) and (imo.Active=1)');
          qMonitStat.Open;
          try
             qMonitStat.Last;
          except
             Result:=mos_Monitoring;
          end;
          if qMonitStat.RecordCount>0 then begin
             if qMonitStat.FieldByName('reason_category').AsInteger=0 then result:=mos_Disable else result:=mos_Damage;
          end else result:=mos_Monitoring;
          qMonitStat.Close;
          if queryCreated then FreeAndNil(qMonitStat);
        except
            result:=mos_Monitoring;
        end;
    end else result:=mos_Monitoring;
    FMonitoringStatus:=result;
end;

function CInterface.GetMonitoringSuspended: boolean;
begin
     result:=FResumeMonitoringDateTime>Now();
end;

procedure CInterface.MonitoringOff(reason,FIO:string;reason_category:integer);
var interfaceID:integer;
   infcindex:integer;
   intfcindex:integer;
begin
  if reason='' then Application.MessageBox(PChar('Не задана причина отключения мониторинга'),'Ошибка');
  if FIO='' then Application.MessageBox(PChar('Не задано ФИО отключающего мониторинг'),'Ошибка');
  if not TEquipment(self.owner).getMySQLIndex then begin
         Application.MessageBox(PChar('В базе данных не найдено оборудование с именем '+TMobileEquipment(self.owner).name+'.'),'Ошибка');
         exit;
  end;
  // Проверить, есть ли данный интерфейс в списке интерфейсов БД
  intfcindex:=self.MySQLID;
  if intfcindex<0 then begin
      Application.MessageBox(PChar('В базе данных не найден интерфейс с именем '+self.name),'Ошибка');
      exit;
  end;
  if self.GetMonitoringStatus<>mos_Monitoring then begin
     Application.MessageBox(PChar('Нельзя повторно отключить мониторинг.'+self.DetailsMonitoringStatus),'Информация');
     exit;
  end;
  // Открываем окно заполнения информации по отключению мониторинга
  if DM1.qModify.Active then DM1.qModify.Close;
  DM1.qModify.SQL.Clear;
  DM1.qModify.SQL.Add('insert into interface_monitoring_off (equipment, ref_interface, active, datetimestart, reason, FIO, reason_category)');
  DM1.qModify.SQL.Add('values('+inttostr(TMobileEquipment(self.owner).MySQLIndex)+','+inttostr(intfcindex)+',1,"'+ FormatDateTime('yyyy-mm-dd hh:mm:ss',Now())+'","'+reason+'","'+FIO+'",'+inttostr(reason_category)+')');
  //Application.MessageBox(PChar(DM1.qModifi.SQL.Text),'');
  DM1.qModify.ExecSQL;
  DM1.qModify.Close;
  self.Check;
end;

procedure CInterface.MonitoringOn;
var intfcindex:integer;
    qtmpqry:TADOQuery;
    moindex:integer;
    isSusp:boolean;
begin
    // Если мониторинг приостановлен, то выключаем приостановление
    issusp:=IsMonitoringSuspended;
    if issusp then MonitoringUnsuspend;
    if not TEquipment(self.owner).getMySQLIndex then begin
         Application.MessageBox(PChar('В базе данных не найдено оборудование с именем '+TEquipment(self.owner).name+'.'),'Ошибка');
         exit;
    end;
    // Проверить, есть ли данный интерфейс в списке интерфейсов БД
    intfcindex:=self.MySQLID;
    if intfcindex<0 then begin
        Application.MessageBox(PChar('В базе данных не найден интерфейс с именем '+self.name),'Ошибка');
        exit;
    end;
    if self.GetMonitoringStatus=mos_Monitoring then begin
       // Если мониторинг перед включением был приостановлен, а не выключен, то не выводить сообщение, а просто выйти
       if not issusp then begin
          Application.MessageBox(PChar('Мониторинг интерфейса '+self.name+' уже включен.'),'Информация');
       end;
       self.Check;
       exit;
    end;
    // Ищем ID записи отключения мониторинга
    CoInitialize(nil);
    qtmpqry:=TADOQuery.Create(dm1);
    qtmpqry.Connection:=dm1.ConnMySQL;
    qtmpqry.SQL.Add('select max(id) idoff from interface_monitoring_off where Active>0 and Equipment='+inttostr(TMobileEquipment(self.Owner).MySQLIndex)+' and ref_interface='+inttostr(intfcindex));
    qtmpqry.Open;
    moindex:=qtmpqry.FieldByName('idoff').AsInteger;
    qtmpqry.Close;
    FreeAndNil(qtmpqry);
    if moindex>0 then begin
        if DM1.qModify.Active then DM1.qModify.Close;
        DM1.qModify.SQL.Clear;
        DM1.qModify.SQL.Add('update interface_monitoring_off ');
        DM1.qModify.SQL.Add('set Active=0, datetimeend="'+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now())+'"');
        DM1.qModify.SQL.Add('where id='+inttostr(moindex));
        DM1.qModify.ExecSQL;
        DM1.qModify.Close;
    end;
    self.Check;
end;

procedure CInterface.MonitoringSuspend(ResumeTime: TDateTime);
begin
     FResumeMonitoringDateTime:=ResumeTime;
end;

procedure CInterface.MonitoringSuspendByHour;
begin
     FResumeMonitoringDateTime:=Now()+1/24;
end;

procedure CInterface.MonitoringUnsuspend;
begin
     if FResumeMonitoringDateTime>Now() then FResumeMonitoringDateTime:=Now();
end;

{ TParameterInterface }

{ TWiFiInterface }

function TWiFiInterface.AddDisplayParameter(parameterName: string): boolean;
begin
     inherited;
     result:=false;
     if parameterName='LostPercent' then begin
        DisplayParameters.Add(LostPercent);
        result:=true;
     end;
end;

function TWiFiInterface.CheckInterface: boolean;
var dt: TDate;
  tm: TTime;
  countPings, countNotSignal, minCountPingToCalculate: integer;
  lostPerc, NoDataLostPercent:real;
  trdy: Boolean;
  eqnum:integer;
  interfaceNum, parameternum: Integer;
  checkHours:shortInt;
  qTempMysql:TADOquery;
  MonStat:shortint;
  queryCreated:boolean;
  idmodem:integer;
begin
     result:=false;
     status:=0;
    checkHours:=4; // Количество часов, за которые будет рассчитываться процент потерянных пакетов
    NoDataLostPercent:=5; // Порог срабатывания неисправности по WiFi связи
    minCountPingToCalculate:=120; // Минимальное количество пакетов, которое необходимо для расчетов
    queryCreated:=false;
    if GetMonitoringStatus<>mos_Disable then begin
       tm:=Time();
       dt:=Date();
       if not dm1.qMySQLTemp.Active then qTempMysql:=dm1.qMySQLTemp else begin
          CoInitialize(nil);
          qTempMysql:=TADOQuery.Create(dm1);
          qTempMysql.Connection:=dm1.ConnMySQL;
          queryCreated:=true;
       end;
       qTempMySQL.SQL.Clear;
       // Узнаем id модема оборудования
       qTempMysql.SQL.Add('select id_modem from modems m where m.name="'+TEquipment(Owner).name+'"');
       qTempMysql.Open;
       qTempMysql.First;
       idmodem:=qTempMysql.FieldByName('id_modem').AsInteger;
       qTempMysql.Close;
       qTempMySQL.SQL.Clear;
       // Выбираем, сколько всего было запросов в статусе готов
       qTempMySQL.SQL.Add('select s.signal_level from statss s');

       if tm<(checkhours/24) then begin
          qTempMySQL.SQL.Add('where (((s.date="'+FormatDateTime('yyyy-mm-dd',dt)+'") and (s.id_modem='+inttostr(idmodem)+') and (s.time<="'+TimeToStr(tm)+'"))');
          qTempMySQL.SQL.Add('or ((s.date="'+FormatDateTime('yyyy-mm-dd',dt-1)+'") and (s.id_modem='+inttostr(idmodem)+') and (s.time>"'+TimeToStr(tm+((24-checkhours)/24))+'")))');
       end else begin
          qTempMySQL.SQL.Add('where ((s.date="'+FormatDateTime('yyyy-mm-dd',dt)+'") and (s.id_modem='+inttostr(idmodem)+') and (s.time>"'+TimeToStr(tm-(checkhours/24))+'"))');
       end;
       //qTempMySQL.SQL.Add('and (s.id_modem=m.id_modem) and (m.name="'+TEquipment(Owner).name+'") ');
       qTempMySQL.SQL.Add('and (s.status=2)');
       try
         qTempMySQL.Open;
         // Вычисляем количество всех записей и тех, где уровень сигнала был -100
         qTempMySQL.First;
         countPings:=0;
         countNotSignal:=0;
         while not qTempMySQL.Eof do begin
             inc(countPings);
             // Вычисляем неудачные пинги
             if qTempMySQL.FieldByName('signal_level').AsInteger=156 then inc(countNotSignal);
             qTempMySQL.Next;
         end;
       except
         result:=false;
       end;
       qTempMySQL.Close;
       // Если создавали новый запрос, то освобождаем память
       if queryCreated then FreeAndNil(qTempMysql);
       status:=0;
       // В статусе Готов был не менее 20 минут
       if countPings>0 then lostperc:=Round(countNotSignal/countPings*100*100)/100 else lostperc:=0;
       if countPings>minCountPingToCalculate then begin
          status:=1;
          if lostperc>NoDataLostPercent then status:=2;
       end;
       LostPercent.value:=formatFloat('#0.00',lostperc);
    end else status:=3;
    if status=2 then ErrorStr:=LostPercent.value+'% потерянных пакетов за последние '+IntToStr(checkHours)+' часов' ;
    result:=true;
end;

constructor TWiFiInterface.Create;
begin
  inherited;
  name:='WiFi';
  DisplayName:='WiFi';
  LostPercent:=TParameterInterface.Create();
  LostPercent.name:='LostPercent';
  LostPercent.displayName:='Потерь';
  LostPercent.value:='0';
  LostPercent.edizm:='%';
  LostPercent.FormatVal:='00,00 ';
end;

destructor TWiFiInterface.Destroy;
begin
  LostPercent.Free;
  Inherited;
end;

{ TEquipment }


function TEquipment.AddInterface(interfaceName: string; MonitoringSetting:shortint): boolean;
begin
     result:=false;
end;

constructor TEquipment.Create;
begin
     inherited;
     FInterfacesEquipment:=CInterfaces.Create;
     FInterfacesEquipment.FOwner:=self;
end;

destructor TEquipment.Destroy;
begin
     FinterfacesEquipment.Free;
end;

function TEquipment.FindInterfaceByName(InterfaceName: string): CInterface;
var i:integer;
begin
     result:=nil;
     for I := 0 to Interfaces.count-1 do begin
         if Interfaces[i].name=InterfaceName then result:=Interfaces[i];
     end;
end;

// Присвоение статуса оборудованию на основе статусов его интерфейсов
function TEquipment.GetStatus: shortint;
var i:integer;
begin
     result:=0;
     for I := 1 to Interfaces.count do begin
         if Interfaces[i].status=4 then result:=4;
         if (result<>4) and (Interfaces[i].status=2) then result:=2;
         if (not (result in [4,2])) and (Interfaces[i].status=6) then result:=6;
         if (not (result in [4,2,6])) and (Interfaces[i].status=5) then result:=5;
         if (not (result in [4,2,6,5])) and (Interfaces[i].status=1) then result:=1;
         if (not (result in [4,2,6,5,1])) and (Interfaces[i].status=3) then result:=3;
     end;
end;


function TMobileEquipment.GetModularReadySeconds: integer;
var shiftid:integer;
    qModularStatus:TADOQuery;

begin
         shiftid:=DateToShift(Date(),Time());
            CoInitialize(nil);
           qModularStatus:=TADOQuery.Create(dm1);
           qModularStatus.Connection:=dm1.ConnPowerView;
         qModularStatus.SQL.Clear;
         qModularStatus.SQL.Add('select starttime, status from hist_statusevents');
         qModularStatus.SQL.Add('where (shiftindex='+IntToStr(shiftid)+') and (eqmt='+#39+name+#39+') order by starttime');
         try
             qModularStatus.Open;
             qModularStatus.Last;
             if (qModularStatus.RecordCount>0) then begin
                if qModularStatus.FieldByName('status').AsInteger=ms_ready then begin
                   result:=round((Now-ShiftAndSecToDateTime(shiftid,qModularStatus.FieldByName('starttime').AsInteger-1))*24*3600);
                end;
             end else Result:=-1;
             qModularStatus.Close;
         except
             result:=ms_unknown;
         end;
         FreeAndNil(qModularStatus);
end;

function TMobileEquipment.GetModularStatus: integer;
var shiftid:integer;
    qModularStatus:TADOQuery;
    queryCreated:boolean;
begin
         shiftid:=DateToShift(Date(),Time());
            CoInitialize(nil);
           qModularStatus:=TADOQuery.Create(dm1);
           qModularStatus.Connection:=dm1.ConnPowerView;
         qModularStatus.SQL.Clear;
         qModularStatus.SQL.Add('select starttime, status from hist_statusevents');
         qModularStatus.SQL.Add('where (shiftindex='+IntToStr(shiftid)+') and (eqmt='+#39+name+#39+') order by starttime');
         try
             qModularStatus.Open;
             qModularStatus.Last;
             if (qModularStatus.RecordCount>0) then Result:=qModularStatus.FieldByName('status').AsInteger
                else Result:=ms_unknown;
             qModularStatus.Close;
         except
             result:=ms_unknown;
         end;
         FreeAndNil(qModularStatus);
end;

// Функция получения индекса оборудования в таблице MySQL
function TEquipment.GetMySQLIndex : boolean;
var qEquipment:TADOQuery;
begin
     if DM1.ConnectedDBUbiquiti then begin
        qEquipment:=TADOQuery.Create(DM1);
        qEquipment.Active:=false;
        qEquipment.Connection:=DM1.ConnMySQL;
        qEquipment.SQL.Add('select id from equipment where name="'+self.Fname+'"');
        qEquipment.Open;
        qEquipment.Last;
        qEquipment.First;
        if qEquipment.RecordCount<>0 then begin
           FMySQLIndex:=qEquipment.FieldByName('id').AsInteger;
           result:=true;
        end;
        qEquipment.Close;
        qEquipment.Free;
     end else result:=false;

end;

function TMobileEquipment.IsReadyModular: boolean;
begin
     if GetModularStatus=2 then result:=true else result:=false;
end;

procedure TMobileEquipment.SetModemIP(value: string);
begin
     if IsIPAddress(Value) then FModemIP := Value else FModemIP:='';
end;

function TEquipment.Lock:boolean;
var slp,cnt:integer;
begin
     slp:=50;
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

function TEquipment.Pinged: boolean;
var slp:integer;
    cntretry:integer;
    data1:string;
    failPing:integer;
begin
     result:=false;
     if IsIPAddress(IPAddress) then begin
        cntretry:=0;
        if not OSSH.Lock then exit;
        slp:=OSSH.sleeptm;
        OSSH.Answer.Clear;
        OSSH.sleeptm:=5000;
        OSSH.command:='ping -c 3 '+IPAddress+' | grep -c Unreach';
        // Если команда выполнена успешно, то проверяем полученный результат, чтобы там была цифра 3
        if OSSH.Execute then begin
           if OSSH.Answer.Count>0 then data1:=OSSH.Answer.Strings[OSSH.Answer.Count-1] else data1:='';
           if data1<>'' then begin
              try
                 failPing:=StrToInt(data1);
                 if failPing=0 then result:=true;
              except

              end;
           end;
        end;
        OSSH.sleeptm:=slp;
        OSSH.Unlock;
     end else Application.MessageBox(PChar('Строка '+IPAddress+' не является IP-адресом'),'Ошибка') ;
end;

procedure TEquipment.SetIPAddress(const Value: string);
begin
  if IsIPAddress(Value) then FIPAddress := Value else FIPAddress:='';
end;

procedure TEquipment.Unlock;
begin
     FBusy:=false;
end;

{ TMobileEquipment }

function TEquipment.getIPAddress: string;
var qEquipment:TADOQuery;
begin
     if DM1.ConnMySQL.Connected then begin
        qEquipment:=TADOQuery.Create(DM1);
        qEquipment.Active:=false;
        qEquipment.Connection:=DM1.ConnMySQL;
        qEquipment.SQL.Add('select ip_address from equipment where name="'+self.Fname+'"');
        qEquipment.Open;
        qEquipment.Last;
        qEquipment.First;
        if qEquipment.RecordCount<>0 then begin
           result:=qEquipment.FieldByName('id').AsString;
        end;
        qEquipment.Close;
        qEquipment.Free;
     end else result:='';
end;

{ TExcav }

function TExcav.AddInterface(interfaceName: string; MonitoringSetting:shortint): boolean;
begin
     inherited;
     result:=false;
     if interfaceName='WiFi' then begin
        Interfaces.Add(WiFi,MonitoringSetting);
        result:=true;
     end;
     if interfaceName='GPS' then begin
        Interfaces.Add(GPS,MonitoringSetting);
        result:=true;
     end;
end;

constructor TExcav.Create;
begin
      inherited;
      WiFi:=TWiFiInterface.Create;
      Wifi.Owner:=Self;
      GPS:=TGpsInterface.Create;
      GPS.Owner:=self;
end;

destructor TExcav.Destroy;
begin
      FreeAndNil(WiFi);
      FreeAndNil(GPS);
end;

{ TSettings }


constructor TSettings.Create;
begin
     inherited;
     Sound:=TNotificationSound.Create;
     sound.FSettingFileName:=FileName;
end;

procedure TSettings.CreateNewVersionsSettings(var iniFile: TIniFile);
begin
     if versionLess(ApplVersion,stringToApplVersion('4.1')) and (not iniFile.ValueExists('Update','UpdateEnabled')) then begin
        iniFile.WriteBool('Update','UpdateEnabled',true);
        if User='asugtkadm' then begin
           iniFile.WriteString('Update','UpdateFolder','W:\УКиСС\Участок АСУ ГТК\programs\ASUGTKMonitor\Update\');
        end else begin
           iniFile.WriteString('Update','UpdateFolder','O:\ДИТ\АСУ ГТК\ASUGTKMonitor\');
        end;
     end;
     if versionLess(ApplVersion,stringToApplVersion('4.1.12')) then begin
        if user='asugtkadm' then begin
           iniFile.WriteInteger('BaseSettings','sleepTimeServers',120);
        end;
     end;
     if versionLess(ApplVersion,stringToApplVersion('4.3.2')) then begin
        if user='asugtkadm' then begin
           iniFile.WriteInteger('interfaces','GPS',1);
           iniFile.WriteInteger('GPS','LastGPSDateTime',1);
        end;
     end;
     if versionLess(ApplVersion,stringToApplVersion('4.4')) and (not iniFile.ValueExists('BaseSettings','ShowNetwork')) then begin
        if user='asugtkadm' then begin
           iniFile.WriteInteger('BaseSettings','ShowNetwork',1);
        end;
     end;

end;

destructor TSettings.Destroy;
begin
    Sound.Free;
end;

function TSettings.getApplVersion: TApplVersion;
var iniFile:TIniFile;
begin
     if FileExists(FileName) then begin
        inifile:=TIniFile.Create(FileName);
        result.Major:=iniFile.ReadInteger('Version','Major',0);
        Result.Minor:=iniFile.ReadInteger('Version','Minor',0);
        Result.Release:=iniFile.ReadInteger('Version','Release',0);
        FreeAndNil(iniFile);
     end;
end;

function TSettings.getInterfacesCount: integer;
begin
     result:=Length(interfaces);
end;

function TSettings.getIsAdmin: boolean;
begin
     if User='asugtkadm' then result:=true else result:=false;
end;

function TSettings.GetSleepTimeCategoryValue(value: integer): integer;
begin
     if value<1 then result:=SleepTimeSeconds else result:=value;
end;

function TSettings.GetSleepTimeEquipment: integer;
begin
     result:=GetSleepTimeCategoryValue(FSleepTimeEquipment);
end;

function TSettings.GetSleepTimeExcavs: integer;
begin
     result:=GetSleepTimeCategoryValue(FSleepTimeExcavs);
end;

function TSettings.GetSleepTimeNetwork: integer;
begin
  result:=GetSleepTimeCategoryValue(FSleepTimeNetwork);
end;

function TSettings.GetSleepTimeServers: integer;
begin
     result:=GetSleepTimeCategoryValue(FSleepTimeServers);
end;

function TSettings.getTasksCount: integer;
begin
     result:=Length(tasks);
end;

function TSettings.ReadSettings(SettingsFileName: string): boolean;
var iniFile:TIniFile;
    vars, pars1:TStrings;
    i,j,k,l:integer;
    PossibleTasks:TStrings;
    PossibleInterfaces:TStrings;
    finfo:TFileInfo;
    fVers:TApplVersion;
begin
  PossibleInterfaces:=TStringList.Create;
  PossibleInterfaces.Add('WiFi');
  PossibleInterfaces.Add('GPS');
  PossibleInterfaces.Add('Pressure');
  PossibleInterfaces.Add('VEI');
  PossibleTasks:=TStringList.Create;
  PossibleTasks.Add('ResetPresspro');
  PossibleTasks.Add('DrawPitgraph');
  PossibleTasks.Add('GetGPSInformation');
  PossibleTasks.Add('DrawPitASUGTK');
  if FileExists(settingsFileName) then begin
     FfileName:=SettingsFileName;
     inifile:=TIniFile.Create(settingsFileName);
     FUser:=iniFile.ReadString('Security','User','guest');
     // Запись первичных настроек для новых функций новых версий
     CreateNewVersionsSettings(iniFile);
     // Конец записи первичных настроек для новых функций новых версий
     sleeptimeSeconds:=inifile.ReadInteger('BaseSettings','sleepTime',600);
     FCopyExe:=iniFile.ReadBool('BaseSettings','CopyExe',false);
     NotCheckServers:=iniFile.ReadBool('BaseSettings','NotCheckServers',false);
     NotShowErrors:=iniFile.ReadBool('BaseSettings','NotShowErrors',false);
     ShowExcavs:=iniFile.ReadBool('BaseSettings','ShowExcavs',false);
     ShowNetwork:=iniFile.ReadBool('BaseSettings','ShowNetwork',false);
     // Чтение настроек размера окна
     FClientWidth:=iniFile.ReadInteger('View','ClientWidth',770);
     FClientHeight:=iniFile.ReadInteger('View','ClientHeight',600);
     // Чтение информации об обновлении
     FUpdateEnabled:=iniFile.ReadBool('Update','UpdateEnabled',false);
     FUpdateFolder:=iniFile.ReadString('Update','UpdateFolder','');
     FUpdatePostfix:=iniFile.ReadString('Update','UpdatePostfix','');
     FSleepTimeEquipment:=iniFile.ReadInteger('BaseSettings','sleepTimeEquipment',0);
     FSleepTimeExcavs:=iniFile.ReadInteger('BaseSettings','sleepTimeExcavs',0);
     FSleepTimeServers:=iniFile.ReadInteger('BaseSettings','sleepTimeServers',0);
     sound.FSettingFileName:=FileName;
     Sound.FEnable:=iniFile.ReadBool('Sound','Enable',true);
     Sound.Fduration:=iniFile.ReadInteger('Sound','Duration',60);
     vars:=TStringList.Create;
     iniFile.ReadSection('Interfaces',vars);
     pars1:=TStringList.Create;
     j:=0;
     for i := 0 to vars.Count - 1 do begin
         if (vars[i]<>'') and (PossibleInterfaces.IndexOf(vars[i])>-1) then begin
            inc(j);
            SetLength(interfaces,j);
            interfaces[j-1].name:=vars[i];
            interfaces[j-1].MonitoringStatus:=iniFile.ReadInteger('Interfaces',vars[i],1);
            // Проставляем статус мониторинга
            // 0 - Только выводить интерфейс в таблицу и не производить проверку
            // 1 - Выполнять проверки и выводить сообщение о неисправностях
            // 2 - Выполнять проверки, но не выаодить сообщения о неисправностях (для неважных интерфейсов)
            if interfaces[j-1].MonitoringStatus>2 then interfaces[j-1].MonitoringStatus:=1;
            iniFile.ReadSection(interfaces[j-1].name,pars1);
            l:=0;
            for k := 0 to pars1.count - 1 do begin
              if (pars1[k]<>'') and (pars1[k]<>' ') then begin
                 inc(l);
                 SetLength(interfaces[j-1].parameters,l);
                 interfaces[j-1].parameters[l-1]:=pars1[k];
              end;
            end;
         end;
     end;
     // Читаем настройки задач
     vars.Clear;
     iniFile.ReadSection('Tasks',vars);
     j:=0;

     for I := 0 to vars.Count - 1 do begin
         if (vars[i]<>'') and (PossibleTasks.IndexOf(vars[i])>-1) then begin
            inc(j);
            SetLength(tasks,j);
            tasks[j-1].name:=vars[i];
            tasks[j-1].sleeptimeSec:=iniFile.ReadInteger('Tasks',vars[i],3600);
            if (tasks[j-1].sleeptimeSec<300) and (tasks[j-1].sleeptimeSec<>0) then begin
               Application.MessageBox('Промежуток между выполнением задач не должен быть меньше 5 минут','Ошибка');
               iniFile.WriteInteger('Tasks',vars[i],300);
               tasks[j-1].sleeptimeSec:=300;
            end;
         end;
     end;
     // Конец чтения настроек задач
     // Запись запущенной версии программы в файл настроек
     GetFileInfo(Application.ExeName,finfo);
     fVers.Major:=finfo.FileVersion.MajorVersion;
     fVers.Minor:=finfo.FileVersion.MinorVersion;
     fVers.Release:=finfo.FileVersion.Release;
     ApplVersion:=fVers;
     // Конец записи запущенной версии программы в файл настроек
     iniFile.Destroy;
     FreeAndNil(vars);
     FreeAndNil(pars1);
  end else begin
     FfileName:='';
     sleeptimeSeconds:=600;
     FCopyExe:=false;
     SetLength(interfaces,0);
     setLength(tasks,0);
  end;
  FreeAndNil(PossibleTasks);
  FreeAndNil(PossibleInterfaces);
end;

procedure TSettings.SetApplVersion(value: TApplVersion);
var iniFile1:TIniFile;
begin
     if FileExists(FileName) then begin
        inifile1:=TIniFile.Create(FileName);
        iniFile1.WriteInteger('Version','Major',value.Major);
        iniFile1.WriteInteger('Version','Minor',value.Minor);
        iniFile1.WriteInteger('Version','Release',value.Release);
        iniFile1.UpdateFile;
        iniFile1.Destroy;
     end;
end;

procedure TSettings.SetClientSizes(width: integer; height:integer);
var iniFile:TIniFile;
begin
     if FileExists(FileName) and (width>100) and (height>100) then begin
         iniFile:=TIniFile.Create(FileName);
         iniFile.WriteInteger('View','ClientHeight',height);
         iniFile.WriteInteger('View','ClientWidth',width);
         iniFile.UpdateFile;
         FreeAndNil(iniFile);
     end;
end;

function TSettings.stringToApplVersion(value: string): TApplVersion;
var dotpos, poscopy, posdel :integer;
    str:string;
    i:integer;
    val:integer;
begin
     str:=value;
     result.Major:=0;
     result.Minor:=0;
     result.Release:=0;
     for I := 1 to 3 do begin
         if Length(str)>0 then begin
             dotpos:=pos('.',str);
             if dotpos>0 then begin
                poscopy:=dotpos-1;
                posdel:=dotpos;
             end else begin
                poscopy:=Length(str);
                posdel:=poscopy;
             end;
             try
                val:=strtoint(copy(str,1,poscopy));
             except
                val:=0;
             end;
             case i of
                1: result.Major:=val;
                2: result.Minor:=val;
                3: result.Release:=val;
             end;
             Delete(str,1,posdel);
         end;
     end;
end;

function TSettings.VersionLess(version1, version2: TApplVersion): boolean;
var FindDiff:boolean;
begin
         FindDiff:=false;
         // Сравниваем главные версии
         if version1.Major>version2.Major then begin
            FindDiff:=true;
            Result:=false;
         end else begin
            if version1.Major<version2.Major then begin
               FindDiff:=true;
               result:=true;
            end;
         end;
         // Если не нашли отличия в главных версиях, то сравниваем младшие версии
         if not FindDiff then begin
              if version1.Minor>version2.Minor then begin
                FindDiff:=true;
                Result:=false;
             end else begin
                if version1.Minor<version2.Minor then begin
                   FindDiff:=true;
                   result:=true;
                end;
             end;
         end;
         // Если не нашли отличия в младших версиях, то сравниваем релизы
         if not FindDiff then begin
              if version1.Release>version2.Release then begin
                FindDiff:=true;
                Result:=false;
             end else begin
                if version1.Release<version2.Release then begin
                   FindDiff:=true;
                   result:=true;
                end else result:=false;
             end;
         end;
end;

{ TServer }

function TServer.getIPAddress: string;
begin
     FIPAddress:='';
     if name='lgkdisp' then FIPAddress:='10.70.121.3';
     if name='lgkback' then FIPAddress:='10.70.121.4';
     if name='PowerView' then FIPAddress:='10.70.121.5';
end;

{ TPowerView }

constructor TPowerView.Create;
begin
     inherited;
     LoadDataInterface:=TPowerViewLoadDataInterface.Create;
     LoadDataInterface.name:='LastLoadData';
     LoadDataInterface.DisplayName:='Выгрузка данных';
     LoadDataInterface.Owner:=self;
end;

destructor TPowerView.Destroy;
begin
     LoadDataInterface.Free;
end;

{ TDispatch }

constructor TDispatch.Create;
begin
      inherited;
      IsRunTransact:= TRunTransactInterface.Create;
      IsRunTransact.name:='IsRunTransact';
      IsRunTransact.DisplayName:='Транзакции';
      IsRunTransact.Owner:=Self;
      IsRunExcept:=TRunExceptInterface.Create;
      IsRunExcept.name:='IsRunExcept';
      IsRunExcept.DisplayName:='Исключения';
      IsRunExcept.Owner:=Self;
      IsRunGPS:=TRunGPSInterface.Create;
      IsRunGPS.name:='IsRunGPS';
      IsRunGps.DisplayName:='Сбор GPS';
      IsRunGPS.Owner:=Self;
end;

destructor TDispatch.Destroy;
begin
      IsRunTransact.Free;
      IsRunExcept.Free;
      IsRunGPS.Free;
end;

{ CInterfaces }

procedure CInterfaces.Add(Intfc: CInterface; MonitoringSetting:shortint);
begin
     SetLength(FInterfaces,Length(FInterfaces)+1);
     FInterfaces[high(FInterfaces)]:=Intfc;
     Intfc.MonitoringSetting:=MonitoringSetting;
end;


constructor CInterfaces.Create;
begin
     inherited;
     SetLength(FInterfaces,0);
end;

procedure CInterfaces.Delete(index1:integer);
var i:integer;
begin
     if (index1>count) or (index1<1) then exit;
     for i:=index1 to count-1 do begin
         FInterfaces[i-1]:=FInterfaces[i];
     end;
     FInterfaces[count-1]:=nil;
     SetLength(FInterfaces,Length(FInterfaces)-1);
end;

destructor CInterfaces.Destroy;
begin
     SetLength(FInterfaces,0);
end;

function CInterfaces.getByName(Name: string): CInterface;
var i:integer;
begin
     result:=nil;
     for i := 0 to Self.count - 1 do begin
         if FInterfaces[i].name=Name then result:=FInterfaces[i];
     end;
end;

function CInterfaces.getCount: integer;
begin
     result:=Length(self.FInterfaces);
end;

function CInterfaces.getInterface(Index: integer): CInterface;
begin
     try
      result:=FInterfaces[index-1];
     except
      result:=nil;
     end;
end;

{ TParameters }

procedure TParameters.Add(Prmtr: TParameterInterface);
begin
     SetLength(FParameters,Length(FParameters)+1);
     FParameters[high(FParameters)]:=Prmtr;
end;

constructor TParameters.Create;
begin
     inherited;
     SetLength(FParameters,0);
end;

procedure TParameters.Delete(index1: integer);
var i:integer;
begin
     if (index1>count) or (index1<1) then exit;
     for i:=index1 to count-1 do begin
         FParameters[i-1]:=FParameters[i];
     end;
     FParameters[count-1]:=nil;
     SetLength(FParameters,Length(FParameters)-1);
end;

destructor TParameters.destroy;
begin
     SetLength(FParameters,0);
end;

function TParameters.getCount: integer;
begin
     result:=Length(FParameters);
end;

function TParameters.getParameter(index1: integer): TParameterInterface;
begin
     try
      result:=FParameters[index1-1];
     except
      result:=nil;
     end;
end;

{ TPowerViewLoadDataInterface }

function TPowerViewLoadDataInterface.CheckInterface: boolean;
var f:boolean;
begin
     f:=CheckLastData;
     // Если нет данных на сервере PowerView, то делаем контрольную проверку через 15 секунд
     if f and (status=2) then begin
        sleep(15000);
        f:=CheckLastData;
     end;
end;

function TPowerViewLoadDataInterface.CheckLastData: boolean;
var dt:TDate;
    tm:TTime;
    shiftindex, shiftSeconds, diffMinutes:integer;
    qPowerViewStatus:TADOQuery;
    LastDataDateTime:TDateTime;
begin
    result:=false;
    dt:=Date();
    tm:=Time();
    shiftindex:=DateToShift(dt,tm);
    shiftSeconds:=TimeToShiftSec(tm);
    // Если с начала смены прошло менее 20 минут, то проверять предыдущую смену на наличие данных
    if shiftseconds<1200 then begin
        shiftindex:=shiftindex - 1;
        shiftseconds:=12*3600;
    end;
    // Без него не создаются ADOQuery
    CoInitialize(nil);
    qPowerViewStatus:=TADOQuery.Create(dm1);
    qPowerViewStatus.Connection:=dm1.ConnPowerView;
    qPowerViewStatus.SQL.Clear;
    qPowerViewStatus.SQL.Add('select max(endtime) as endtm from hist_statusevents where shiftindex='+inttostr(shiftindex));
    FLastCheckDateTime:=Now();
    try
       if not qPowerViewStatus.Active then qPowerViewStatus.Open;
    except
       //Application.MessageBox('Нет связи с сервером PowerView. Проверьте работу сервера PowerView','Ошибка');
       result:=false;
    end;
    qPowerViewStatus.Last;
    lastDataDateTime:=ShiftAndSecToDateTime(shiftindex,qPowerViewStatus.FieldByName('endtm').AsInteger);
    diffMinutes:=round((shiftseconds-qPowerViewStatus.FieldByName('endtm').asinteger)/60);
    if shiftseconds-qPowerViewStatus.FieldByName('endtm').asinteger<1200 then status:=1 else status:=2;
    //status:=2;
    comment:='последняя '+FormatDateTime('dd.mm.yyyy hh:MM',lastDataDateTime)+' ('+inttostr(diffMinutes)+' минут назад)';
    // Записываем ошибку выгрузки
    if status=2 then errorStr:=' Данные не выгружались '+ inttostr(diffMinutes) +' минут. Последняя выгрузка была '+FormatDateTime('dd.mm.yyyy hh:MM',lastDataDateTime)
      else errorStr:='';
    qPowerViewStatus.Close;
    qPowerViewStatus.Free;
    result:=true;
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
      // Пушим пустую команду, чтобы в полученном тексте в конце был $lgkdisp:
      {FillChar(Data,255,#0);
      DataString:=' ';
      move(Datastring[1],Data,Length(Datastring));
      LenData1:=Length(Datastring);
      SSH.PushData(addr(Data), LenData1, BytePushed);
      sleep(sleeptm1 div 5);
      while (BytePushed<LenData1) and (currentretries<countretries) do begin
            inc(currentretries);
            Sleep(diffsleep);
      end;
      if currentretries=countretries then begin
         Result:=false;
         exit;
      end;
      SSH.FlushData;
      sleep(sleeptm1); }
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

{ TRunTransactInterface }

function TRunTransactInterface.CheckInterface: boolean;
var dt:TDate;
    findstr,strproc,s, dateRunStr:string;
    procline,wordindex,a,b,c:integer;
    j:integer;
    year,month,day:word;
    LastDataDateTime:TDateTime;
    monthstr:string;
    str:string;
begin
     str:='';
     if not OSSH.Lock then exit;
     dt:=Date();
     OSSH.Answer.Clear;
     OSSH.sleeptm:=600;
     OSSH.command:='ps -eaf | grep field';
     findstr:='.transact';
     if OSSH.Execute then begin
       procLine:=-1;
       for j:=0 to OSSH.Answer.Count-1 do begin
            if pos(findstr,OSSH.Answer[j]) <> 0 then procline:=j;
       end;
       // Если найдена строка процесса транзакций или исключений, то ставим статусы и ищем время запуска процесса
       if procLine>-1 then begin
          status:=1;
          strProc:=OSSH.Answer[procline];
          Trim(strProc);
          strProc:=DelDoubleSpaces(strProc);
          // Дата или время создания процесса, это 5-е слово в строке
          // Поэтому ищем и вытягиваем 5-е слово
          wordindex:=0;
          while length(strproc)>0 do begin
              a:=pos(' ',strproc);
              inc(wordindex);
              if a=0 then begin
                  b:=length(strproc);
                  c:=length(strproc);
              end else begin
                  b:=a;
                  c:=a-1;
              end;
              s:=copy(strproc,1,c);
              if wordindex=5 then begin
                  dateRunstr:=s;
              end;
              delete(strproc,1,b);
          end;
          DecodeDate(Now(),year,month,day);
          if pos(':',DateRunStr)<>0 then begin
              LastDataDateTime:=dt + StrToTime(dateRunstr);
              if LastDataDateTime>Now() then LastDataDateTime:=LastDataDateTime-1;
          end else begin
              try
                  monthstr:=copy(dateRunStr,1,3);
                  month:=getMonthNumByString(monthstr);
                  day:=strtoint(copy(dateRunStr,4,2));
                  LastDataDateTime:=EncodeDate(year,Month,Day);
                  if LastDataDateTime>Now() then LastDataDateTime:=EncodeDate(year-1,Month,Day);
              except
                  LastDataDateTime:=0;
              end;
          end;

        end else status:=2;
        // Если нет данных с 7:00 до 7:25, значит считаем, что это - пересмена
        if (status=2) and (((Time()>StrToTime('07:00')) and (Time()<StrToTime('07:25'))) or ((Time()>StrToTime('19:00')) and (Time()<StrToTime('19:25')))) then status:=4;
        // Запись ошибки по интерфейсу
        if status=2 then ErrorStr:='Окно транзакций не запущено на сервере '+TDispatch(Owner).name + '. Свяжитесь с диспетчером'
           else ErrorStr:='';
        // Запись комментария к интерфейсу
        if (status=1) and (LastDataDateTime>0) then begin
              str:=str+'. Запущено '+FormatDateTime('dd.mm.yyyy', LastDataDateTime);
              // Если отсутствует время, то выводить только дату
              if LastDataDateTime<>Round(LastDataDateTime) then
                 str:=str+' '+FormatDateTime('hh:MM',LastDataDateTime);
        end;
     end else status:=0;
     comment:=str;
     OSSH.Unlock;
end;

{ TTruck }

function TTruck.AddInterface(interfaceName: string; MonitoringSetting:shortint): boolean;
begin
     inherited;
     result:=false;
     if interfaceName='WiFi' then begin
        Interfaces.Add(WiFi, MonitoringSetting);
        result:=true;
     end;
     if interfaceName='GPS' then begin
        Interfaces.Add(GPS, MonitoringSetting);
        result:=true;
     end;
     if interfaceName='VEI' then begin
        Interfaces.Add(VEI, MonitoringSetting);
        result:=true;
     end;
     if interfaceName='Pressure' then begin
        Interfaces.Add(Pressure, MonitoringSetting);
        result:=true;
     end;
end;

constructor TTruck.Create;
begin
     inherited;
     WiFi:=TWiFiInterface.Create;
     Wifi.Owner:=Self;
     GPS:=TGpsInterface.Create;
     GPS.Owner:=self;
     VEI:=TVEIInterface.Create;
     VEI.Owner:=Self;
     Pressure:=TPressureInterface.Create;
     Pressure.Owner:=self;
end;

destructor TTruck.Destroy;
begin
     FreeAndNil(WiFi);
     FreeAndNil(GPS);
     FreeAndNil(VEI);
     FreeAndNil(Pressure);
     inherited;
end;

{ TRunExceptInterface }

function TRunExceptInterface.CheckInterface: boolean;
    var dt:TDate;
    findstr,strproc,s, dateRunStr:string;
    procline,wordindex,a,b,c:integer;
    j:integer;
    year,month,day:word;
    LastDataDateTime:TDateTime;
    monthstr, str:string;
begin
     str:='';
     if not OSSH.Lock then exit;
     dt:=Date();
     OSSH.Answer.Clear;
     OSSH.sleeptm:=600;
     OSSH.command:='ps -eaf | grep except';
     findstr:='.except';
     if OSSH.Execute then begin
       procLine:=-1;
       for j:=0 to OSSH.Answer.Count-1 do begin
            if pos(findstr,OSSH.Answer[j]) <> 0 then procline:=j;
       end;
       // Если найдена строка процесса транзакций или исключений, то ставим статусы и ищем время запуска процесса
       if procLine>-1 then begin
          status:=1;
          strProc:=OSSH.Answer[procline];
          Trim(strProc);
          strProc:=DelDoubleSpaces(strProc);
          // Дата или время создания процесса, это 5-е слово в строке
          // Поэтому ищем и вытягиваем 5-е слово
          wordindex:=0;
          while length(strproc)>0 do begin
              a:=pos(' ',strproc);
              inc(wordindex);
              if a=0 then begin
                  b:=length(strproc);
                  c:=length(strproc);
              end else begin
                  b:=a;
                  c:=a-1;
              end;
              s:=copy(strproc,1,c);
              if wordindex=5 then begin
                  dateRunstr:=s;
              end;
              delete(strproc,1,b);
          end;
          DecodeDate(Now(),year,month,day);
          if pos(':',DateRunStr)<>0 then begin
              LastDataDateTime:=dt + StrToTime(dateRunstr);
              if LastDataDateTime>Now() then LastDataDateTime:=LastDataDateTime-1;
          end else begin
              try
                  monthstr:=copy(dateRunStr,1,3);
                  month:=getMonthNumByString(monthstr);
                  day:=strtoint(copy(dateRunStr,4,2));
                  LastDataDateTime:=EncodeDate(year,Month,Day);
                  if LastDataDateTime>Now() then LastDataDateTime:=EncodeDate(year-1,Month,Day);
              except
                  LastDataDateTime:=0;
              end;
          end;

        end else status:=2;
        // Если нет данных с 7:00 до 7:25, значит считаем, что это - пересмена
        if (status=2) and (((Time()>StrToTime('07:00')) and (Time()<StrToTime('07:25'))) or ((Time()>StrToTime('19:00')) and (Time()<StrToTime('19:25')))) then status:=4;
        // Запись ошибки по интерфейсу
        if status=2 then ErrorStr:='Окно исключений не запущено на сервере '+TDispatch(Owner).name + '. Свяжитесь с диспетчером'
           else ErrorStr:='';
        // Запись комментария к интерфейсу
        if (status=1) and (LastDataDateTime>0) then begin
              str:=str+'. Запущено '+FormatDateTime('dd.mm.yyyy', LastDataDateTime);
              // Если отсутствует время, то выводить только дату
              if LastDataDateTime<>Round(LastDataDateTime) then
                 str:=str+' '+FormatDateTime('hh:MM',LastDataDateTime);
        end;
     end else status:=0;
     comment:=str;
     OSSH.Unlock;
end;

{ TRunGPSInterface }

function TRunGPSInterface.CheckInterface: boolean;
var dt:TDate;
    findstr,strproc,s, dateRunStr:string;
    procline,wordindex,a,b,c:integer;
    j:integer;
    year,month,day:word;
    LastDataDateTime:TDateTime;
    monthstr, str:string;
begin
      str:='';
     if not OSSH.Lock then exit;
     dt:=Date();
     OSSH.Answer.Clear;
     OSSH.sleeptm:=600;
     OSSH.command:='ps -eaf | grep gps_data';
     findstr:='gps_data_monitor';
     if OSSH.Execute then begin
       procLine:=-1;
       for j:=0 to OSSH.Answer.Count-1 do begin
            if pos(findstr,OSSH.Answer[j]) <> 0 then procline:=j;
       end;
       // Если найдена строка процесса транзакций или исключений, то ставим статусы и ищем время запуска процесса
       if procLine>-1 then begin
          status:=1;
          strProc:=OSSH.Answer[procline];
          Trim(strProc);
          strProc:=DelDoubleSpaces(strProc);
          // Дата или время создания процесса, это 5-е слово в строке
          // Поэтому ищем и вытягиваем 5-е слово
          wordindex:=0;
          while length(strproc)>0 do begin
              a:=pos(' ',strproc);
              inc(wordindex);
              if a=0 then begin
                  b:=length(strproc);
                  c:=length(strproc);
              end else begin
                  b:=a;
                  c:=a-1;
              end;
              s:=copy(strproc,1,c);
              if wordindex=5 then begin
                  dateRunstr:=s;
              end;
              delete(strproc,1,b);
          end;
          DecodeDate(Now(),year,month,day);
          if pos(':',DateRunStr)<>0 then begin
              LastDataDateTime:=dt + StrToTime(dateRunstr);
              if LastDataDateTime>Now() then LastDataDateTime:=LastDataDateTime-1;
          end else begin
              try
                  monthstr:=copy(dateRunStr,1,3);
                  month:=getMonthNumByString(monthstr);
                  day:=strtoint(copy(dateRunStr,4,2));
                  LastDataDateTime:=EncodeDate(year,Month,Day);
                  if LastDataDateTime>Now() then LastDataDateTime:=EncodeDate(year-1,Month,Day);
              except
                  LastDataDateTime:=0;
              end;
          end;

        end else status:=2;
        // Если нет данных с 7:00 до 7:25, значит считаем, что это - пересмена
        if (status=2) and (((Time()>StrToTime('07:00')) and (Time()<StrToTime('07:25'))) or ((Time()>StrToTime('19:00')) and (Time()<StrToTime('19:25')))) then status:=4;
        // Запись ошибки по интерфейсу
        if status=2 then ErrorStr:='Сбор GPS не запущен на сервере '+TDispatch(Owner).name + '. Свяжитесь с диспетчером и попросите перезагрузить Dispatch. Если после перезагрузки сбор gps-координат не возобновится, позвоните администратору'
           else ErrorStr:='';
        // Запись комментария к интерфейсу
        if (status=1) and (LastDataDateTime>0) then begin
              str:=str+'. Запущено '+FormatDateTime('dd.mm.yyyy', LastDataDateTime);
              // Если отсутствует время, то выводить только дату
              if LastDataDateTime<>Round(LastDataDateTime) then
                 str:=str+' '+FormatDateTime('hh:MM',LastDataDateTime);
        end;
     end else status:=0;
     comment:=str;
     OSSH.Unlock;
end;

{ TDM1 }

function TDM1.ConnectedDBUbiquiti: boolean;
begin
     result:=true;
    try
        if not DM1.ConnMySQL.Connected then DM1.ConnMySQL.Connected:=true;
    except
        //frmMain.RxTrayIcon1DblClick(self);
        Application.MessageBox('Нет доступа к базе данных ubiquiti. Не доступна информация о том, на каких самосвалах не производится мониторинг. Программа будет работать, но нельзя будет отключить или включить мониторинг на самовалах','Ошибка');
        result:=false;
    end;
end;

{ TVEIInterface }

function TVEIInterface.AddDisplayParameter(parameterName: string): boolean;
begin

end;

function TVEIInterface.CheckInterface: boolean;
var hour,min,sec,MSec:word;
    DataString,data1:string;
    lastVeiEvent:TDateTime;
    date1:TDate;
    LastVeiTimeString:string;
    MonitoringStatus:shortint;
begin
     result:=false;
     if not OSSH.Lock then exit;
     MonitoringStatus:=GetMonitoringStatus;
     if MonitoringStatus<>mos_Disable then begin
          Date1:=Date();
          DecodeTime(Now(),hour,min,sec,MSec);
          if min>10 then DataString:= 'cat OMSsniff/'+formatDateTime('yyyy-mm-dd',Now())+'.sniff.eth0.raw | grep "^'+FormatFloat('#00',hour)+':['+inttostr(trunc(min/10))+inttostr(trunc(min/10)-1)+'].*'+TMobileEquipment(owner).name+'.*VEI" | tail -1'#13
          else begin
               DataString:= 'cat OMSsniff/'+formatDateTime('yyyy-mm-dd',Now())+'.sniff.eth0.raw | egrep "^('+FormatFloat('#00',hour)+'|'+FormatFloat('#00',hour-1)+':5).*'+TMobileEquipment(owner).name+'.*VEI" | tail -1'#13;
          end;
          OSSH.Answer.Clear;
          OSSH.sleeptm:=2000;
          OSSH.command:=DataString;
          status:=0;
          // Присвоить штампу времени давнее значение
          lastVeiEvent:=1;
          //Application.MessageBox(PChar(currentEquipment+': '+inttostr(cnt1)+': '+data1),'');
          if OSSH.Execute then begin
                  if OSSH.Answer.Count>0 then data1:=OSSH.Answer.Strings[OSSH.Answer.Count-1] else data1:='';
                  if data1 <>'' then begin
                     if pos(TMobileEquipment(Owner).name,data1)>0 then begin
                        try
                           lastVeiTimeString:=copy(data1,1,8);
                           lastVeiEvent:=Date1+StrToTime(LastVeiTimeString);
                        except
                           status:=0;
                           result:=false;
                        end;
                     end else begin 
                        status:=0;
                        result:=false;
                     end;
                     if (Now()-lastVeiEvent)>(1/24/6) then status:=2 else status:=s_Work;
                  end else status:=2;
                  result:=true;
          end else begin
              // Если поступили некорректные данные, значит запрос SSH еще до конца не выполнился
              sleep(3000);
              status:=0;
              result:=false;
          end;
      end else status:=3;
      // Если статус 0 или 2 то записываем лог
      {if status in [0,2] then begin
          logstr:=#13#10+'------------------------------------'+#13#10+FormatDateTime('dd.mm.yy hh:mm',Now)+' '+'Cтатус самосвала '+currentEquipment+' --- '+inttostr(veistatus)+#13#10+cmdstr+#13#10+logstr+'--------------------------------'+#13#10;
          SaveToFile(flname,logstr);
      end;}
      if status<>s_unknown then result:=true else result:=false;
      if status=2 then ErrorStr:='Нет данных' else ErrorStr:='';
      OSSH.Unlock;
end;

constructor TVEIInterface.Create;
begin
     inherited;
     name:='VEI';
     DisplayName:='VEI';
end;

{ TPressureInterface }

function TPressureInterface.AddDisplayParameter(parameterName: string): boolean;
begin
     inherited;
     result:=false;
     if parameterName='CountWorkTires' then begin
        DisplayParameters.Add(CountWorkTires);
        result:=true;
     end;
end;

function TPressureInterface.CheckInterface: boolean;
var i:integer;
    TireStatus:shortint;
    counttires:integer;
    qTmpPowerView:TADOQuery;
begin
     result:=false;
     status:=0;
     errorStr:='';
     counttires:=0;
     if GetMonitoringStatus<>mos_Disable then begin
         // Если в БД нет данных за текущую смену, то ждем
         // Проверка на количество записей не эффективна. Нужно проверять время последнего параметра для смены
         {if not CheckTableMCPar then begin
            sleep(5000);
            if not CheckTableMCPar then exit;
         end;}
         // Проверяем данные по каждой из шести шин
         for i:=1 to 6 do begin
             TireStatus:=CheckTire(i);
             if TireStatus=1 then status:=1;
             if (TireStatus=3) and (status<>1) then begin
                status:=2;
                errorstr:='Одинаковые данные от датчиков';
             end;
             if (TireStatus=2) and not (status in [1,2]) then begin
                status:=2;
                errorstr:='Нет данных ни от одного датчика';
             end;
             if TireStatus=1 then inc(counttires);
         end;
         if status<>2 then errorStr:='';
         // Если статус - нет данных и время последнего параметра в таблице
         if (status=s_NoData) and (Now()-GetLastDataMCPar>StrToTime('00:30:00')) then begin
            sleep(5000);
            status:=s_unknown;
         end;
     end else status:=3;
     CountWorkTires.value:=inttostr(counttires);
     result:=true;
end;


function TPressureInterface.CheckTire(i: integer): shortint;
var Tire_var1, Tire_Var2, Tire_Var3:string;
    qTempPowerView:TADOQuery;
    ViewMinutes:integer;
    TirePressure:double;
    PressEquals:boolean;
    shiftid:integer;
    tm:TTime;
    dttm:TDateTime;
begin
     result:=Tire_Unknown;
     ViewMinutes:=60; // За какое время необходимо просматривать данные
     case i of
         // Возможные коды шин для разных колес
         // На данный момент Может быть 2 варианта, так как используются 2 типа мониторов
         // 1 - Правая передняя
         1: begin
            Tire_Var1:='32010008';
            Tire_Var2:='32010005';
            Tire_Var3:='32010005';
         end;
         // 2 - Левая передняя
         2: begin
            Tire_Var1:='32010062';
            Tire_Var2:='32010002';
            Tire_Var3:='32010002';
         end;
         // 3 - Правая задняя наружная
         3: begin
            Tire_Var1:='3201002F';
            Tire_Var2:='32010029';
            Tire_Var3:='32010023';
         end;
         // 4 - Правая задняя внутренняя
         4: begin
            Tire_Var1:='3201002C';
            Tire_Var2:='32010026';
            Tire_Var3:='32010020';
         end;
         // 5 - Левая задняя наружная
         5: begin
            Tire_Var1:='32010041';
            Tire_Var2:='32010047';
            Tire_Var3:='3201004D';
         end;
         // 6 - Левая задняя внутренняя
         6: begin
            Tire_Var1:='3201003E';
            Tire_Var2:='32010044';
            Tire_Var3:='3201004A';
         end;
         else exit;
     end;
     coInitialize(Nil);
     qTempPowerView:=TADOQuery.Create(dm1);
     qTempPowerView.Connection:=dm1.ConnPowerView;
     qTempPowerView.SQL.Clear;
     shiftid:=DateToShift(Date(),Time());
     qTempPowerView.SQL.Add('select data from hist_mc_par where ((shiftindex='+inttostr(shiftid)+') ');
     // Если начало дневной или ночной смен, то брать информацию из предыдущей
     tm:=Time();
     //tm:=strtoTime('19:36');
     dttm:=Now();
     //dttm:=StrToDate('22.01.2014')+tm;
     if (tm>=StrToTime('7:30')) and (tm<=(StrToTime('7:30')+1/24/60*ViewMinutes)) then
        qTempPowerView.SQL.Add('or (shiftindex='+inttostr(shiftid-1)+')');
     if (tm>=StrToTime('19:30')) and (tm<=(StrToTime('19:30')+1/24/60*ViewMinutes)) then
        qTempPowerView.SQL.Add('or (shiftindex='+inttostr(shiftid-1)+')');
     qTempPowerView.SQL.Add(') and (eqmt='+#39+TEquipment(Owner).name+#39+') and (timestamp>='+inttostr(DateTimeToTimeStamp1970(dttm-(1/12/60*ViewMinutes)))+') and ((id='+#39+Tire_Var1+#39+') or (id='+#39+Tire_Var2+#39+') or (id='+#39+Tire_Var3+#39+'))');
     //Application.MessageBox(PChar(qTempPowerView.SQL.Text),'');
     qTempPowerView.Open;
     // Просматриваем данные по шине за последние ViewMinutes минут
     if qTempPowerView.RecordCount<>0 then begin
        qTempPowerView.First;
        TirePressure:=qTempPowerView.FieldByName('data').AsFloat;
        qTempPowerView.Next;
        if not qTempPowerView.Eof then PressEquals:=true else PressEquals:=false;
        while not qTempPowerView.eof do begin
              if qTempPowerView.FieldByName('data').AsFloat<>TirePressure then PressEquals:=false;
              qTempPowerView.Next;
        end;
        if not PressEquals then result:=Tire_work else result:=Tire_NotCorrect;
     end else result:=Tire_NoData;
     qTempPowerView.Close();
     FreeAndNil(qTempPowerView);
end;

constructor TPressureInterface.Create;
begin
     inherited;
     name:='Pressure';
     DisplayName:='Pressure';
     CountWorkTires:=TParameterInterface.Create();
     CountWorkTires.name:='LostPercent';
     CountWorkTires.displayName:='Раб. шин:';
     CountWorkTires.value:='0';
     CountWorkTires.edizm:='';
end;

destructor TPressureInterface.Destroy;
begin
     FreeAndNil(FCountWorkTires);
     inherited;
end;

{ TNotificationSound }


procedure TNotificationSound.SetDuration(value: integer);
var iniFile1:TIniFile;
begin
     if value>0 then begin
        Fduration:=value;
        if FileExists(FSettingFileName) then begin
          inifile1:=TIniFile.Create(FSettingFileName);
          iniFile1.WriteInteger('Sound','Duration',value);
          iniFile1.UpdateFile;
          iniFile1.Destroy;
        end;
     end else Application.MessageBox('Значение параметра sound.duration не может быть меньше 1','Ошибка');
end;

procedure TNotificationSound.SetEnable(value: boolean);
var iniFile1:TiniFile;
    a:shortint;
begin
     FEnable:=value;
     if FileExists(FSettingFileName) then begin
        inifile1:=TIniFile.Create(FSettingFileName);
        if value then a:=1 else a:=0;
        iniFile1.WriteInteger('Sound','Enable',a);
        iniFile1.UpdateFile;
        iniFile1.Destroy;
     end;
end;

{ TGpsInterface }

function TGpsInterface.AddDisplayParameter(parameterName: string): boolean;
begin
     inherited;
     result:=false;
     if parameterName='LastGPSDateTime' then begin
        DisplayParameters.Add(LastGPSDateTime);
        result:=true;
     end;
end;

function TGpsInterface.CheckByOMStip: boolean;
var DataString:string;
    numstr:integer;
    OSSH1:TSSHobj;
begin
     result:=false;
     OSSH1:=TSSHobj.Create;
     DataString:='( sleep 3; echo "Gps gps"; sleep 3; echo "exit"; sleep 1 ) | OMStip '+TMobileEquipment(Owner).name;
     OSSH1.Answer.Clear;
     OSSH1.sleeptm:=8000;
     OSSH1.command:=DataString;
     if OSSH1.Execute then begin
        if OSSH1.Answer.Count>0 then begin
           numstr:=FindLineSubstringInList('Lat: ',OSSH1.Answer);
           if numstr>-1 then begin
              result:=true;
              if pos('Lat: 1',OSSH1.Answer[numstr])<>0 then begin
                  status:=s_work;
                  self.LastGPSDateTime.value:=FormatDateTime('dd.mm.yy hh:nn',Now);
              end else begin
                  status:=s_NoData;
              end;
           end;
        end;
     end;
     OSSH1.Destroy;
     //FreeAndNil(OSSH1);
end;

function TGpsInterface.CheckInterface: boolean;
var qTempMySQL:TADOQuery;
    LastGPSdttm:TDateTime;
    countSecondsToBad: integer;
    AllLastGPS:TDateTime;
    periodGPS:integer;
    diffmin:integer;
    readyseconds:integer;
    f:boolean;
begin
  result:=false;
  status:=s_unknown;
  countSecondsToBad:=30*60;
  // Период передачи пакетов GPS на сервер. Передается значений в пакете - 16, период между значениями - 30 секунд
  periodGPS:=30*16;
  CoInitialize(nil);
  qTempMysql:=TADOQuery.Create(dm1);
  qTempMysql.Connection:=dm1.ConnMySQL;
  qTempMySQL.SQL.Clear;
  qTempMySQL.SQL.Add('select cast(max(LastGPSDateTime) as datetime) as AllLastGPS from equipment');
  try
     qTempMySQL.Open;
     qTempMySQL.Last;
     AllLastGPS:=qTempMySQL.FieldByName('AllLastGPS').AsDateTime;
  except
     AllLastGPS:=Now;
  end;
     qTempMySQL.Active:=false;
  qTempMySQL.SQL.Clear;
  qTempMySQL.SQL.Add('select cast(LastGPSDateTime as datetime) as LastGPS from equipment ');
  qTempMySQL.SQL.Add('where name="'+TMobileEquipment(self.Owner).name+'"');
  try
     qTempMySQL.Open;
     qTempMySQL.Last;
     LastGPSdttm:=qTempMySQL.FieldByName('LastGPS').AsDateTime;
     qTempMySQL.Close;
     if (Now-LastGPSdttm)<(countSecondsToBad/24/3600) then status:=s_Work else status:=s_NoData;
     // Если оборудование находится в статусе Готов меньше 10 минут, то считать статус неизвестным
     readyseconds:=TMobileEquipment(Owner).GetModularReadySeconds;
     if status=s_NoData then if (readyseconds<(10*60)) and (readySeconds>0) then status:=s_unknown;
     // Если самая последняя GPS координата для всего оборудования была давно
     // значит просто не прошла обработка данных. Тогда ставим статус, как неизвестный
     if status=s_NoData then if (Now-AllLastGPS)>(countSecondsToBad/24/3600) then status:=s_unknown;
     // Если статус по прежнему нет данных, то проверяем подключением к PTX и проверкой Gps gps
     f:=true;
     //readyseconds:=1000;
     //status:=s_NoData;
     if (status=s_NoData) and (readyseconds>=(10*60)) then begin
        f:=CheckByOMStip;
        if f and (status=s_Work) then LastGPSdttm:=Now();
     end;
     // Для проверки
     //if TMobileEquipment(owner).name='A126' then CheckByOMStip;
    if not f then status:=s_unknown;
    if (LastGPSdttm>strtoDateTime('01.01.2000')) then self.LastGPSDateTime.value:=FormatDateTime('dd.mm.yy hh:nn',LastGPSdttm)
        else self.LastGPSDateTime.value:='неизв.';
     result:=true;
  except
     result:=false;
     status:=s_unknown;
  end;
  if status=s_NoData then begin
      diffmin:=trunc((Now-LastGPSdttm)*24*60);
      ErrorStr:='Нет данных GPS '+inttostr(diffmin)+' минут. Последние данные были '+LastGPSDateTime.value;
  end;
  FreeAndNil(qTempMysql);
end;

constructor TGpsInterface.Create;
begin
  inherited;
  name:='GPS';
  DisplayName:='GPS';
  LastGPSDateTime:=TParameterInterface.Create();
  LastGPSDateTime.name:='LastGPSDateTime';
  LastGPSDateTime.displayName:='Посл.';
  LastGPSDateTime.value:='неизв';
  LastGPSDateTime.edizm:='';
  LastGPSDateTime.FormatVal:='00.00.00 00:00';
end;

destructor TGpsInterface.Destroy;
begin
   LastGPSDateTime.Free;
   inherited;
end;

{ TNetworkEQ }

function TNetworkEQ.AddInterface(interfaceName: string;
  MonitoringSetting: shortint): boolean;
begin
     inherited;
     result:=false;
     if interfaceName='WiFi' then begin
        Interfaces.Add(WiFi, MonitoringSetting);
        result:=true;
     end;
end;

constructor TNetworkEQ.Create;
begin
     inherited;
     WiFi:=TWiFiInterface.Create;
     Wifi.Owner:=Self;
end;

destructor TNetworkEQ.Destroy;
begin
     FreeAndNil(WiFi);
     inherited;
end;


end.
