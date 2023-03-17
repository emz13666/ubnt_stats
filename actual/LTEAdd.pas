unit LTEAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, RxDBComb, JvExControls, JvComCtrls,
  DB, ADODB, JvExMask, JvToolEdit, JvMaskEdit, scorpioClasses, sBitBtn, ImgList,
  acAlphaImageList, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, snmpsend;

type THardwareInterface=record
   name:string;
   mac_address:string;
end;
type THardwareInterfaces=array of THardwareInterface;


type
  TfrmLTEAdd = class(TForm)
    LIP: TLabel;
    PIp: TPanel;
    PIPL: TPanel;
    PIPV: TPanel;
    PSerial: TPanel;
    PSerialL: TPanel;
    LSeral: TLabel;
    PSerialV: TPanel;
    PFirmware: TPanel;
    PFirmwareL: TPanel;
    LFirmware: TLabel;
    PFirmwareV: TPanel;
    PLTEModel: TPanel;
    PLTEModelL: TPanel;
    LLTEModel: TLabel;
    PLTEModelV: TPanel;
    PModemSerial: TPanel;
    PmodemSerialL: TPanel;
    LModemSerial: TLabel;
    PModemSerialv: TPanel;
    EModemSerial: TEdit;
    GBInnerModem: TGroupBox;
    PModemModel: TPanel;
    PModemModelL: TPanel;
    LModemModel: TLabel;
    PModemModelV: TPanel;
    PModemIMEI: TPanel;
    PModemIMEIL: TPanel;
    LModemIMEI: TLabel;
    PModemIMEIV: TPanel;
    PIPTun: TPanel;
    PIPTunL: TPanel;
    LIPTun: TLabel;
    PIPTunV: TPanel;
    PDeviceName: TPanel;
    PDeviceNameL: TPanel;
    LDeviceName: TLabel;
    PDeviceNameV: TPanel;
    EDeviceName: TEdit;
    GBMAC: TGroupBox;
    PMACeth01: TPanel;
    PMACeth01L: TPanel;
    LMACeth01: TLabel;
    PMACeth01V: TPanel;
    PMACvpn: TPanel;
    PMACvpnL: TPanel;
    LMACvpn: TLabel;
    PMACvpnV: TPanel;
    PMACeth02: TPanel;
    PMACeth02L: TPanel;
    LMACeth02: TLabel;
    PMACeth02V: TPanel;
    PPlaceInstall: TPanel;
    PPlaceInstallL: TPanel;
    LPlaceInstall: TLabel;
    PPlaceInstallV: TPanel;
    EPlaceInstall: TEdit;
    PComment: TPanel;
    PCommentL: TPanel;
    LComment: TLabel;
    PCommentV: TPanel;
    MComment: TMemo;
    PButtons: TPanel;
    bbok: TBitBtn;
    bbCancel: TBitBtn;
    ESerial: TEdit;
    jvIPLTE: TJvIPAddress;
    jvIPTun: TJvIPAddress;
    connMySQL: TADOConnection;
    QueryLTE1: TADOQuery;
    cbLTEModel: TComboBox;
    cbFirmware: TComboBox;
    cbModemModel: TComboBox;
    MEModemIMEI: TJvMaskEdit;
    MEMACeth01: TJvMaskEdit;
    MEMACEth02: TJvMaskEdit;
    MEMACvpn: TJvMaskEdit;
    bbGetFromDevice: TsBitBtn;
    sAlphaImageList1: TsAlphaImageList;
    procedure FormShow(Sender: TObject);
    procedure LoadLTEDataFromDBToStringList(query1:TADOQuery;fieldname:string;stringList:TStrings);
    procedure jvIPLTEChange(Sender: TObject);
    procedure bbokClick(Sender: TObject);
    procedure bbGetFromDeviceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    snmp:TSNMPSend;
    procedure MarkError(wincontrol:TWinControl);
    procedure ResetMarkErrors;
    function sendSNMPRequest(ip:string;oid:string; var answer:string):boolean;
    function snmpGetInterfaceName(ip:string;num:integer):string;
    function snmpGetInterfaceMac(ip:string;num:integer):string;
    function GetMacAddresses:THardwareInterfaces;   // Получить список mac-адресов
    function GetSerialModem:string;                 // Получить серийный номер
    function GetModelInnerModem:string;             // Получить модель внутреннего модема
    function GetModelModem:string;                  // Получить модель модема
    function GetFirmwareModem:string;               // Получить версию прошивки
    function GetIMEIInnerModem:string;              // Получить IMEI внутреннего модема
    function ConvertOctStrToMacStr(str:AnsiString):ANSIString;        // Преобразовать строку формата octstr в ANSI строку
  public
    { Public declarations }
    snmpcommunity:string;
    procedure LoadLTEModelsFromDB(query1:TADOQuery;combo1:TCombobox);
    procedure LoadFirmvaresFromDB(query1:TADOQuery;combo1:TCombobox);
    procedure LoadModemModelsFromDB(query1:TADOQuery;combo1:TCombobox);

  end;

var
  frmLTEAdd: TfrmLTEAdd;

implementation

uses
  MyUtils, ScorpioDB, asn1util;

{$R *.dfm}

procedure TfrmLTEAdd.bbGetFromDeviceClick(Sender: TObject);
var
  macAddressList: THardwareInterfaces;
  I: Integer;

begin
     ESerial.Text:=GetSerialModem;
     if ESerial.Text='' then begin
        ShowMessage('Не удалось связаться с оборудованием');
        exit;
     end;
     cbLTEModel.Text:=GetModelModem;
     cbFirmware.Text:=GetFirmwareModem;
     MEModemIMEI.Text:=GetIMEIinnerModem;
     cbModemModel.Text:=GetModelInnerModem;
     macAddressList:=GetMacAddresses;
     for I := 0 to Length(macAddressList)-1 do begin
        if macAddressList[i].name='ether1' then begin
           MEMACeth01.Text:=macAddressList[i].mac_address;
           Continue;
        end;
        if macAddressList[i].name='ether2' then begin
           MEMACeth02.Text:=macAddressList[i].mac_address;
           Continue;
        end;
        if macAddressList[i].name='ovpn-out1' then begin
           MEMACvpn.Text:=macAddressList[i].mac_address;
           Continue;
        end;
     end;
end;

procedure TfrmLTEAdd.bbokClick(Sender: TObject);
var
  QAdd: TMyADOQuery;
  maceth01: string;
  maceth02: string;
  macovpn: string;
begin
     ResetMarkErrors;
     // Проверяем корректность введенных данных
     if not isIPAddress(jvIPLTE.Text) or (jvIPLTE.AddressValue[4]in [0,255]) then begin
        MarkError(jvIPLTE);
        ModalResult:=mrNone;
     end;
     if not isIPAddress(jvIPTun.Text) or (jvIPTun.AddressValue[4]in [0,255]) then begin
        MarkError(jvIPTun);
        ModalResult:=mrNone;
     end;
     if Length(ESerial.Text)<3 then begin
        MarkError(ESerial);
        ModalResult:=mrNone;
     end;
     maceth01:='null';
     if MEMACeth01.EditText<>'__:__:__:__:__:__' then begin
        maceth01:=MEMACeth01.Text;
        if not IsMacAddress(maceth01) then begin
           MarkError(MEMACeth01);
           ModalResult:=mrNone;
        end else maceth01:='"'+maceth01+'"';
     end;
     maceth02:='null';
     if MEMACeth02.EditText<>'__:__:__:__:__:__' then begin
        maceth02:=MEMACeth02.Text;
        if not IsMacAddress(maceth02) then begin
           MarkError(MEMACeth02);
           ModalResult:=mrNone;
        end else maceth02:='"'+maceth02+'"';
     end;
     macovpn:='null';
     if MEMACvpn.EditText<>'__:__:__:__:__:__' then begin
        macovpn:=MEMACvpn.Text;
        if not IsMacAddress(macovpn) then begin
           MarkError(MEMACvpn);
           ModalResult:=mrNone;
        end else macovpn:='"'+macovpn+'"';
     end;
     if ModalResult<>mrNone then begin
       QAdd:=TMyADOQuery.Create(frmLTEAdd,connMySQL);
       try
          QAdd.SQL.Add('insert into lte (name,ip_lte,ip_vpn,mac_eth01,mac_eth02,mac_ovpn,place_install,');
          QAdd.SQL.Add('firmware,model_lte,serial_lte,serial_modem,imei_modem,model_modem,prim) ');
          QAdd.SQL.Add('VALUES ("@name","@ip_lte","@ip_vpn",@mac_eth01,@mac_eth02,@mac_ovpn,"@place_install",');
          QAdd.SQL.Add('"@firmware","@model_lte","@serial_lte","@serial_modem","@imei_modem","@model_modem","@prim") ');
          QAdd.vars.Add('name',EDeviceName.Text);
          QAdd.vars.Add('ip_lte',jvIPLTE.Text);
          QAdd.vars.Add('ip_vpn',jvIPTun.Text);
          QAdd.vars.Add('mac_eth01',MACeth01);
          QAdd.vars.Add('mac_eth02',MACEth02);
          QAdd.vars.Add('mac_ovpn',MACovpn);
          QAdd.vars.Add('place_install',EPlaceInstall.Text);
          QAdd.vars.Add('firmware',cbFirmware.Text);
          QAdd.vars.Add('model_lte',cbLTEModel.Text);
          QAdd.vars.Add('serial_lte',ESerial.Text);
          QAdd.vars.Add('serial_modem',EModemSerial.Text);
          QAdd.vars.Add('imei_modem',MEModemIMEI.Text);
          QAdd.vars.Add('model_modem',cbModemModel.Text);
          QAdd.vars.Add('prim',MComment.Text);
          try
              QAdd.ReplaceVars;
              QAdd.ExecSQL;
          except
            on E:Exception do begin
              ShowMessage(e.ClassName+':'+E.Message);
              ModalResult:=mrNone;
              exit;
            end;

          end;
       finally
         FreeAndNil(QAdd);
       end;
     end;
end;

function TfrmLTEAdd.ConvertOctStrToMACStr(str: AnsiString): ANSIString;
var i: byte;
    ch: Ansichar;
begin
  if str='' then Result := ''
  else
  begin
    Result := '';
    for i:=1 to Length(str)-1 do
    begin
    ch := str[i];
    Result := Result+IntToHex(ord(ch),2)+':';
    end;
    ch := str[Length(str)];
    Result := Result+IntToHex(ord(ch),2);
  end;
end;

procedure TfrmLTEAdd.FormCreate(Sender: TObject);
begin
     snmp:=TSNMPSend.Create;
     snmpcommunity:='ubnt_mlink54';
end;

procedure TfrmLTEAdd.FormDestroy(Sender: TObject);
begin
     FreeAndNil(snmp);
end;

procedure TfrmLTEAdd.FormShow(Sender: TObject);
begin
     LoadLTEModelsFromDB(QueryLTE1,cbLTEModel);
     LoadFirmvaresFromDB(QueryLTE1,cbFirmware);
     LoadModemModelsFromDB(QueryLTE1,cbModemModel);
     jvIPLTE.Text:='10.70.209.';
     jvIPTun.Text:='10.70.126.';
     ESerial.Text:='';
     EModemSerial.Text:='';
     MEModemIMEI.Text:='';
     MEMACeth01.Text:='';
     MEMACeth02.Text:='';
     MEMACvpn.Text:='';
     EPlaceInstall.Text:='к.121';
     jvIPLTE.SetFocus;
     EDeviceName.Text:='TEST_LTE';
     ResetMarkErrors;
end;

function TfrmLTEAdd.GetFirmwareModem: string;
var
  str1: string;
begin
    result:='';
    if sendSNMPRequest(jvIPLTE.Text,'1.3.6.1.4.1.14988.1.1.4.4.0',str1) then
       result:=str1;
end;

function TfrmLTEAdd.GetIMEIInnerModem: string;
var
  str1: string;
begin
    result:='';
    if sendSNMPRequest(jvIPLTE.Text,'1.3.6.1.4.1.14988.1.1.16.1.1.11.3',str1) then
       result:=str1;
end;

function TfrmLTEAdd.GetMacAddresses:THardwareInterfaces;
var
  ip: string;
  countinterfaces: Integer;
  strSNMPcountintfc: string;
  strsnmpbase: string;
  currcount: Integer;
  i: Integer;
  intfcname: string;
  intfcmac: string;
begin
     SetLength(result,0);
     ip:=jvIPLTE.Text;
     strsnmpbase:='1.3.6.1.2.1.2.1';
     strSNMPcountintfc:=strsnmpbase+'.0';
     countinterfaces:=0;
     if IsIPAddress(ip) then begin
        // Получаем количество интерфейсов устройства
        snmp.Query.Clear;
        snmp.TargetHost:=ip;
        snmp.Query.Community:=snmpcommunity;
        snmp.Query.PDUType:=PDUGetRequest;
        snmp.Query.MIBAdd(strSNMPcountintfc,'',ASN1_NULL);

        if snmp.SendRequest then begin
           try
            countinterfaces:=StrToInt(snmp.reply.MIBGet(strSNMPcountintfc));
           except
              ShowMessage('Ошибка получения количества интерфейсов');
           end;
        end else begin

        end;
        if countinterfaces>0 then begin
           // Получаем интерфейсы
           currcount:=0;
           i:=1;
           while (currcount<countinterfaces) and (i<20) do begin
               intfcname:=snmpGetInterfaceName(ip,i);
               if intfcname<>'' then begin
                   intfcmac:=snmpGetInterfaceMac(ip,i);
                   SetLength(result,Length(result)+1);
                   result[Length(result)-1].name:=intfcname;
                   result[Length(result)-1].mac_address:=intfcmac;
                   inc(currcount);
               end;
               inc(i);
           end;
        end;
     end;
end;

function TfrmLTEAdd.GetModelInnerModem: string;
var
  str1: string;
begin
    result:='';
    if sendSNMPRequest(jvIPLTE.Text,'1.3.6.1.2.1.47.1.1.1.1.2.262146',str1) then begin
       result:=StringReplace(str1,'MikroTik ','',[]);
    end;
end;

function TfrmLTEAdd.GetModelModem: string;
var
  str1: string;
begin
    result:='';
    if sendSNMPRequest(jvIPLTE.Text,'1.3.6.1.4.1.14988.1.1.7.9.0',str1) then
       result:=str1;
end;

function TfrmLTEAdd.GetSerialModem: string;
var
  str1: string;

begin
    result:='';
    if sendSNMPRequest(jvIPLTE.Text,'1.3.6.1.4.1.14988.1.1.7.3.0',str1) then
       result:=str1;
end;

procedure TfrmLTEAdd.LoadLTEDataFromDBToStringList(query1: TADOQuery; fieldname: string;
  stringList: TStrings);
begin
     stringList.Clear;
     if query1.Active then query1.Close;
     query1.SQL.Text:='select distinct '+fieldname+' from LTE where '+fieldname+' is NOT NULL order by '+fieldname+' DESC';
     try
        query1.Open;
     except
        exit;
     end;
     query1.First;
     while not query1.Eof do begin
        StringList.Add(query1.Fields[0].AsString);
        query1.Next;
     end;
     query1.Close;
end;

procedure TfrmLTEAdd.jvIPLTEChange(Sender: TObject);
begin
     if jvIPTun.AddressValue[4]<>jvIPLTE.AddressValue[4] then jvIPTun.AddressValue[4]:=jvIPLTE.AddressValue[4];
     EDeviceName.Text:='TEST_'+inttostr(jvIPLTE.AddressValue[3])+'.'+inttostr(jvIPLTE.AddressValue[4]);
end;

procedure TfrmLTEAdd.LoadFirmvaresFromDB(query1: TADOQuery; combo1: TCombobox);
var
  SQLStr: string;
begin
    SQLStr:='firmware';
    LoadLTEDataFromDBToStringList(query1,SQLstr,combo1.Items);
end;

procedure TfrmLTEAdd.LoadLTEModelsFromDB(query1: TADOQuery; combo1: TCombobox);
var
  SQLStr: string;
begin
    SQLStr:='model_LTE';
    LoadLTEDataFromDBToStringList(query1,SQLstr,combo1.Items);
end;

procedure TfrmLTEAdd.LoadModemModelsFromDB(query1: TADOQuery;
  combo1: TCombobox);
var
  SQLStr: string;
begin
    SQLStr:='model_modem';
    LoadLTEDataFromDBToStringList(query1,SQLstr,combo1.Items);
end;

procedure TfrmLTEAdd.MarkError(wincontrol: TWinControl);
var clr:TColor;
begin
     clr:=$009F9DFF;
     if wincontrol.ClassType=TEdit then TEdit(wincontrol).Color:=clr;
     if wincontrol.ClassType=TComboBox then TComboBox(wincontrol).Color:=clr;
     if wincontrol.ClassType=TJvIPAddress then TJvIPAddress(wincontrol).Color:=clr;
     if wincontrol.ClassType=TJvMaskEdit then TJvMaskEdit(wincontrol).Color:=clr;
end;

procedure TfrmLTEAdd.ResetMarkErrors;
var clr:TColor;
begin
     clr:=clWindow;
     jvIPLTE.Color:=clr;
     ESerial.Color:=clr;
     cbLTEModel.Color:=clr;
     cbFirmware.Color:=clr;
     jvIPTun.Color:=clr;
     EDeviceName.Color:=clr;
     EModemSerial.Color:=clr;
     MEModemIMEI.Color:=clr;
     cbModemModel.Color:=clr;
     MEMACeth01.Color:=clr;
     MEMACEth02.Color:=clr;
     MEMACvpn.Color:=clr;
end;

function TfrmLTEAdd.sendSNMPRequest(ip, oid: string;
  var answer: string): boolean;
begin
    result:=false;
    if not IsIPAddress(ip) then exit;
    snmp.Query.Clear;
    snmp.TargetHost:=ip;
    snmp.Query.Community:=snmpcommunity;
    snmp.Query.PDUType:=PDUGetRequest;
    snmp.Query.MIBAdd(oid,'',ASN1_NULL);
    result:=snmp.SendRequest;
    if result then begin
        answer:=snmp.reply.MIBGet(oid);
    end;
end;

function TfrmLTEAdd.snmpGetInterfaceMac(ip: string; num: integer): string;
var
  strmib: string;
  str1: string;
begin
     result:='';
    snmp.Query.Clear;
    snmp.TargetHost:=ip;
    snmp.Query.Community:=snmpcommunity;
    snmp.Query.PDUType:=PDUGetRequest;
    strmib:='1.3.6.1.2.1.2.2.1.6.'+inttostr(num);
    snmp.Query.MIBAdd(strmib,'',ASN1_NULL);
    if snmp.SendRequest then begin
        str1:=ConvertOctStrToMacStr(snmp.reply.MIBGet(strmib));
        result:=str1;
    end;
end;

function TfrmLTEAdd.snmpGetInterfaceName(ip:string;num:integer): string;
var
  strmib: string;
begin
    result:='';
    snmp.Query.Clear;
    snmp.TargetHost:=ip;
    snmp.Query.Community:=snmpcommunity;
    snmp.Query.PDUType:=PDUGetRequest;
    strmib:='1.3.6.1.2.1.2.2.1.2.'+inttostr(num);
    snmp.Query.MIBAdd(strmib,'',ASN1_NULL);
    if snmp.SendRequest then begin
        result:=snmp.reply.MIBGet(strmib);
    end;
end;

end.
