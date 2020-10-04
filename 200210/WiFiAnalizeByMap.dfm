object frmWiFiAnalize: TfrmWiFiAnalize
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1072#1085#1085#1099#1093' '#1087#1086' WiFi '#1085#1072' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1084' '#1091#1095#1072#1089#1090#1082#1077' '#1082#1072#1088#1100#1077#1088#1072
  ClientHeight = 287
  ClientWidth = 541
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GBSettings: TGroupBox
    Left = 0
    Top = 0
    Width = 541
    Height = 49
    Align = alTop
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    TabOrder = 0
    DesignSize = (
      541
      49)
    object ldate: TLabel
      Left = 31
      Top = 19
      Width = 26
      Height = 13
      Anchors = []
      Caption = #1044#1072#1090#1072
      ExplicitLeft = 32
    end
    object lEquip: TLabel
      Left = 173
      Top = 19
      Width = 75
      Height = 13
      Anchors = []
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ExplicitLeft = 177
    end
    object lStation: TLabel
      Left = 386
      Top = 19
      Width = 23
      Height = 13
      Anchors = []
      Caption = #1041#1072#1079#1072
      ExplicitLeft = 393
    end
    object PSetDate: TDateTimePicker
      Left = 62
      Top = 16
      Width = 89
      Height = 21
      Anchors = []
      Date = 42306.444018842590000000
      Time = 42306.444018842590000000
      Enabled = False
      TabOrder = 0
    end
    object CBEquipment: TComboBox
      Left = 253
      Top = 16
      Width = 83
      Height = 21
      Anchors = []
      Enabled = False
      TabOrder = 1
    end
    object CBStation: TComboBox
      Left = 413
      Top = 16
      Width = 115
      Height = 21
      Anchors = []
      Enabled = False
      TabOrder = 2
    end
  end
  object SGWiFiQual: TStringGrid
    Left = 0
    Top = 49
    Width = 541
    Height = 238
    Align = alClient
    ColCount = 7
    DefaultColWidth = 72
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedColClick, goFixedRowClick]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDrawCell = SGWiFiQualDrawCell
    OnFixedCellClick = SGWiFiQualFixedCellClick
  end
end
