unit ReloadDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi;

type
  TfrmReloadDrv = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button6: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReloadDrv: TfrmReloadDrv;
  MassIPAdress: TStrings;

implementation

{$R *.dfm}

uses unit1;

procedure SetKey(Key:Integer);
begin
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP,0);
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY,0);
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP,0);
end;



procedure TfrmReloadDrv.FormCreate(Sender: TObject);
var i:byte;
begin
  with ComboBox1.Items do
  begin
   Clear;
   Add('/DriverName=PRESSUREPRO-Default');
   Add('/DriverName=FUELMETRIX-Default');
   Add('/DriverName=VISTJ1939-Default');
   Add('/DriverName=VIMS-789D');
   Add('/DriverName=VIMS-785C');
   Add('/DriverName=VIST-Classic-Default');
   Add('/DriverName=PRESSUREPRO-Classic-Default');
   Add('/DriverName=ROADROUGHNESS-Default');
   Add('/DriverName=Gps1-Default');
  end;
  ComboBox2.Items.Clear;

  MassIPAdress := TStringList.Create;
  MassIPAdress.Clear;

  Form1.Query.Close;
  Form1.Query.SQL.Text := 'SELECT eq.name as nm, p.ip_address as ip FROM `equipment` eq, modems m, ptx p '+
     'WHERE eq.name = m.name and m.id_modem = p.id_modem order by nm';
  Form1.Query.Open;
  while not Form1.Query.Eof do
  begin
    ComboBox2.Items.Add(Form1.Query.FieldByName('nm').AsString);
    MassIPAdress.Add(Form1.Query.FieldByName('ip').AsString);
    Form1.Query.Next;
  end;
  Form1.Query.Close;

  ComboBox2.ItemIndex := ComboBox2.Items.IndexOf(Form1.Modemsname.AsString);
end;

procedure ExecCommand(f_ip_address, FCmd: string);
var
  Layout: array[0.. KL_NAMELENGTH] of char;
  i: word;
  ch: char;
begin
    ShellExecute(0,nil,PChar('cmd.exe'),pchar('/K "'+ExtractFilePath(Application.ExeName)+
      'mmsShell.exe"'+' /hostname='+f_ip_address),nil,SW_restore);
  sleep(1000);
    // переключаем раскладку на английский
    LoadKeyboardLayout( StrCopy(Layout,'00000409'),KLF_ACTIVATE);
  for i := 1 to Length(FCmd) do begin
    ch := FCmd[i];
    case ch of
     ' ': SetKey(VK_SPACE);
     '/': SetKey(VK_DIVIDE);
     '=': SetKey(187);
     '-': SetKey(VK_SUBTRACT);
     '0'..'9': SetKey(ord(UpCase(ch)));
     else
      begin
        if ch = UpCase(ch) then
        begin
          SetKey(VK_CAPITAL);
          SetKey(ord(UpCase(ch)));
          SetKey(VK_CAPITAL);
        end
          else
            SetKey(ord(UpCase(ch)));
      end;
    end;

  end;{for}
  SetKey(VK_RETURN);
  sleep(100);

  SetKey(ord('S'));
  SetKey(ord('H'));
  SetKey(ord('O'));
  SetKey(ord('W'));
  SetKey(VK_CAPITAL); SetKey(ord('D'));SetKey(VK_CAPITAL);
  SetKey(ord('R'));
  SetKey(ord('I'));
  SetKey(ord('V'));
  SetKey(ord('E'));
  SetKey(ord('R'));
  SetKey(VK_CAPITAL);   SetKey(ord('H'));SetKey(VK_CAPITAL);
      SetKey(ord('E'));
  SetKey(ord('A'));
  SetKey(ord('L'));
  SetKey(ord('T'));
  SetKey(ord('H'));
  SetKey(VK_RETURN);
  SetKey(ord('E'));
  SetKey(ord('X'));
  SetKey(ord('I'));
  SetKey(ord('T'));
  SetKey(VK_RETURN);
end;

procedure TfrmReloadDrv.Button6Click(Sender: TObject);
begin
  ExecCommand(MassIPAdress[ComboBox2.Items.indexof(ComboBox2.Text)],'manageDrivers '+ComboBox1.Text+' /reload');
end;

procedure TfrmReloadDrv.Button1Click(Sender: TObject);
 var
  Layout: array[0.. KL_NAMELENGTH] of char;
  PStr: PChar;
begin
    PStr := pchar('/K "'+ExtractFilePath(Application.ExeName)+
      'mmsShell.exe"'+' /hostname='+ MassIPAdress[ComboBox2.Items.IndexOf(ComboBox2.Text)]);
    ShellExecute(0,nil,PChar('cmd.exe'),PStr,nil,SW_restore);
      // переключаем раскладку на английский
    LoadKeyboardLayout( StrCopy(Layout,'00000409'),KLF_ACTIVATE);
     sleep(1000);
    SetKey(ord('S'));
    SetKey(ord('H'));
    SetKey(ord('O'));
    SetKey(ord('W'));
    SetKey(VK_CAPITAL); SetKey(ord('D'));SetKey(VK_CAPITAL);
    SetKey(ord('R'));
    SetKey(ord('I'));
    SetKey(ord('V'));
    SetKey(ord('E'));
    SetKey(ord('R'));
    SetKey(VK_CAPITAL);   SetKey(ord('H'));SetKey(VK_CAPITAL);
        SetKey(ord('E'));
    SetKey(ord('A'));
    SetKey(ord('L'));
    SetKey(ord('T'));
    SetKey(ord('H'));
    SetKey(VK_RETURN);
    sleep(200);
    SetKey(ord('E'));
    SetKey(ord('X'));
    SetKey(ord('I'));
    SetKey(ord('T'));
    SetKey(VK_RETURN);
end;

procedure TfrmReloadDrv.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmReloadDrv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmReloadDrv.FormDestroy(Sender: TObject);
begin
  MassIPAdress.Free;
end;

end.
