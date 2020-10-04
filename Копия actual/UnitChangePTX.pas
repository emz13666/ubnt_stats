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

implementation
uses Unit1;
{$R *.dfm}

procedure TfrmChangePTX.FormCreate(Sender: TObject);
begin
  if faction = 2 then
  begin
    Caption := 'Установка РТХ на '+Form1.Modemsname.AsString;
    Label1.Caption := 'Установить на '+Form1.Modemsname.AsString+' ptx s/n:';
    Label3.Visible := False;
    Edit1.Visible := false;
    Edit2.Text := 'РТХ отсутствовал.';
  end;

  if faction = 3 then
  begin
    Caption := 'Снятие РТХ с '+Form1.Modemsname.AsString;
    Label1.Caption := 'Снять РТХ с '+Form1.Modemsname.AsString;
    Label4.Visible := False;
    Edit2.Visible := false;
    ComboBox1.Visible := false;
    Edit1.Text := 'Демонтаж на время ремонта.';
  end;

  DateChange1.Date := date;
  TimeChange1.Time := time;
  NullPTX.Open;
  ComboBox1.Items.Clear;
  mass_id_ptx := TStringList.Create;
  mass_id_ptx.Clear;
  while not NullPTX.Eof do
  begin
    ComboBox1.Items.Add(NullPTX.fieldByName('serial').AsString);
    mass_id_ptx.Add(NullPTX.fieldByName('id_ptx').AsString);
    NullPTX.Next;
  end;
  ComboBox1.ItemIndex := 0;
  NullPTX.Close;

  if faction=1 then begin
    Caption := 'Замена РТХ на '+Form1.Modemsname.AsString;
    Label1.Caption := 'Заменить РТХ s/n '+Form1.Modemsserial.AsString+' на:';
  end;
end;

procedure TfrmChangePTX.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmChangePTX.Button1Click(Sender: TObject);
var id_ptx_old,id_modem,id_ptx_new: string;
    ip_ptx: string;
begin
  id_modem := Form1.Modemsid_modem.AsString;
  id_ptx_old := Form1.Modemsid_ptx.AsString;
  id_ptx_new := mass_id_ptx[ComboBox1.ItemIndex];
  ip_ptx := Form1.Modemsip_address_1.AsString;
  if faction = 2 then
   ip_ptx := '10.70.122.'+copy(Form1.Modemsip_address.AsString,11,length(Form1.Modemsip_address.AsString)-10);
  with NullPTX do
  begin
    if faction<>2 then begin
      Close;
      SQL.Text := 'Update ptx set id_modem=NULL, ip_address=''10.70.122.82'' where id_ptx='+id_ptx_old;
      ExecSQL;
    end;
    if faction<>3 then begin
      Close;
      SQL.Text := 'Update ptx set id_modem='+id_modem+', ip_address='+QuotedStr(ip_ptx)+' where id_ptx='+id_ptx_new;
      ExecSQL;
    end;
    if faction<>2 then begin
      Close;
      SQL.Text := 'Insert into ptx_history(id_ptx, date, time, info, place_install) values ('+
        id_ptx_old+', '+
        QuotedStr(FormatDateTime('yyyy-mm-dd',DateChange1.Date))+', '+
        QuotedStr(FormatDateTime('hh:nn:ss',TimeChange1.Time))+', '+
        QuotedStr(Edit1.Text)+','+
        QuotedStr(Form1.Modemsname.AsString)+')';
      ExecSQL;
    end;
    if faction<>3 then begin
        Close;
      SQL.Text := 'Insert into ptx_history(id_ptx, date, time, info, place_install) values ('+
      id_ptx_new+', '+
      QuotedStr(FormatDateTime('yyyy-mm-dd',DateChange1.Date))+', '+
      QuotedStr(FormatDateTime('hh:nn:ss',TimeChange1.Time))+', '+
      QuotedStr(Edit2.Text)+','+
      QuotedStr('Участок АСУГТК')+')';
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
