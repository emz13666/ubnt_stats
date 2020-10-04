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

implementation
uses Unit1;
{$R *.dfm}

procedure TfrmChangePTX.FormCreate(Sender: TObject);
begin
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
  Caption := 'Замена РТХ на '+Form1.Modemsname.AsString;
  Label1.Caption := 'Заменить РТХ s/n '+Form1.Modemsserial.AsString+' на:';
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
  with NullPTX do
  begin
    Close;
    SQL.Text := 'Update ptx set id_modem=NULL, ip_address=''10.70.122.82'' where id_ptx='+id_ptx_old;
    ExecSQL;
    Close;
    SQL.Text := 'Update ptx set id_modem='+id_modem+', ip_address='+QuotedStr(ip_ptx)+' where id_ptx='+id_ptx_new;
    ExecSQL;
    Close;
    SQL.Text := 'Insert into ptx_history(id_ptx, date, time, info, place_install) values ('+
      id_ptx_old+', '+
      QuotedStr(FormatDateTime('yyyy-mm-dd',DateChange1.Date))+', '+
      QuotedStr(FormatDateTime('hh:nn:ss',TimeChange1.Time))+', '+
      QuotedStr(Edit1.Text)+','+
      QuotedStr(Form1.Modemsname.AsString)+')';
    ExecSQL;
    Close;
    SQL.Text := 'Insert into ptx_history(id_ptx, date, time, info, place_install) values ('+
      id_ptx_new+', '+
      QuotedStr(FormatDateTime('yyyy-mm-dd',DateChange1.Date))+', '+
      QuotedStr(FormatDateTime('hh:nn:ss',TimeChange1.Time))+', '+
      QuotedStr(Edit2.Text)+','+
      QuotedStr('Участок АСУГТК')+')';
    ExecSQL;
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
