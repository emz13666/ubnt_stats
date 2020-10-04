unit MapFail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Clipbrd, ComObj, ActiveX,
  Gauges, pngimage;

type
  TfrmShowMap = class(TForm)
    imgMap: TImage;
    bbSave: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Gauge1: TGauge;
    procedure bbSaveClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowMap: TfrmShowMap;

const
  img_width = 1280;
  img_height = 749;
  img_startx = 12200;
  img_endx = 16300;
  img_starty = 3200;
  img_endy = 5600;
  
implementation

{$R *.dfm}

procedure TfrmShowMap.bbSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    imgMap.Picture.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TfrmShowMap.BitBtn2Click(Sender: TObject);
begin
  Close;
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

procedure TfrmShowMap.BitBtn1Click(Sender: TObject);
var clpbrd : TClipboard;
   ExcelApp, WorkBook: Variant;
begin
//установлен ли EXCEL
  if not IsOLEObjectInstalled('Excel.Application') then
  begin
    ShowMessage('Экспорт невозможен. Excel не установлен.');
    exit;
  end;

  clpbrd := Clipboard;
//  clpbrd.Assign(Chart1.);
try
  clpbrd.Assign(imgMap.Picture.Bitmap);
 // Создание Excel
  ExcelApp := CreateOleObject('Excel.Application');
  WorkBook := ExcelApp.WorkBooks.Add;
  Workbook.WorkSheets[1].Paste;
  ExcelApp.visible := true;
finally
end;//try
end;//procedure

procedure TfrmShowMap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
