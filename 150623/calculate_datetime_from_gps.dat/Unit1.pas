unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
 var gpsdatetime:tdatetime;
 gpsdate: TDate;
 gpstime: TTime;
begin
 gpsdatetime:=StrToDateTime('01.01.1970')+(StrToInt(Edit1.Text)/(24*3600));
                 //gpsdatetime:=EncodeDateTime(1970,1,1,0,0,0,0)+(secondstime/(24*3600));
 gpsdate:=DateOf(gpsdatetime);
 gpstime:=TimeOf(gpsdatetime);
  Label1.Caption := FormatDateTime('dd.mm.yyyy',gpsdate)+'  '+FormatDateTime('hh:mm',gpstime);

end;

end.
