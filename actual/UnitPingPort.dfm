object frmPingPort: TfrmPingPort
  Left = 0
  Top = 0
  Caption = 'Ping - [ip:port]'
  ClientHeight = 363
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 322
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 224
    ExplicitTop = 120
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 641
      Height = 320
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 120
      ExplicitTop = 96
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 322
    Width = 643
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 272
    ExplicitTop = 232
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 14
      Height = 13
      Caption = 'IP:'
    end
    object Label2: TLabel
      Left = 175
      Top = 11
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object Button1: TButton
      Left = 288
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ping'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 416
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 544
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 2
      OnClick = Button3Click
    end
    object edtIPaddr: TEdit
      Left = 34
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '127.0.0.1'
    end
    object edtPort: TEdit
      Left = 204
      Top = 8
      Width = 44
      Height = 21
      TabOrder = 4
      Text = '3389'
    end
  end
end
