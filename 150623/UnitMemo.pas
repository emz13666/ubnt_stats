unit UnitMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMEMO = class(TForm)
    Memo11: TMemo;
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMEMO: TfrmMEMO;
  fl_free:boolean=false;

implementation

{$R *.dfm}

procedure TfrmMEMO.FormDeactivate(Sender: TObject);
begin
  if not fl_free then Free;
end;

procedure TfrmMEMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fl_free:=true;
  Action := caFree
end;

end.
