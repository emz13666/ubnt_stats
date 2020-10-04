unit ThreadTimerWifiOff;

interface
uses Windows, Classes, forms,snmpsend,asn1util;

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



procedure ThreadTimerWifiOff.DoWork;
var date_old: TDateTime;
begin
    //� 5 ���� ������� ������ ������ 70 ����
     with form1 do begin
       date_old:=date - 70;//70 days
       Query1.Close;
       Query1.SQL.Text := 'delete from statss where date <= '+QuotedStr(FormatDateTime('yyyy-mm-dd',date_old));
       try
         ADOConnection2.Close;
         ADOConnection2.Open;
         Query1.ExecSQL;
       except
         ADOConnection2.Close;
         mainunit.LogError.Add(FormatDateTime('dd.mm.yyyy hh:mm:ss', now)+'     ������ ��� ���������� '+Query1.SQL.Text+' � ������ �������� ������ ������');
         mainunit.LogError.SaveToFile(ExtractFilePath(Application.ExeName)+'LogError.txt');
       end;
       Query1.Close;
       ADOConnection2.Close
     end;
end;

procedure ThreadTimerWifiOff.Execute;
var i:longword;
begin
  { Place thread code here }
  repeat
    //20 minutes
    for i:= 1 to 120000 do
      if not Terminated then sleep(10) else break;
    if (FormatDateTime('hh',now)='05')and(not Terminated) then DoWork;
  until Terminated;
end;

end.

