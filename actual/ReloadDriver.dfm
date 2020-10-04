object frmReloadDrv: TfrmReloadDrv
  Left = 289
  Top = 220
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1072' '#1076#1088#1072#1081#1074#1077#1088#1086#1074' (C) EMZ'
  ClientHeight = 97
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 10
    Width = 74
    Height = 13
    Caption = #1040#1074#1090#1086#1089#1072#1084#1086#1089#1074#1072#1083
  end
  object Button1: TButton
    Left = 6
    Top = 36
    Width = 97
    Height = 25
    Caption = 'showDriverHealth'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button6: TButton
    Left = 112
    Top = 69
    Width = 75
    Height = 25
    Caption = 'Reload'
    TabOrder = 1
    OnClick = Button6Click
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 39
    Width = 241
    Height = 21
    TabOrder = 2
    Text = '/DriverName=PRESSUREPRO-Default'
  end
  object Button2: TButton
    Left = 274
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ComboBox2: TComboBox
    Left = 112
    Top = 6
    Width = 240
    Height = 21
    TabOrder = 4
  end
end
