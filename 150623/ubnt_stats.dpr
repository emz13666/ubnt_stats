program ubnt_stats;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {frmSelectDate},
  MapSettings in 'MapSettings.pas' {frmMapSettings},
  ReloadDriver in 'ReloadDriver.pas' {frmReloadDrv},
  MapFail in 'MapFail.pas' {frmShowMap},
  UnitMemo in 'UnitMemo.pas' {frmMEMO},
  UnitChangePTX in 'UnitChangePTX.pas' {frmChangePTX},
  SSH_wifi in 'SSH_wifi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
