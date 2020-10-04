unit MapFail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Clipbrd, ComObj, ActiveX,
  Gauges, pngimage, ComCtrls, ToolWin, ImgList, CheckLst, WiFiAnalizeByMap,
  rxPlacemnt;

type TSignalData=record
     date:TDate;
     ModemIndex:integer;
     signal:integer;
     StationName:string;
     x:integer;
     y:integer;
end;

type
  TfrmShowMap = class(TForm)
    imgMap: TImage;
    bbSave: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Gauge1: TGauge;
    ToolBar1: TToolBar;
    TBSettings: TToolButton;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    TBStations: TToolButton;
    PStations: TPanel;
    CBLStations: TCheckListBox;
    BBOKStations: TBitBtn;
    tbGetGPSInfo: TToolButton;
    FormStorage1: TFormStorage;
    procedure bbSaveClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBSettingsClick(Sender: TObject);
    procedure TBStationsClick(Sender: TObject);
    procedure PStationsExit(Sender: TObject);
    procedure BBOKStationsClick(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbGetGPSInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetPitgraphQuarter(var xstart,ystart, xend, yend:integer; x,y:integer):boolean;
  end;

var
  frmShowMap: TfrmShowMap;
  
implementation

uses MapWiFISettings, unit1;

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
  frmShowMap:=nil;
end;

procedure TfrmShowMap.TBSettingsClick(Sender: TObject);
begin
     frmMapWiFiSettings.Show;
end;

procedure TfrmShowMap.TBStationsClick(Sender: TObject);
var i:integer;
begin
     CBLStations.Clear;
     for i:=0 to frmMapWiFiSettings.WiFiQuality.stationsCount -1 do begin
         CBLStations.Items.Add(frmMapWiFiSettings.WiFiQuality.BSQuality[i].name);
         CBLStations.Checked[i]:=frmMapWiFiSettings.WiFiQuality.BSQuality[i].enabled;
     end;
     PStations.Height:=30+CBLStations.Items.Count*20;
     PStations.Left:=TBStations.Left+ToolBar1.Left;
     PStations.Top:=ToolBar1.Top-PStations.Height;
     PStations.Visible:=true;
end;

procedure TfrmShowMap.PStationsExit(Sender: TObject);
begin
     PStations.Visible:=false;
end;

procedure TfrmShowMap.tbGetGPSInfoClick(Sender: TObject);
var tmpimg:TImage;
    xstart,ystart,xend,yend:integer;
    tmpx1,tmpy1,tmpx2,tmpy2:integer;
    scalex,scaley:real;
begin
     tmpimg:=TImage.Create(frmShowMap);
     tmpimg.Visible:=false;
     // Сохраняем старую версию картинки
     tmpimg.Picture.Assign(imgMap.Picture.Graphic);
     // Вычисляем границы квадрата, в котором будем проводить анализ качества данных
     GetPitgraphQuarter(xstart,ystart,xend,yend,frmWiFiAnalize.x,frmWiFiAnalize.y);
     frmWiFiAnalize.mapcoords.xstart:=xstart;
     frmWiFiAnalize.mapcoords.ystart:=ystart;
     frmWiFiAnalize.mapcoords.xend:=xend;
     frmWiFiAnalize.mapcoords.yend:=yend;
     // Рисуем квадрат на карте
     scalex:=img_width/(img_endx-img_startx);
     scaley:=img_height/(img_endy-img_starty);
     tmpx1:=round((xstart-img_startx)*scalex);
     tmpy1:=img_height - round((ystart-img_starty)*scaley);
     tmpx2:=round((xend-img_startx)*scalex);
     tmpy2:=img_height - round((yend-img_starty)*scaley);
     imgMap.Picture.Bitmap.Canvas.Brush.Style:=bsClear;
     imgMap.Picture.Bitmap.Canvas.Pen.Color:=clGreen;
     imgMap.Picture.Bitmap.Canvas.Rectangle(tmpx1,tmpy1,tmpx2,tmpy2);
     imgMap.Repaint;
     // Анализируем качество связи в этом квадрате
     frmWiFiAnalize.ShowModal;
     imgMap.Picture.Bitmap.Assign(tmpimg.Picture.Bitmap);
end;

procedure TfrmShowMap.BBOKStationsClick(Sender: TObject);
var i:integer;
begin
     for i:=0 to CBLStations.Items.Count -1 do begin
         frmMapWiFiSettings.WiFiQuality.BSQuality[i].enabled:=CBLStations.Checked[i];
     end;
     PStations.Visible:=false;
     frmMapWiFiSettings.WiFiQuality.Draw;
end;

procedure TfrmShowMap.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if (x<PStations.Left) or (x>PStations.Left+PStations.Width) or (y<PStations.Top) or (y>PStations.Top+PStations.Height) then PStations.Visible:=false;
end;

function TfrmShowMap.GetPitgraphQuarter(var xstart, ystart, xend, yend: integer;
  x, y: integer): boolean;
begin
     xstart:=img_startx+((x-img_startx) div img_sectorsize)* img_sectorsize;
     xend:=xstart+img_sectorsize;
     ystart:=img_starty+((y-img_starty) div img_sectorsize)* img_sectorsize;
     yend:=ystart+img_sectorsize;
end;

end.
