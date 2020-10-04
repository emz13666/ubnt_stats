object frmSelectDate: TfrmSelectDate
  Left = 362
  Top = 331
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090
  ClientHeight = 112
  ClientWidth = 245
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 58
    Top = 20
    Width = 7
    Height = 13
    Caption = #1057
  end
  object Label2: TLabel
    Left = 58
    Top = 52
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object DTPStart: TDateTimePicker
    Left = 88
    Top = 16
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 41246.4536753241
    Time = 41246.4536753241
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    OnChange = DTPStartChange
  end
  object DTPEnd: TDateTimePicker
    Left = 88
    Top = 48
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 41246.4536753241
    Time = 41246.4536753241
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    OnChange = DTPEndChange
  end
  object bOK: TButton
    Left = 88
    Top = 80
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 2
    OnClick = bOKClick
  end
end
