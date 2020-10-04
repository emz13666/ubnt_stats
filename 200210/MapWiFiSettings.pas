unit MapWiFiSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Math, DateUtils, Gauges;

type

// ��������� ������� ����� �������� �����
    TSectorQuality = record
        count:integer;  // �����, ������������ � ������������ ������� ������� + ����� � �������� �����
        countSuccess:integer;   // ���������� �����, ������������ � ��
        signalavg:real;         // ������� ������� ������� � �������
        countLost:integer;      // ���������� ����� � ������� �������
    end;

    TMapQuality = array of array of TSectorQuality;

    TBSWiFiQuality = class
        name:string;            // ��� ������� �������
        mac:string;             // mac ����
        MapQuality:TMapQuality; // ����� �������� �����
        enabled:boolean;         // ���� ������������� ��� ���������� �����
    end;

// ����� �������� WiFi �����
    TWifiQuality=class
        FBSQuality: array of TBSWiFiQuality; // �������� ����� ��� ������ ������� �������
        MapQuality:TMapQuality;         // ����� �������� ����� �������
        sectorsize:integer;             // ������ ������� ��� �������� �������� ����� � ������
        startdttm:TDateTime;            // ��������� ����� ��� ���������� �������� �����
        enddttm:TDateTime;              // �������� ����� ��� ���������� �������� �����
        image:TImage;                 // ������ �� ������� ����� �������
        Gauge:TGauge;                 // ������ �� progressBar
        useExcavs:boolean;               // ���� ������������� ������ �� ������������
    private
        function getBSQuality(index1:integer): TBSWiFiQuality;
        function GetSumQual: boolean;
        procedure WritePoint(mac:string; sig_lev:integer;x,y:integer);  // ��������� ������ ����� � ���������� ����
        procedure BitmapCoordsToSectors(x,y: integer; var xsec,ysec: integer);
        procedure CoordToSectors(x,y: integer; var xsec,ysec: integer);
        procedure SectorsToBitmapCoords(xsector,ysector:integer; var xstart,ystart,xend,yend:Longint);
        procedure ClearQuality(mapQual:TMapQuality);
        procedure DrawSector(xsector,ysector:integer);
        function GetQualityColor(sector:TSectorQuality):TColor;
        function GetGradientColor(startcolor,endcolor:TColor; percent:integer):TColor;
        procedure ShowSectorHint(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // ����������� ��������� �� ������� �����
    public
        constructor Create;
        destructor Destroy; override;
        property BSQuality[index:integer]: TBSWiFiQuality read getBSQuality;
        procedure Init;
        procedure Calc;
        procedure Draw;
        procedure LoadMap;                 // ��������� �������� ����� ������� � �������
        function StationsCount:integer; // ���������� ������� �������
        function getBSQualityByName(name:string):TBSWiFiQuality;  // ����� �������� WiFi �� ����� ������� �������
        function getBSQualityByMac(mac_addr:string):TBSWiFiQuality;
    end;

  TfrmMapWiFiSettings = class(TForm)
    EsegmentSize: TLabeledEdit;
    PDateStart: TDateTimePicker;
    Label1: TLabel;
    PTimeStart: TDateTimePicker;
    GBDateTime: TGroupBox;
    Label2: TLabel;
    PDateEnd: TDateTimePicker;
    PTimeEnd: TDateTimePicker;
    BOk: TBitBtn;
    BCancel: TBitBtn;
    cbUseExcavData: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WiFiQuality:TWiFiQuality;
  end;

var
  frmMapWiFiSettings: TfrmMapWiFiSettings;

implementation

uses unit1, MapFail;

{$R *.dfm}

procedure TfrmMapWiFiSettings.FormCreate(Sender: TObject);
begin
     WiFiQuality:=TWifiQuality.Create;

end;

procedure TfrmMapWiFiSettings.FormDestroy(Sender: TObject);
begin
     FreeAndNil(WiFiQuality);
end;

{ TWifiQuality }

procedure TWifiQuality.Calc;
var cntxsectors, cntysectors:integer;
    i:integer;
    BSQual:TBSWiFiQuality;
begin
     cntxSectors:=Ceil((img_endx-img_startx)/sectorsize);
     cntySectors:=Ceil((img_endy-img_starty)/sectorsize);
     for i:=0 to Length(FBSQuality)-1 do begin
         SetLength(FBSQuality[i].MapQuality,cntxSectors,cntySectors);
         ClearQuality(FBSQuality[i].MapQuality);
     end;
     SetLength(MapQuality,cntxSectors,cntySectors);
     ClearQuality(MapQuality);
     // �������� ������ �� ������� ��������
     if form1.Query.Active then form1.query.Active:=false;
     form1.query.SQL.Clear;
     form1.query.SQL.Add('select s.x, s.y, s.signal_level as signal_level, s.mac_ap from statss s');
     if not useExcavs then form1.Query.SQL.Append(', modems m, equipment e');
     form1.query.SQL.Add('where ');
     if trunc(startdttm)=trunc(enddttm) then begin
        form1.Query.SQL.Add('(s.date="'+FormatDateTime('yyyy-mm-dd',startdttm)+'")');
         if TimeOf(startdttm)>StrToTime('00:00:00') then begin
            form1.Query.SQL.Add('and (s.time>="'+FormatDateTime('hh:mm:ss',startdttm)+'")');
         end;
         if TimeOf(enddttm)<=StrToTime('23:59:00') then begin
            form1.Query.SQL.Add('and (s.time<="'+FormatDateTime('hh:mm:ss',enddttm)+'")');
         end;
     end else begin
        if (TimeOf(startdttm)>StrToTime('00:00:00')) or (TimeOf(enddttm)<=StrToTime('23:59:00')) then begin
          form1.query.SQL.Add('((s.date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',startdttm+1)) + ' and '+
                QuotedStr(FormatDateTime('yyyy-mm-dd',enddttm-1))+')');
          form1.query.SQL.Add('or ((s.date="'+FormatDateTime('yyyy-mm-dd',startdttm)+'") and (s.time>="'+FormatDateTime('hh:mm:ss',startdttm)+'"))');
          form1.query.SQL.Add('or ((s.date="'+FormatDateTime('yyyy-mm-dd',enddttm)+'") and (s.time<="'+FormatDateTime('hh:mm:ss',enddttm)+'")))');
        end else begin
          form1.query.SQL.Add('(s.date between '+QuotedStr(FormatDateTime('yyyy-mm-dd',startdttm)) + ' and '+
                QuotedStr(FormatDateTime('yyyy-mm-dd',enddttm))+')');
        end;
     end;
     {if TimeOf(startdttm)>StrToTime('00:00:00') then begin
        form1.Query.SQL.Add('and (s.time>="'+FormatDateTime('hh:mm:ss',startdttm)+'")');
     end;
     if TimeOf(enddttm)<=StrToTime('23:59:58') then begin
        form1.Query.SQL.Add('and (s.time<="'+FormatDateTime('hh:mm:ss',enddttm)+'")');
     end;}
     form1.Query.SQL.Add('and (s.status=2)');
     form1.Query.SQL.Add('and (s.x>0)');
     if not useExcavs then begin
        form1.Query.SQL.Add('and (e.equipment_type=1) and (e.name=m.name)  and (m.id_modem=s.id_modem)');
     end;
     form1.Query.Open;
     form1.Query.Last;
     Gauge.Progress:=0;
     Gauge.MaxValue:=form1.Query.RecordCount;
     Gauge.Visible:=true;
     form1.Query.First;
     While not form1.Query.Eof do begin
           WritePoint(form1.Query.FieldByName('mac_ap').AsString,form1.Query.FieldByName('signal_level').AsInteger-256,form1.Query.FieldByName('x').AsInteger,Form1.Query.FieldByName('y').AsInteger);
           Gauge.AddProgress(1);
           Application.ProcessMessages;
           form1.Query.Next;
     end;
     form1.Query.Close;
     Gauge.Visible:=false;
end;

procedure TWifiQuality.CoordToSectors(x, y: integer; var xsec,
  ysec: integer);
begin
     xsec:=Ceil((x-unit1.img_startx) / sectorsize )-1;
     ysec:=Ceil((y-unit1.img_starty) / sectorsize )-1;
     if xsec<0 then xsec:=0;
     if ysec<0 then ysec:=0;
end;

constructor TWifiQuality.Create;
begin
    inherited;
    SetLength(FBSQuality,0);
end;

destructor TWifiQuality.Destroy;
begin
    SetLength(FBSQuality,0);
    FreeAndNil(FBSQuality);
end;

procedure TWifiQuality.Draw;
var i,j:integer;
begin
     if image.Width<unit1.img_width then image.Width:=unit1.img_width;
     if image.Height<unit1.img_height then image.Height:=unit1.img_height;
     frmShowMap.Label1.Visible:=false;
     LoadMap;
     image.Repaint;
     frmShowMap.DoubleBuffered:=true;
     //image.Visible:=false;
     Gauge.Visible:=true;
     Gauge.Progress:=0;
     Gauge.MaxValue:=Length(MapQuality)*Length(MapQuality[0]);
     // ������� ������������ ����� ����� �������� �� ������ ���� �������� �� ������� ��������
     GetSumQual;
     for i:=0 to Length(MapQuality)-1 do begin
         for j:=0 to Length(MapQuality[i])-1 do begin
             DrawSector(i,j);
             Gauge.AddProgress(1);
             Application.ProcessMessages;
         end;
     end;
     //image.Visible:=true;
     Gauge.Visible:=false;
end;

function TWifiQuality.getBSQuality(index1: integer): TBSWiFiQuality;
begin
     if index1<Length(FBSQuality) then Result:=FBSQuality[index1]
        else begin
                Application.MessageBox('�� ������ ������ �������� ����� ��� ������� �������','������');
                result:=nil;
        end
end;

function TWifiQuality.getBSQualityByMac(mac_addr: string): TBSWiFiQuality;
var fnd:boolean;
    i:integer;
begin
     result:=nil;
     fnd:=false;
     i:=0;
     while (not fnd) and (i < Length(FBSQuality)) do begin
           if BSQuality[i].mac=mac_addr then begin
              fnd:=true;
              result:=BSQuality[i];
           end;
           inc(i);
     end;
end;

function TWifiQuality.getBSQualityByName(name: string): TBSWiFiQuality;
var fnd:boolean;
    i:integer;
begin
     result:=nil;
     fnd:=false;
     i:=0;
     while (not fnd) and (i < Length(FBSQuality)) do begin
           if BSQuality[i].name=name then begin
              fnd:=true;
              result:=BSQuality[i];
           end;
           inc(i);
     end;
end;

procedure TWifiQuality.Init;
var i:integer;
    cntx, cnty:integer;
begin
     if form1.Query.Active then form1.query.Active:=false;
     form1.query.SQL.Clear;
     form1.Query.SQL.Add('select name, mac_address from modems where is_access_point=1 or is_ap_repeater=1');
     form1.Query.Open;
     form1.Query.First;
     if sectorsize=0 then sectorsize:=strtoint(frmMapWiFiSettings.EsegmentSize.Text);
     cntx:=Ceil((unit1.img_endx-unit1.img_startx) / sectorsize);
     cnty:=Ceil((unit1.img_endy-unit1.img_starty) / sectorsize);
     // ����������� ������ �������, ����� ��� ����������������� ������� �� ��������� �����
     // ��������, �������� ����������� ������� �� ������. ����� ��������� �� ������ ������ ��� �����������������
     for I := 0 to StationsCount - 1 do begin
         FreeAndNil(FBSQuality[i]);
     end;
     SetLength(FBSQuality,0);
     While not Form1.Query.Eof do begin
         i:=Length(FBSQuality);
         SetLength(FBSQuality,i+1);
         FBSQuality[i]:=TBSWiFiQuality.Create;
         FBSQuality[i].name:=form1.Query.FieldByName('name').asstring;
         FBSQuality[i].mac:=form1.Query.FieldByName('mac_address').asstring;
         FBSQuality[i].enabled:=true;
         SetLength(FBSQuality[i].MapQuality,cntx,cnty);
         ClearQuality(FBSQuality[i].MapQuality);
         Form1.Query.Next;
     end;
     SetLength(MapQuality,cntx,cnty);
     ClearQuality(MapQuality);
     form1.Query.Close;
     image.OnMouseDown:=ShowSectorHint;
end;

procedure TWifiQuality.WritePoint(mac:string; sig_lev:integer; x,y:integer);
var xsec,ysec:integer;
        BSQual:TBSWiFiQuality;
        i:integer;
begin
     if sig_lev>-100 then begin
        if mac<>'' then begin
           CoordToSectors(x,y,xsec,ysec);
           BSQual:=getBSQualityByMac(mac);
           if Assigned(BSQual) then begin
              BSQual.MapQuality[xsec,ysec].signalavg:=(BSQual.MapQuality[xsec,ysec].signalavg*BSQual.MapQuality[xsec,ysec].countSuccess + sig_lev) / (BSQual.MapQuality[xsec,ysec].countSuccess+1);
              inc(BSQual.MapQuality[xsec,ysec].count);
              inc(BSQual.MapQuality[xsec,ysec].countSuccess);
           end;
        end;
     end else begin
        CoordToSectors(x,y,xsec,ysec);
        for i:=0 to Length(FBSQuality)-1 do begin
            inc(BSQuality[i].MapQuality[xsec,ysec].count);
            inc(BSQuality[i].MapQuality[xsec,ysec].countLost);
        end;
     end;
end;

function TWiFiQuality.GetSumQual: boolean;
var i,j,k:integer;
begin
     // �������� �������� ������ �������� ����
     ClearQuality(MapQuality);
     for k:=0 to Length(FBSQuality)-1 do begin
         if BSQuality[k].enabled then begin
            for i:=0 to Length(FBSQuality[k].MapQuality)-1 do begin
               for j:=0 to Length(FBSQuality[k].MapQuality[i])-1 do begin
                   if FBSQuality[k].MapQuality[i,j].count>0 then begin
                       if BSQuality[k].MapQuality[i,j].countSuccess>0 then begin
                           MapQuality[i,j].signalavg:=((MapQuality[i,j].signalavg*MapQuality[i,j].countSuccess)+(BSQuality[k].MapQuality[i,j].signalavg*BSQuality[k].MapQuality[i,j].countSuccess))/(MapQuality[i,j].countSuccess+BSQuality[k].MapQuality[i,j].countSuccess);
                           MapQuality[i,j].countSuccess:=MapQuality[i,j].countSuccess+BSQuality[k].MapQuality[i,j].countSuccess;
                       end;
                       if BSQuality[k].MapQuality[i,j].countLost>0 then MapQuality[i,j].countLost:=BSQuality[k].MapQuality[i,j].countLost;
                       MapQuality[i,j].count:=MapQuality[i,j].countSuccess+MapQuality[i,j].countLost;
                   end;
               end;
           end;
         end;
     end;
end;

procedure TWifiQuality.ClearQuality(mapQual: TMapQuality);
var i,j:integer;
begin
     for i:=0 to Length(MapQual)-1 do begin
         for j:=0 to Length(MapQual[i])-1 do begin
             MapQual[i,j].count:=0;
             MapQual[i,j].countSuccess:=0;
             MapQual[i,j].signalavg:=0;
             MapQual[i,j].countLost:=0;
         end;
     end;
end;

procedure TWifiQuality.DrawSector(xsector, ysector: integer);
var xstart,ystart,xend,yend:integer;
    color:TColor;
    x,y:integer;
    a1:integer;
begin
     SectorsToBitmapCoords(xsector,ysector,xstart,ystart,xend,yend);
     if (xsector=10) and (ysector=45) then begin
        color:=getQualityColor(MapQuality[xsector,ysector]);
     end;
     color:=getQualityColor(MapQuality[xsector,ysector]);
     if color<>clWhite then begin
         if xstart>xend then begin
            x:=xstart;
            xstart:=xend;
            xend:=x;
         end;
         if ystart>yend then begin
            y:=ystart;
            ystart:=yend;
            yend:=y;
         end;
         for x:=xstart to xend do begin
             for y:=ystart to yend do begin
                 if image.Canvas.Pixels[x,y]=clWhite then image.Canvas.Pixels[x,y]:=color;
             end;
         end;
     end;
end;

procedure TWifiQuality.SectorsToBitmapCoords(xsector, ysector: integer;
  var xstart, ystart, xend, yend: Integer);
var kx,ky :real;
begin
     kx:=img_width/(img_endx-img_startx);
     ky:=img_height/(img_endy-img_starty);
     xstart:=round(xsector*sectorsize*kx);
     ystart:=unit1.img_height-round(ysector*sectorsize*ky);
     xend:=round(xstart+(sectorsize*kx));
     yend:=round(ystart-(sectorsize*ky));
end;

function TWifiQuality.GetQualityColor(sector: TSectorQuality): TColor;
const signalgood = -78;
      signalbad = -100;
      goodqual = 90;
      middlequal=75;
      badqual=50;
var qual1,qual2,qualmin:real;
begin
     result:=clWhite;
     if sector.countSuccess>0 then begin
         // ��������� �������� �� ������ �������
         if sector.signalavg>=signalgood then qual1:=100 else
            if sector.signalavg<=signalbad then qual1:=0 else qual1:=round((signalbad-sector.signalavg)/(signalbad-signalgood)*100);
         // ��������� �������� �� ���-�� ������
         qual2:=round(sector.countSuccess/sector.count*100);
         if qual1<qual2 then qualmin:=qual1 else qualmin:=qual2;
         if qualmin>=goodqual then Result:=clGreen
            else begin
              if sector.count>2 then
                if (qualmin<goodqual) and (qualmin>=middlequal) then result:=GetGradientColor(clyellow,clgreen,round((qualmin-middlequal)/(goodqual-middlequal)*100))
                 else if (qualmin<middlequal) and (qualmin>=badqual) then result:=GetGradientColor(clred,clyellow,round((qualmin-badqual)/(middlequal-badqual)*100))
                    else if sector.count>2 then result:=clRed;
            end;
     end;
end;

function TWifiQuality.GetGradientColor(startcolor, endcolor: TColor;
  percent: integer): TColor;
var diffR,diffG,diffB:integer;
begin
     diffR:=GetRValue(startcolor)-GetRValue(endcolor);
     diffG:=GetGValue(startcolor)-GetGValue(endcolor);
     diffB:=GetBValue(startcolor)-GetBValue(endcolor);
     result:=RGB(GetRValue(startcolor)-round(diffR*percent/100),GetGValue(startcolor)-round(diffG*percent/100),GetBValue(startcolor)-round(diffB*percent/100));
end;

procedure TfrmMapWiFiSettings.BOkClick(Sender: TObject);
var tm:TTime;
begin
     frmMapWiFiSettings.Hide;
     WiFiQuality.sectorsize:=strtoint(EsegmentSize.Text);
     WiFiQuality.useExcavs:=cbUseExcavData.Checked;
     WiFiQuality.startdttm:=trunc(PDateStart.Date)+(PTimeStart.Time-trunc(PTimeStart.Time));
     tm:=StrToTime(formatDateTime('hh:nn',PTimeEnd.Time)+':59');
     WiFiQuality.enddttm:=trunc(PDateEnd.Date)+(tm-trunc(tm));
     if not Assigned(frmShowMap) then frmShowMap:=TfrmShowMap.Create(frmMapWiFiSettings);
     frmShowMap.Caption:='����� �������� �����';
     WiFiQuality.LoadMap;
     WiFiQuality.image:=frmShowMap.imgMap;
     WiFiQuality.Gauge:=frmShowMap.Gauge1;
     WiFiQuality.Init;
     WiFiQuality.Calc;
     WiFiQuality.Draw;
end;

procedure TWifiQuality.LoadMap;
var tmpimg:TImage;
    filePNG:string;
begin
     try
        if not Assigned(frmShowMap) then frmShowMap:=TfrmShowMap.Create(Application);
     except
        Application.MessageBox('������ ��������� � ����� ����� �������� ����','������');
        exit;
     end;
     tmpImg := TImage.Create(frmShowMap);
     filePNG := 'W:\�����\������� ��� ���\map.png';

     if FileExists(ExtractFilePath(Application.ExeName)+'map.png') then
             tmpImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'map.png');
     if FileExists(filePNG) then  tmpImg.Picture.LoadFromFile(filePNG);

     frmShowMap.imgMap.Picture.Bitmap.Assign(tmpImg.Picture.Graphic);
     frmShowMap.imgMap.Repaint;
     tmpImg.Free;
end;

procedure TfrmMapWiFiSettings.BCancelClick(Sender: TObject);
begin
     frmMapWiFiSettings.Close;
end;

procedure TWifiQuality.ShowSectorHint(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var xsec,ysec:integer;
begin
      BitmapCoordsToSectors(x,y,xsec,ysec);
      image.Hint:='';
      image.Hint:=image.Hint+'������: '+IntToStr(xsec)+','+IntToStr(ysec)+#13#10;
      image.Hint:=image.Hint+'�����: '+inttostr(MapQuality[xsec,ysec].count)+#13#10;
      image.Hint:=image.Hint+'�������: '+inttostr(MapQuality[xsec,ysec].countSuccess)+#13#10;
      image.Hint:=image.Hint+'�������: '+FormatFloat('0.00',MapQuality[xsec,ysec].signalavg)+#13#10;
      image.ShowHint:=true;
      Application.ActivateHint(Point(x,y));
end;

procedure TWifiQuality.BitmapCoordsToSectors(x, y: integer; var xsec,
  ysec: integer);
var x1,y1:integer;
    kx,ky:real;
begin
     kx:=img_width/(img_endx-img_startx);
     ky:=img_height/(img_endy-img_starty);
     x1:=img_startx+round(x/kx);
     y1:=img_endy-round(y/ky);
     CoordToSectors(x1,y1,xsec,ysec);
end;

function TWifiQuality.StationsCount: integer;
begin
     result:=Length(FBSQuality);
end;

end.
