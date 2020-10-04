object frmMapWiFiSettings: TfrmMapWiFiSettings
  Left = 413
  Top = 267
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1072#1088#1090#1099' '#1087#1086#1082#1088#1099#1090#1080#1103' '#1089#1077#1090#1080
  ClientHeight = 217
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    245
    217)
  PixelsPerInch = 96
  TextHeight = 13
  object EsegmentSize: TLabeledEdit
    Left = 135
    Top = 94
    Width = 73
    Height = 21
    Anchors = [akTop]
    EditLabel.Width = 103
    EditLabel.Height = 13
    EditLabel.Caption = #1056#1072#1079#1084#1077#1088' '#1082#1074#1072#1076#1088#1072#1090#1072', '#1084
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 0
    Text = '50'
  end
  object GBDateTime: TGroupBox
    Left = 0
    Top = 0
    Width = 245
    Height = 81
    Align = alTop
    Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
    TabOrder = 1
    DesignSize = (
      245
      81)
    object Label1: TLabel
      Left = 21
      Top = 18
      Width = 7
      Height = 13
      Anchors = []
      Caption = 'C'
    end
    object Label2: TLabel
      Left = 12
      Top = 49
      Width = 14
      Height = 13
      Anchors = []
      Caption = #1055#1086
    end
    object PTimeStart: TDateTimePicker
      Left = 151
      Top = 14
      Width = 55
      Height = 21
      Anchors = []
      Date = 42178.000000000000000000
      Format = 'HH:mm'
      Time = 42178.000000000000000000
      Kind = dtkTime
      TabOrder = 0
    end
    object PDateStart: TDateTimePicker
      Left = 36
      Top = 14
      Width = 89
      Height = 21
      Anchors = []
      Date = 42178.610132777800000000
      Time = 42178.610132777800000000
      TabOrder = 1
    end
    object PDateEnd: TDateTimePicker
      Left = 36
      Top = 45
      Width = 89
      Height = 21
      Anchors = []
      Date = 42178.610132777800000000
      Time = 42178.610132777800000000
      TabOrder = 2
    end
    object PTimeEnd: TDateTimePicker
      Left = 151
      Top = 45
      Width = 55
      Height = 21
      Anchors = []
      Date = 42178.999988425900000000
      Format = 'HH:mm'
      Time = 42178.999988425900000000
      Kind = dtkTime
      TabOrder = 3
    end
  end
  object BOk: TBitBtn
    Left = 34
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Kind = bkOK
    TabOrder = 2
    OnClick = BOkClick
  end
  object BCancel: TBitBtn
    Left = 132
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    TabOrder = 3
    OnClick = BCancelClick
  end
  object cbUseExcavData: TCheckBox
    Left = 12
    Top = 136
    Width = 224
    Height = 17
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086#1090' '#1101#1082#1089#1082#1072#1074#1072#1090#1086#1088#1086#1074
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
