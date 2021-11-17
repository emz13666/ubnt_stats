unit UnitChangePTX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, ComCtrls;

type
  TfrmChangePTX = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    DateChange1: TDateTimePicker;
    TimeChange1: TDateTimePicker;
    NullPTX: TADOQuery;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangePTX: TfrmChangePTX;
  mass_id_ptx: TStrings;
  faction: byte;//1 - change, 2-install, 3-deinstall
  fTypeEquipment: byte; //1-PTX, 2-Bullet, 3 - LTE-modem
  NameEquipment, NameTable, NameFieldId, NameHistTable, NameFieldHistId, NameFieldSerial, IP_A500, IP_Current: AnsiString;

implementation
uses Unit1;
{$R *.dfm}

procedure TfrmChangePTX.FormCreate(Sender: TObject);
begin
  case fTypeEquipment of
    1: begin
        NameEquipment := 'PTX';
        NameTable := 'ptx';
        NameFieldId := 'id_ptx';
        NameHistTable := 'ptx_history';
        NameFieldHistId := 'id_ptx';
        NameFieldSerial := 'serial';
        IP_A500 := '10.70.122.82';
        IP_Current := Form1.Modemsip_pc.AsString;
    end;
    2: begin
        NameEquipment := 'Bullet';
        NameTable := 'modems';
        NameFieldId := 'id_modem';
        NameHistTable := 'bullet_history';
        NameFieldHistId := 'id_bullet';
        NameFieldSerial := 'mac_address';
        IP_A500 := '10.70.123.140';
        IP_Current := Form1.Modemsip_address.AsString;
    end;
    3: begin
        NameEquipment := 'LTE-modem';
        NameTable := 'lte';
        NameFieldId := 'id_lte';
        NameHistTable := 'lte_history';
        NameFieldHistId := 'id_lte';
        NameFieldSerial := 'lte_serial';
    end;
  end;

  if faction = 2 then
  begin
    Caption := 'Установка '+ NameEquipment+' на '+Form1.Modemsname.AsString;
    Label1.Caption := 'Установить на '+Form1.Modemsname.AsString+' '+ NameEquipment+' s/n:';
    Label3.Visible := False;
    Edit1.Visible := false;
    Edit2.Text := NameEquipment+' отсутствовал.';
  end;

  if faction = 3 then
  begin
    Caption := 'Снятие '+ NameEquipment+ ' с ' + Form1.Modemsname.AsString;
    Label1.Caption := 'Снять ' + NameEquipment + ' с '+Form1.Modemsname.AsString;
    Label4.Visible := False;
    Edit2.Visible := false;
    ComboBox1.Visible := false;
    Edit1.Text := 'Демонтаж на время ремонта.';
  end;

  DateChange1.Date := date;
  TimeChange1.Time := time;
  NullPTX.SQL.Text := 'Select * from '+ NameTable +' where id_equipment is null';
  NullPTX.Open;
  ComboBox1.Items.Clear;
  mass_id_ptx := TStringList.Create;
  mass_id_ptx.Clear;
  while not NullPTX.Eof do
  begin
    ComboBox1.Items.Add(NullPTX.fieldByName(NameFieldSerial).AsString);
    mass_id_ptx.Add(NullPTX.fieldByName(NameFieldId).AsString);
    NullPTX.Next;
  end;
  ComboBox1.ItemIndex := 0;
  NullPTX.Close;

  if faction=1 then begin
    Caption := 'Замена ' + NameEquipment + ' на '+Form1.Modemsname.AsString;
    Label1.Caption := 'Заменить ' + NameEquipment + ' s/n '+Form1.Modems.FieldByName(NameFieldSerial).AsString+' на:';
  end;
end;

procedure TfrmChangePTX.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmChangePTX.Button1Click(Sender: TObject);
var id_ptx_old,id_equipment,id_ptx_new: string;
    ip_ptx: string;
begin
  id_equipment := Form1.Modemsid_equipment.AsString;
  id_ptx_old := Form1.Modems.FieldByName(NameFieldId).AsString;
  id_ptx_new := mass_id_ptx[ComboBox1.ItemIndex];
  ip_ptx := IP_Current;
  with NullPTX do
  begin
    if faction<>2 then begin
      Close;
      //для LTE-модемов ip-адрес не трогаем
      if  fTypeEquipment=3 then
        SQL.Text := 'Update ' + NameTable + ' set id_equipment=NULL where ' + NameFieldId + '=' + id_ptx_old
      else
        SQL.Text := 'Update ' + NameTable + ' set id_equipment=NULL, ip_address='+QuotedStr(IP_A500)+ ' where ' + NameFieldId + '=' + id_ptx_old;
      ExecSQL;
    end;
    if faction<>3 then begin
      Close;
      //для LTE-модемов ip-адрес не трогаем
      if  fTypeEquipment=3 then
        SQL.Text := 'Update ' + NameTable + ' set id_equipment=' + id_equipment + ' where ' + NameFieldId + '='+id_ptx_new
      else
        SQL.Text := 'Update ' + NameTable + ' set id_equipment='+id_equipment+', ip_address='+QuotedStr(ip_ptx)+' where ' + NameFieldId + '=' + id_ptx_new;
      ExecSQL;
    end;
    if faction<>2 then begin
      Close;
      SQL.Text := 'Insert into '+NameHistTable+'('+NameFieldHistId+', datetime, info, place_install, place_install_new) values ('+
        id_ptx_old+', '+
        QuotedStr(FormatDateTime('yyyy-mm-dd',DateChange1.Date)+' ' + FormatDateTime('hh:nn:ss',TimeChange1.Time))+', '+
        QuotedStr(Edit1.Text)+','+
        QuotedStr(Form1.Modemsname.AsString)+ ','+
        QuotedStr('Участок УСК')+')';
      ExecSQL;
    end;
    if faction<>3 then begin
        Close;
      SQL.Text := 'Insert into '+NameHistTable+'('+NameFieldHistId+', datetime, info, place_install, place_install_new) values ('+
      id_ptx_new+', '+
      QuotedStr(FormatDateTime('yyyy-mm-dd',DateChange1.Date)+' ' + FormatDateTime('hh:nn:ss',TimeChange1.Time))+', '+
      QuotedStr(Edit2.Text)+', '+
      QuotedStr('Участок УСК')+ ', '+
      QuotedStr(Form1.Modemsname.AsString)+')';
      ExecSQL;
    end;
    Close;
  end;
  Close;
end;

procedure TfrmChangePTX.FormDestroy(Sender: TObject);
begin
  mass_id_ptx.Free;
end;

procedure TfrmChangePTX.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
