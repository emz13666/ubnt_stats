unit UnitPingPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, blcksock;

type
  //успешное подключение к узлу IP по порту Port
  TOnConnect = procedure (Sender: TObject; const IP: string; Port: word) of object;
  //ошибка подключения к узлу IP по порту Port; ErrorCode - код ошибки; ErrorDesk - описание ошибки
  TOnError = procedure (Sender: TObject; const IP: string; Port: word; ErrorCode: integer; ErrorDesc:string) of object;

  {поток для сканирования заданного диапазона портов}
  TTCPThread = class(TThread)
  private
    FSocket: TTCPBlockSocket;//объект сокета
    FIP: string;
    FPort: word;
    FOnConnect: TOnConnect;
    FOnError  : TOnError;
    procedure DoConnect(const IP: string; Port: word);
    procedure DoError(const IP: string; Port: word);
  protected
    procedure Execute;override;
  public
    constructor Create(ASyspended: boolean; AIP: string; APort, ATimeout:integer);
    destructor Destroy; override;
    property OnConnect: TOnConnect read FOnConnect write FOnConnect;
    property OnError  : TOnError read FOnError write FOnError;
end;


type
  TfrmPingPort = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    edtIPaddr: TEdit;
    edtPort: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
     TCPThread: TTCPThread;
     //обработчик события нити OnConnect
     procedure OnConnect(Sender: TObject; const IP: string; Port: word);
     //Обработчик события нити OnError
     procedure OnError(Sender: TObject; const IP: string; Port: word; ErrorCode: integer; ErrorDesc:string);
     //Обработчик события завершения работы потока

  public
    { Public declarations }
  end;



var
  frmPingPort: TfrmPingPort;
  timems: Cardinal;

implementation

{$R *.dfm}

procedure TfrmPingPort.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  frmPingPort.Caption := 'Ping - ['+edtIPaddr.Text+':' + edtPort.Text+']';
  Button1.Enabled := false;
  TCPThread:=TTCPThread.Create(True,//"спящий поток"
                            edtIPaddr.Text,//адрес
                            StrToInt(edtPort.Text),
                            2000);//таймаут ожидания соединения
       //определяем обработчики событий нити
       TCPThread.OnConnect := OnConnect;
       TCPThread.OnError:=OnError;
       //запускаем нить
       TCPThread.Start;
       //btnStart.Caption:=rsStopScan;
end;

{ TTCPThread }

constructor TTCPThread.Create(ASyspended: boolean; AIP: string; APort,
  ATimeout: integer);
begin
  inherited Create(ASyspended);
  FSocket:=TTCPBlockSocket.Create;
  FSocket.ConnectionTimeout:=ATimeout;
  FIP:=AIP;
  FPort:=APort;
end;

destructor TTCPThread.Destroy;
begin
  FSocket.Free;//освобождаем память
  inherited;
end;

procedure TTCPThread.DoConnect(const IP: string; Port: word);
begin
  if Assigned(FOnConnect) then
    FOnConnect(self,IP,Port);
end;

procedure TTCPThread.DoError(const IP: string; Port: word);

begin
  if Assigned(FOnError) then
    FOnError(Self,IP,Port,FSocket.LastError, FSocket.LastErrorDesc);
end;

procedure TTCPThread.Execute;
var i:integer;
begin
  i:=FPort;
  while (not Terminated) do
    begin
       timems := GetTickCount;
       FSocket.Connect(FIP,IntToStr(i));//пробуем соединиться
       FSocket.GetSins;
       if FSocket.LastError=0 then //ошибок нет - соединились успешно
          DoConnect(FSocket.GetRemoteSinIP, I)
       else
         DoError(FSocket.GetRemoteSinIP, I);//возвращаем ошибку
      FSocket.CloseSocket;//закрывем сокет
      sleep (1000);
    end;
  if not Terminated then
    FreeOnTerminate:=True;
end;


procedure TfrmPingPort.Button2Click(Sender: TObject);
begin
  Button1.Enabled := true;
  if Assigned(TCPThread) and (not TCPThread.Finished) then
    begin
      TCPThread.Terminate;
      TCPThread.WaitFor;
      TCPThread.Free;
    end;
end;

procedure TfrmPingPort.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPingPort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(TCPThread) and (not TCPThread.Finished) then
    begin
      TCPThread.Terminate;
      TCPThread.WaitFor;
      TCPThread.Free;
    end;
  Action := caFree;
end;

procedure TfrmPingPort.OnConnect(Sender: TObject; const IP: string; Port: word);
const cSuccessStr = '[%s] [%s] Порт %d открыт - %d msec';
begin
  timems := GetTickCount - timems;
  //выводим сообщение в лог
  Memo1.Lines.Add(Format(cSuccessStr,[TimeToStr(Now),IP, Port, timems]));
end;

procedure TfrmPingPort.OnError(Sender: TObject; const IP: string; Port: word;
  ErrorCode: integer; ErrorDesc: string);
const cErrorStr = '[%s] [%s] Порт %d закрыт. Ошибка %d (%s)';
begin
  Memo1.Lines.Add(Format(cErrorStr,[TimeToStr(Now),IP,Port,ErrorCode,ErrorDesc]));
end;

end.
