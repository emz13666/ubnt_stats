object frmChangePTX: TfrmChangePTX
  Left = 433
  Top = 194
  Width = 321
  Height = 187
  AutoSize = True
  Caption = #1047#1072#1084#1077#1085#1072' '#1056#1058#1061' '#1085#1072' A101'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 35
    Width = 189
    Height = 13
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1056#1058#1061' s/n 384311 151572 '#1085#1072':'
  end
  object Label2: TLabel
    Left = 0
    Top = 3
    Width = 116
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1079#1072#1084#1077#1085#1099':'
  end
  object Label3: TLabel
    Left = 7
    Top = 64
    Width = 84
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1089#1085#1103#1090#1080#1103':'
  end
  object Label4: TLabel
    Left = 8
    Top = 92
    Width = 101
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080':'
  end
  object Button1: TButton
    Left = 24
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 127
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object DateChange1: TDateTimePicker
    Left = 133
    Top = 0
    Width = 92
    Height = 21
    CalAlignment = dtaLeft
    Date = 42098.3785664005
    Time = 42098.3785664005
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object TimeChange1: TDateTimePicker
    Left = 233
    Top = 0
    Width = 80
    Height = 21
    CalAlignment = dtaLeft
    Date = 42098.3785664005
    Time = 42098.3785664005
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkTime
    ParseInput = False
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 98
    Top = 62
    Width = 214
    Height = 21
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 115
    Top = 90
    Width = 196
    Height = 21
    TabOrder = 5
    Text = #1047#1072#1084#1077#1085#1072' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1075#1086
  end
  object ComboBox1: TComboBox
    Left = 193
    Top = 30
    Width = 118
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object NullPTX: TADOQuery
    Connection = Form1.DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from PTX where id_modem is null')
    Left = 160
    Top = 120
  end
end
