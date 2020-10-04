unit ThreadTimerWifiOff;

interface
uses Windows, Classes, forms,SSH_wifi;

type
  TThreadTimerWifiOff = class(TThread)
  private
    { Private declarations }
  protected
    procedure DoWork;
    procedure Execute; override;
  public

  end;

  
implementation

uses SysUtils, Unit1;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMyTimerThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }



procedure TThreadTimerWifiOff.DoWork;
var
  sshconn: TSSHobj;
  i: word;
begin
 //проверяем последнюю запись в таблице wifi_log
 //если action=ON и now-datetime > 2,5*60*60 то отключает wifi если еще не отключен.


    SSHconn := TSSHobj.Create;
     SSHconn.command := 'ifconfig ath0|grep MTU';
     if SSHconn.Execute then
       if getword(SSHconn.Answer.Text,' ',1)='UP' then begin
         SSHconn.command := 'grep -v "netconf.2.up=" /tmp/system.cfg > /tmp/tempconfig;echo "netconf.2.up=disabled" >> /tmp/tempconfig;mv /tmp/tempconfig /tmp/system.cfg;save;/usr/etc/rc.d/rc.softrestart save';
         SSHconn.Execute;
         sleep(500);
         SSHconn.Free;
         for i := 1 to 15000 do begin sleep(1); Application.ProcessMessages end;
         SSHconn := TSSHobj.Create;
         SSHconn.command := 'ifconfig ath0|grep MTU';
         if SSHconn.Execute then
           if getword(SSHconn.Answer.Text,' ',1)<>'UP' then begin
             Query_3.SQL.Text := 'insert into wifi_log(datetime, action) values('+
               QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', now))+',''OFF'')';
             Query_3.ExecSQL;
             Query_3.Close;
            end;
      end;
    sshconn.Free;

end;

procedure TThreadTimerWifiOff.Execute;
var i:longword;
begin
  { Place thread code here }
  repeat
    //20 minutes
    for i:= 1 to 900000 do
      if not Terminated then sleep(10) else break;
    if (FormatDateTime('hh',now)='05')and(not Terminated) then DoWork;
  until Terminated;
end;

end.

