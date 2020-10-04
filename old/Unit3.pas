unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, unit1;

type
  TfrmSelectDate = class(TForm)
    DTPStart: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DTPEnd: TDateTimePicker;
    bOK: TButton;
    procedure bOKClick(Sender: TObject);
    procedure DTPStartChange(Sender: TObject);
    procedure DTPEndChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectDate: TfrmSelectDate;

implementation

{$R *.dfm}

procedure TfrmSelectDate.bOKClick(Sender: TObject);
begin
     if DTPStart.Date>DTPEnd.Date then begin
        ShowMessage('Ќачальна€ дата не должна быть больше конечной даты');
     end;
     ModalResult:=mrOk;
     // ѕередаем значени€ диапазона дат в основной модуль
     unit1.startDate:=DTPStart.Date;
     unit1.endDate:=DTPEnd.Date;
end;

procedure TfrmSelectDate.DTPStartChange(Sender: TObject);
begin
     if DTPStart.Date>DTPEnd.Date then DTPEnd.Date:=DTPStart.Date;
end;

procedure TfrmSelectDate.DTPEndChange(Sender: TObject);
begin
     if DTPEnd.Date<DTPStart.Date then DTPStart.Date:=DTPEnd.Date;
end;

end.
