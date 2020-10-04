object Form1: TForm1
  Left = 278
  Top = 121
  Caption = 'Ubiquiti Statistics (C) EMZ ('#1045#1074#1075#1077#1085#1080#1081' '#1052#1080#1093#1072#1081#1083#1086#1074#1080#1095' '#1047#1080#1085#1086#1074#1100#1077#1074')'
  ClientHeight = 734
  ClientWidth = 1115
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 541
    Width = 1115
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 489
    ExplicitWidth = 1014
  end
  object Panel1: TPanel
    Left = 0
    Top = 544
    Width = 1115
    Height = 190
    Align = alBottom
    TabOrder = 0
    object Chart1: TChart
      Left = 1
      Top = 33
      Width = 1113
      Height = 156
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Legend.Visible = False
      MarginTop = 0
      Title.Text.Strings = (
        'TChart')
      OnClickSeries = Chart1ClickSeries
      View3D = False
      Zoom.AnimatedSteps = 6
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object Series1: TPointSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Callout.Length = 8
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        ShowInLegend = False
        ClickableLine = False
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.Visible = True
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series2: TLineSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        SeriesColor = clRed
        Dark3D = False
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series4: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series5: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series6: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series7: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series8: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series9: TLineSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.BackColor = clWhite
        Marks.Color = clWhite
        Marks.Font.Height = -8
        Marks.Visible = False
        SeriesColor = clRed
        ShowInLegend = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = False
        Pointer.Style = psCircle
        Pointer.VertSize = 3
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series10: TPointSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        ClickableLine = False
        Pointer.InflateMargins = True
        Pointer.Style = psCircle
        Pointer.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1113
      Height = 32
      Align = alTop
      TabOrder = 1
      DesignSize = (
        1113
        32)
      object Label3: TLabel
        Left = 331
        Top = 11
        Width = 74
        Height = 13
        Caption = #1050#1042#1040#1056#1062#1048#1058#1053#1040#1071
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnDblClick = Label3DblClick
      end
      object Label4: TLabel
        Left = 425
        Top = 11
        Width = 22
        Height = 13
        Caption = #1043#1041#1052
        Color = 808080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 108
        Top = 11
        Width = 97
        Height = 13
        Caption = #1044#1048#1057#1055#1045#1058#1063#1045#1056#1057#1050#1040#1071
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = Label2Click
      end
      object Label1: TLabel
        Left = 216
        Top = 11
        Width = 98
        Height = 13
        Caption = #1055#1054#1044#1057#1058#1040#1053#1062#1048#1071' '#8470'9'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 7
        Top = 10
        Width = 89
        Height = 13
        Caption = #1055#1045#1056#1045#1043#1056#1059#1047#1050#1040'_11'
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 463
        Top = 11
        Width = 77
        Height = 13
        Caption = #1057#1058#1054#1071#1053#1050#1040' '#1043#1041#1052
        Color = clYellow
        ParentColor = False
      end
      object Label12: TLabel
        Left = 556
        Top = 10
        Width = 118
        Height = 13
        Caption = #1052#1054#1041'. '#1056#1045#1058#1056#1040#1053#1057#1051#1071#1058#1054#1056
        Color = clAqua
        ParentColor = False
      end
      object ProgressBar1: TProgressBar
        Left = 831
        Top = 9
        Width = 279
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 808
        Top = 7
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1115
    Height = 541
    Align = alClient
    TabOrder = 1
    object Splitter3: TSplitter
      Left = 813
      Top = 1
      Height = 539
      Align = alRight
      ExplicitLeft = 712
      ExplicitHeight = 487
    end
    object Panel4: TPanel
      Left = 816
      Top = 1
      Width = 298
      Height = 539
      Align = alRight
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 296
        Height = 537
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = '1'
          object MonthCalendar1: TMonthCalendar
            Left = 0
            Top = 8
            Width = 169
            Height = 157
            Date = 41178.582266782410000000
            TabOrder = 0
          end
          object CheckBox4: TCheckBox
            Left = 169
            Top = 80
            Width = 120
            Height = 17
            Caption = #1040#1074#1090#1086#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBox4Click
          end
          object CheckBox1: TCheckBox
            Left = 168
            Top = 104
            Width = 161
            Height = 17
            Caption = #1057#1090#1088#1086#1080#1090#1100' '#1079#1072' '#1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076
            TabOrder = 2
            Visible = False
            OnClick = CheckBox1Click
          end
          object GroupBox1: TGroupBox
            Left = 24
            Top = 166
            Width = 225
            Height = 92
            TabOrder = 3
            object Label5: TLabel
              Left = 12
              Top = 37
              Width = 6
              Height = 13
              Caption = #1089
            end
            object Label6: TLabel
              Left = 6
              Top = 67
              Width = 12
              Height = 13
              Caption = #1087#1086
            end
            object CheckBox3: TCheckBox
              Left = 33
              Top = 11
              Width = 136
              Height = 17
              Caption = #1057#1090#1088#1086#1080#1090#1100' '#1079#1072' '#1087#1077#1088#1080#1086#1076
              TabOrder = 0
              OnClick = CheckBox3Click
            end
            object DateTimePicker1: TDateTimePicker
              Left = 22
              Top = 33
              Width = 84
              Height = 20
              Date = 41178.871508425900000000
              Time = 41178.871508425900000000
              TabOrder = 1
              OnChange = DateTimePicker1Change
            end
            object DateTimePicker2: TDateTimePicker
              Left = 21
              Top = 65
              Width = 86
              Height = 20
              Date = 41178.871508425900000000
              Time = 41178.871508425900000000
              TabOrder = 2
              OnChange = DateTimePicker1Change
            end
            object DateTimePicker3: TDateTimePicker
              Left = 120
              Top = 32
              Width = 57
              Height = 21
              Date = 41188.000000000000000000
              Format = 'HH:mm'
              Time = 41188.000000000000000000
              Kind = dtkTime
              TabOrder = 3
              OnChange = DateTimePicker1Change
            end
            object DateTimePicker4: TDateTimePicker
              Left = 120
              Top = 63
              Width = 58
              Height = 21
              Date = 41188.999988425900000000
              Format = 'HH:mm'
              Time = 41188.999988425900000000
              Kind = dtkTime
              TabOrder = 4
              OnChange = DateTimePicker1Change
            end
          end
          object Button3: TButton
            Left = 112
            Top = 266
            Width = 75
            Height = 25
            Caption = 'MAC ACL'
            Enabled = False
            TabOrder = 4
            OnClick = Button3Click
          end
          object Button5: TButton
            Left = 8
            Top = 266
            Width = 75
            Height = 25
            Caption = 'avg_table'
            TabOrder = 5
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 208
            Top = 266
            Width = 75
            Height = 25
            Caption = 'ARP Script'
            Enabled = False
            TabOrder = 6
            OnClick = Button6Click
          end
          object Button1: TButton
            Left = 8
            Top = 298
            Width = 75
            Height = 25
            Caption = #1057#1090#1088#1086#1080#1090#1100
            TabOrder = 7
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 88
            Top = 298
            Width = 105
            Height = 25
            Caption = #1043#1088#1072#1092#1080#1082' '#1074' EXCEL'
            TabOrder = 8
            OnClick = EXCEL1Click
          end
          object btnMAC: TButton
            Left = 199
            Top = 298
            Width = 89
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' MAC'
            Enabled = False
            TabOrder = 9
            OnClick = btnMACClick
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 335
            Width = 287
            Height = 97
            Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
            TabOrder = 10
            object lAvgLevel: TLabel
              Left = 208
              Top = 48
              Width = 67
              Height = 37
              Caption = '-100'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -32
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 195
              Top = 16
              Width = 87
              Height = 33
              Alignment = taCenter
              AutoSize = False
              Caption = #1057#1088#1077#1076#1085#1080#1081' '#1091#1088#1086#1074#1077#1085#1100' '#1089#1080#1075#1085#1072#1083#1072
              WordWrap = True
            end
            object GroupBox3: TGroupBox
              Left = 8
              Top = 16
              Width = 177
              Height = 73
              Caption = #1055#1072#1082#1077#1090#1099
              TabOrder = 0
              object Label9: TLabel
                Left = 16
                Top = 16
                Width = 37
                Height = 13
                Caption = #1059#1076#1072#1095#1085#1086
              end
              object Label10: TLabel
                Left = 16
                Top = 48
                Width = 48
                Height = 13
                Caption = #1053#1077#1091#1076#1072#1095#1085#1086
              end
              object lFailPing: TLabel
                Left = 72
                Top = 48
                Width = 6
                Height = 13
                Caption = '0'
              end
              object lSuccessPing: TLabel
                Left = 72
                Top = 16
                Width = 6
                Height = 13
                Caption = '0'
              end
              object LFailPerc: TLabel
                Left = 128
                Top = 48
                Width = 14
                Height = 13
                Caption = '0%'
              end
              object lSuccessPerc: TLabel
                Left = 128
                Top = 16
                Width = 14
                Height = 13
                Caption = '0%'
              end
            end
          end
          object Button13: TButton
            Left = 8
            Top = 441
            Width = 273
            Height = 25
            Caption = #1055#1086#1090#1077#1088#1103#1085#1099#1077' '#1087#1072#1082#1077#1090#1099' '#1087#1086' '#1074#1089#1077#1084' '#1072#1074#1090#1086' '#1079#1072'  '#1085#1086#1095#1085#1091#1102' '#1089#1084#1077#1085#1091
            TabOrder = 11
            OnClick = Button13Click
          end
          object Button14: TButton
            Left = 7
            Top = 482
            Width = 273
            Height = 25
            Caption = #1055#1086#1090#1077#1088#1103#1085#1099#1077' '#1087#1072#1082#1077#1090#1099' '#1087#1086' '#1074#1089#1077#1084' '#1072#1074#1090#1086' '#1079#1072'  '#1076#1085#1077#1074#1085#1091#1102' '#1089#1084#1077#1085#1091
            TabOrder = 12
            OnClick = Button14Click
          end
          object Button15: TButton
            Left = 7
            Top = 513
            Width = 273
            Height = 25
            Caption = #1055#1086#1090#1077#1088#1103#1085#1099#1077' '#1087#1072#1082#1077#1090#1099' '#1087#1086' '#1074#1089#1077#1084' '#1072#1074#1090#1086' '#1079#1072'  '#1089#1091#1090#1082#1080
            TabOrder = 13
            OnClick = Button15Click
          end
        end
        object TabSheet2: TTabSheet
          Caption = '2'
          ImageIndex = 1
          object RadioGroup1: TRadioGroup
            Left = 8
            Top = 32
            Width = 113
            Height = 58
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100
            ItemIndex = 0
            Items.Strings = (
              #1042#1089#1077' '#1084#1086#1076#1077#1084#1099
              #1042#1089#1077' '#1056#1058#1061)
            TabOrder = 0
            OnClick = RadioGroup1Click
          end
          object Button11: TButton
            Left = 8
            Top = 128
            Width = 105
            Height = 25
            Caption = #1053#1072#1075#1088#1091#1079#1082#1072' '#1085#1072' '#1041#1057
            TabOrder = 1
            OnClick = Button11Click
          end
          object Button4: TButton
            Left = 8
            Top = 96
            Width = 105
            Height = 25
            Caption = #1058#1072#1073#1083#1080#1094#1091' '#1074' EXCEL'
            TabOrder = 2
            OnClick = Button4Click
          end
          object GroupBox4: TGroupBox
            Left = 8
            Top = 266
            Width = 281
            Height = 110
            Caption = #1055#1086' '#1074#1089#1077#1084' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084' '#1074' '#1089#1090#1072#1090#1091#1089#1077' '#1043#1054#1058#1054#1042
            Color = clActiveBorder
            ParentColor = False
            TabOrder = 3
            object lbl_more_78: TLabel
              Left = 12
              Top = 17
              Width = 43
              Height = 13
              Caption = '>=78 dB:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnDblClick = lAvgLevelDblClick
            end
            object lbl_less_78: TLabel
              Left = 11
              Top = 32
              Width = 40
              Height = 13
              Caption = ' <78 dB:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lbl_no_answer: TLabel
              Left = 13
              Top = 48
              Width = 59
              Height = 13
              Caption = #1053#1077#1090' '#1086#1090#1074#1077#1090#1072':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Lbl_avg: TLabel
              Left = 15
              Top = 65
              Width = 128
              Height = 13
              Caption = #1057#1088#1077#1076#1080#1081' '#1091#1088#1086#1074#1077#1085#1100' '#1089#1080#1075#1085#1072#1083#1072':'
            end
            object Button7: TButton
              Left = 16
              Top = 80
              Width = 75
              Height = 25
              Caption = #1055#1086'c'#1095#1080#1090#1072#1090#1100
              TabOrder = 0
              OnClick = Button7Click
            end
            object Button9: TButton
              Left = 182
              Top = 80
              Width = 96
              Height = 25
              Caption = #1044#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1081
              TabOrder = 1
              OnClick = Button9Click
            end
            object Button10: TButton
              Left = 104
              Top = 32
              Width = 169
              Height = 25
              Caption = #1042' '#1045#1061#1057#1045#1051' '#1044#1051#1071' '#1042#1067#1044#1045#1051#1045#1053#1053#1054#1049
              TabOrder = 2
              Visible = False
              OnClick = Button110Click
            end
          end
          object Button12: TButton
            Left = 24
            Top = 384
            Width = 113
            Height = 25
            Caption = #1055#1086#1090#1077#1088#1103#1085#1085#1099#1077' '#1087#1072#1082#1077#1090#1099
            TabOrder = 4
            Visible = False
            OnClick = Button12Click
          end
          object Button16: TButton
            Left = 168
            Top = 384
            Width = 75
            Height = 25
            Caption = 'Set status=1'
            TabOrder = 5
            Visible = False
            OnClick = Button16Click
          end
          object Button17: TButton
            Left = 8
            Top = 160
            Width = 105
            Height = 25
            Caption = 'VEI_DUMP'
            TabOrder = 6
          end
          object Button18: TButton
            Left = 128
            Top = 96
            Width = 105
            Height = 25
            Caption = 'xreboot'
            TabOrder = 7
            OnClick = Button18Click
          end
          object Button19: TButton
            Left = 8
            Top = 192
            Width = 105
            Height = 25
            Caption = 'Reload_Drivers'
            TabOrder = 8
            OnClick = Button19Click
          end
          object btnChangePTX: TButton
            Left = 128
            Top = 128
            Width = 105
            Height = 25
            Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1056#1058#1061
            TabOrder = 9
            OnClick = btnChangePTXClick
          end
          object btnWifi_on: TButton
            Left = 7
            Top = 232
            Width = 107
            Height = 25
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100' wifi'
            TabOrder = 10
            OnClick = btnWifi_onClick
          end
          object btnWifi_off: TButton
            Left = 128
            Top = 231
            Width = 106
            Height = 25
            Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' wifi'
            TabOrder = 11
            OnClick = btnWifi_onClick
          end
          object btnUninstallPTX: TButton
            Left = 128
            Top = 160
            Width = 105
            Height = 25
            Caption = #1057#1085#1103#1090#1100' '#1056#1058#1061
            TabOrder = 12
            OnClick = btnChangePTXClick
          end
          object btnInstallPTX: TButton
            Left = 128
            Top = 192
            Width = 105
            Height = 25
            Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1056#1058#1061
            TabOrder = 13
            OnClick = btnChangePTXClick
          end
          object btnUnion: TButton
            Left = 128
            Top = 63
            Width = 105
            Height = 25
            Hint = #1057#1090#1088#1086#1080#1090' '#1075#1088#1072#1092#1080#1082' '#1091#1088#1086#1074#1085#1103' '#1089#1080#1075#1085#1072#1083#1072' '#1080#1079' 2 '#1090#1072#1073#1083#1080#1094' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
            Caption = #1057#1090#1088#1086#1080#1090#1100' UNION'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            OnClick = btnUnionClick
          end
          object Button20: TButton
            Left = 12
            Top = 433
            Width = 273
            Height = 25
            Caption = #1055#1086#1090#1077#1088#1103#1085#1099#1077' '#1087#1072#1082#1077#1090#1099' '#1087#1086' '#1074#1089#1077#1084' '#1079#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085
            TabOrder = 15
            OnClick = Button20Click
          end
          object checkAP_Repeater: TCheckBox
            Left = 24
            Top = 9
            Width = 97
            Height = 17
            Caption = 'AP_Repeater'
            TabOrder = 16
            OnClick = checkAP_RepeaterClick
          end
          object cbAP_Repeater: TComboBox
            Left = 127
            Top = 7
            Width = 145
            Height = 21
            TabOrder = 17
            OnChange = cbAP_RepeaterChange
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'log'
          ImageIndex = 2
          object ToolTipsDBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 288
            Height = 273
            Align = alTop
            DataSource = DataSource3
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'datetime'
                Width = 102
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'message'
                Visible = True
              end>
          end
          object Button8: TButton
            Left = 112
            Top = 296
            Width = 75
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            TabOrder = 1
            OnClick = Button8Click
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 812
      Height = 539
      Align = alClient
      TabOrder = 1
      object pagesTables: TPageControl
        Left = 1
        Top = 1
        Width = 810
        Height = 537
        ActivePage = tabAvto
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Images = ImageList1
        ParentFont = False
        TabHeight = 35
        TabOrder = 0
        object tabAvto: TTabSheet
          Caption = #1040#1074#1090#1086#1089#1072#1084#1086#1089#1074#1072#1083#1099
          OnShow = tabAvtoShow
          object ToolTipsDBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 802
            Height = 492
            Align = alClient
            DataSource = DataSource1
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = PopupMenu1
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = ToolTipsDBGrid1DrawColumnCell
            OnDblClick = ToolTipsDBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'name'
                Title.Caption = #1048#1084#1103
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ip_address'
                Title.Caption = 'IP '#1084#1086#1076#1077#1084#1072
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mac_address'
                Title.Caption = 'MAC '#1084#1086#1076#1077#1084#1072
                Width = 109
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'place_install'
                Title.Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'power'
                Title.Caption = #1052#1086#1097#1072', dBm'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'prim'
                Title.Caption = #1055#1088#1080#1084'. '#1084#1086#1076#1077#1084
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'serial'
                Title.Caption = 'PTX s/n'
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ip_address_1'
                Title.Caption = 'IP PTX'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mac_address_1'
                Title.Caption = 'mac_ptx'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'os_ver'
                Title.Caption = 'PTX OS_VER'
                Width = 133
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dispatch_ver'
                Title.Caption = 'PTX Dispatch_Ver'
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'oem_driver_ver'
                Title.Caption = 'PTX OEM_Driver_ver'
                Width = 141
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'prim_1'
                Title.Caption = #1055#1088#1080#1084'. PTX'
                Width = 163
                Visible = True
              end>
          end
        end
        object tabEx: TTabSheet
          Caption = #1069#1082#1089#1082#1072#1074#1072#1090#1086#1088#1099
          ImageIndex = 1
          OnShow = tabExShow
        end
        object tabBur: TTabSheet
          Caption = #1041#1091#1088#1089#1090#1072#1085#1082#1080' '#1080' '#1057#1047#1052
          ImageIndex = 3
          OnShow = tabBurShow
        end
        object tabBase: TTabSheet
          Caption = #1041#1072#1079#1086#1074#1099#1077' '#1089#1090#1072#1085#1094#1080#1080
          ImageIndex = 2
          OnShow = tabBaseShow
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Modems
    Left = 112
    Top = 320
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 128
    object C1: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082' '#1091#1088#1086#1074#1085#1103' '#1089#1080#1075#1085#1072#1083#1072
      OnClick = C1Click
    end
    object GPS1: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082' GPS-'#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099
      OnClick = GPS1Click
    end
    object Gpswifi1: TMenuItem
      Caption = #1057#1086#1074#1084#1077#1097#1077#1085#1085#1099#1081' '#1075#1088#1072#1092#1080#1082' Gps '#1080' wifi'
      OnClick = Gpswifi1Click
    end
    object N12: TMenuItem
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1087#1086' '#1041#1057
      object loadavg1minute1: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1087#1088#1086#1094#1077#1089#1089#1086#1088#1072
        OnClick = loadavg1minute1Click
      end
      object menu_freemem: TMenuItem
        Caption = #1057#1074#1086#1073#1086#1076#1085#1072#1103' '#1087#1072#1084#1103#1090#1100
        OnClick = loadavg1minute1Click
      end
      object menu_rx_octets_eth0: TMenuItem
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1088#1080#1077#1084#1072' '#1087#1086' eth0 [K'#1073#1080#1090'/'#1089#1077#1082']'
        OnClick = loadavg1minute1Click
      end
      object menu_tx_octets_eth0: TMenuItem
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1087#1086' eth0 ['#1050#1073#1080#1090'/'#1089#1077#1082']'
        OnClick = loadavg1minute1Click
      end
      object N5: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082' '#1076#1083#1103' '#1041#1057': '#1074#1089#1077' '#1082#1083#1080#1077#1085#1090#1099
        OnClick = N5Click
      end
      object WLANConnections1: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082' '#1076#1083#1103' '#1041#1057':  WLANConnections'
        OnClick = WLANConnections1Click
      end
      object N4: TMenuItem
        Caption = #1057#1090#1088#1086#1080#1090#1100' '#1079#1086#1085#1091' '#1087#1086#1082#1088#1099#1090#1080#1103' '#1041#1057
        OnClick = N4Click
      end
    end
    object ReloadDrivers2: TMenuItem
      Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1072'  '#1076#1088#1072#1081#1074#1077#1088#1086#1074' (Reload_Drivers)'
      OnClick = ReloadDrivers1Click
    end
    object GPSARRIVE1: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082' GPS-ARRIVE'
      OnClick = GPSARRIVE1Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object Tranzact_n: TMenuItem
      Caption = #1046#1091#1088#1085#1072#1083' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081' ('#1085#1086#1095#1085#1072#1103' '#1089#1084#1077#1085#1072')'
      OnClick = Tranzact_nClick
    end
    object Tranzact_d: TMenuItem
      Caption = #1046#1091#1088#1085#1072#1083' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081' ('#1076#1085#1077#1074#1085#1072#1103' '#1089#1084#1077#1085#1072')'
      OnClick = Tranzact_nClick
    end
    object Tranzact_mon: TMenuItem
      Caption = #1046#1091#1088#1085#1072#1083' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081' ('#1090#1077#1082#1091#1097#1072#1103' '#1089#1084#1077#1085#1072') - '#1084#1086#1085#1080#1090#1086#1088#1080#1085#1075' '
      OnClick = Tranzact_nClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Ping1: TMenuItem
      Caption = #1055#1080#1085#1075#1086#1074#1072#1090#1100' '#1056#1058#1061' '#1080' Bullet'
      OnClick = Ping1Click
    end
    object Bullet1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' Bullet'
      OnClick = Bullet1Click
    end
    object BulletSSH: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' Bullet '#1087#1086' SSH'
      OnClick = BulletSSHClick
    end
    object BulletAP1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' BulletAP'
      OnClick = BulletAP1Click
    end
    object Switch1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' '#1082#1086#1084#1084#1091#1090#1072#1090#1086#1088#1091' EdgeSwitch'
      OnClick = Switch1Click
    end
    object OMStip1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1095#1077#1088#1077#1079' OMStip'
      object OMStip2: TMenuItem
        Caption = 'OMStip'
        OnClick = fullversion1Click
      end
      object Gpsgps1: TMenuItem
        Caption = 'Gps gps'
        OnClick = fullversion1Click
      end
      object fullversion1: TMenuItem
        Caption = 'fullversion'
        OnClick = fullversion1Click
      end
      object ConnectCan1281: TMenuItem
        Caption = 'Connect Can.128'
        OnClick = fullversion1Click
      end
      object ConnectCan1291: TMenuItem
        Caption = 'Connect Can.129'
        OnClick = fullversion1Click
      end
      object OMS1: TMenuItem
        Caption = 'OMS domain:10.70.121.3:3001 save'
        OnClick = fullversion1Click
      end
      object netHubAll1: TMenuItem
        Caption = 'net/Hub/All'
        OnClick = fullversion1Click
      end
      object netGoicAll1: TMenuItem
        Caption = 'net/Goic/All'
        OnClick = fullversion1Click
      end
      object OMS2: TMenuItem
        Caption = 'OMS'
        OnClick = fullversion1Click
      end
      object reset1: TMenuItem
        Caption = 'reset'
        OnClick = fullversion1Click
      end
      object Canclients1: TMenuItem
        Caption = 'Can clients'
        OnClick = fullversion1Click
      end
      object adapdrivers1: TMenuItem
        Caption = 'adap drivers'
        OnClick = fullversion1Click
      end
      object rmdirHubGoicReset1: TMenuItem
        Caption = #1055#1088#1086#1096#1080#1090#1100' (rmdir, Hub, Goic, reset)'
        OnClick = fullversion1Click
      end
    end
    object VNC1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1095#1077#1088#1077#1079' VNC'
      OnClick = VNC1Click
    end
    object FTPFileZilla1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1095#1077#1088#1077#1079' FTP (FileZilla)'
      OnClick = FTPFileZilla1Click
    end
    object telnetcheckhardwarerev1: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1095#1077#1088#1077#1079' telnet'
      object telnet2: TMenuItem
        Caption = 'telnet'
        OnClick = telnet2Click
      end
      object logdevicemonitortxt1: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' log_devicemonitor.txt'
        OnClick = telnet2Click
      end
      object GetImageVersion1: TMenuItem
        Caption = 'GetImageVersion'
        OnClick = telnet2Click
      end
      object CheckHardwarerev1: TMenuItem
        Caption = 'CheckHardwareRev'
        OnClick = telnet2Click
      end
      object proclist1: TMenuItem
        Caption = 'proclist'
        OnClick = telnet2Click
      end
      object killprocdevicemonitorexe1: TMenuItem
        Caption = 'killproc devicemonitor.exe'
        OnClick = telnet2Click
      end
      object killprocdeliteexe1: TMenuItem
        Caption = 'killproc delite.exe'
        OnClick = telnet2Click
      end
      object killprocdeliteexe2: TMenuItem
        Caption = 'killproc delite.exe + devmon'
        OnClick = telnet2Click
      end
      object servicesstartFTP01: TMenuItem
        Caption = 'services start FTP0:'
        OnClick = telnet2Click
      end
      object startcerdispc1: TMenuItem
        Caption = 'start cerdisp -c'
        OnClick = telnet2Click
      end
      object windowsptxAdministration1: TMenuItem
        Caption = 'GPS Information'
        OnClick = telnet2Click
      end
      object explorer1: TMenuItem
        Caption = 'explorer'
        OnClick = telnet2Click
      end
    end
    object OMSsniff1: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1085#1080#1092#1099' (OMSsniff)'
      object OMSsniffMenu: TMenuItem
        Caption = #1042#1089#1077' '#1076#1072#1085#1085#1099#1077'  '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '
        OnClick = OMSsniffMenuClick
      end
      object N10: TMenuItem
        Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1087#1086#1089#1083#1077#1076#1085#1080#1093' 15 '#1089#1090#1088#1086#1082
        OnClick = OMSsniffMenuClick
      end
      object N9: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' omnicomm '
        OnClick = OMSsniffMenuClick
      end
      object PressurePro1: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' PressurePro'
        OnClick = OMSsniffMenuClick
      end
      object VISTJ19391: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' VISTJ1939'
        OnClick = OMSsniffMenuClick
      end
      object VIST1: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' VIST'
        OnClick = OMSsniffMenuClick
      end
      object Vims1: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' Vims (Caterpillar)'
        object N8: TMenuItem
          Caption = #1042#1089#1077' '#1076#1072#1085#1085#1099#1077
          OnClick = OMSsniffMenuClick
        end
        object vims2: TMenuItem
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1090#1086#1087#1083#1080#1074#1091' vims'
          OnClick = OMSsniffMenuClick
        end
        object vims3: TMenuItem
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1074#1077#1089#1091' vims'
          OnClick = OMSsniffMenuClick
        end
      end
      object RoadRoughness1: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' RoadRoughness'
        OnClick = OMSsniffMenuClick
      end
      object VEI1: TMenuItem
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' VEI'
        OnClick = OMSsniffMenuClick
      end
      object PTXPWRUP1: TMenuItem
        Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1080' '#1056#1058#1061' (PWRUP)'
        OnClick = OMSsniffMenuClick
      end
    end
    object xrebootPTX1: TMenuItem
      Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1080#1090#1100' PTX (xreboot)'
      OnClick = xrebootPTX1Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      OnClick = N1Click
    end
    object Updatemac1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' MAC '#1080' firmware Bullet-a'
      OnClick = Updatemac1Click
    end
    object ReloadDrivers1: TMenuItem
      Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1072'  '#1076#1088#1072#1081#1074#1077#1088#1086#1074' (Reload_Drivers)'
      OnClick = ReloadDrivers1Click
    end
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 344
    Top = 88
  end
  object DBConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=mysql' +
      '_ubiquiti'
    LoginPrompt = False
    Left = 64
    Top = 147
  end
  object Query_3: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 248
    Top = 136
  end
  object Modems: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    AfterOpen = ModemsAfterOpen
    BeforeClose = ModemsBeforeClose
    Parameters = <>
    SQL.Strings = (
      
        'select * from modems as m LEFT JOIN ptx as p ON m.id_modem=p.id_' +
        'modem LEFT join equipment eq on m.name = eq.name  where eq.equip' +
        'ment_type = 2 order by m.name'
      '')
    Left = 232
    Top = 304
    object Modemsid_modem: TLargeintField
      FieldName = 'id_modem'
      ReadOnly = True
    end
    object Modemsis_access_point: TSmallintField
      FieldName = 'is_access_point'
    end
    object Modemsname: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object Modemsip_address: TWideStringField
      FieldName = 'ip_address'
      Size = 50
    end
    object Modemsmac_address: TWideStringField
      FieldName = 'mac_address'
      Size = 50
    end
    object Modemsplace_install: TWideStringField
      FieldName = 'place_install'
      Size = 255
    end
    object Modemspower: TSmallintField
      FieldName = 'power'
    end
    object Modemsprim: TWideStringField
      FieldName = 'prim'
      Size = 255
    end
    object Modemscolor: TLargeintField
      FieldName = 'color'
    end
    object Modemsonline: TSmallintField
      FieldName = 'online'
    end
    object Modemsid_ptx: TLargeintField
      FieldName = 'id_ptx'
      ReadOnly = True
    end
    object Modemsid_modem_1: TLargeintField
      FieldName = 'id_modem_1'
    end
    object Modemsserial: TWideStringField
      FieldName = 'serial'
    end
    object Modemsip_address_1: TWideStringField
      FieldName = 'ip_address_1'
      Size = 15
    end
    object Modemsos_ver: TWideStringField
      FieldName = 'os_ver'
      Size = 50
    end
    object Modemsdispatch_ver: TWideStringField
      FieldName = 'dispatch_ver'
      Size = 50
    end
    object Modemsoem_driver_ver: TWideStringField
      FieldName = 'oem_driver_ver'
      Size = 50
    end
    object Modemsprim_1: TWideStringField
      FieldName = 'prim_1'
      Size = 255
    end
    object Modemsmac_address_1: TWideStringField
      FieldName = 'mac_address_1'
    end
    object Modemsfirmware: TStringField
      FieldName = 'firmware'
      FixedChar = True
      Size = 8
    end
    object Modemsid_equipment: TLargeintField
      FieldName = 'id_equipment'
    end
    object Modemsis_ap_repeater: TWordField
      FieldName = 'is_ap_repeater'
    end
    object Modemsmac_wds_peer: TStringField
      FieldName = 'mac_wds_peer'
      Size = 50
    end
    object Modemsid_equipment_1: TLargeintField
      FieldName = 'id_equipment_1'
    end
  end
  object modems_avg: TADOQuery
    Connection = DBConnection
    OnCalcFields = modems_avg1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'select * from modems as t1 LEFT OUTER JOIN ptx as t2 ON t1.id_mo' +
        'dem=t2.id_modem')
    Left = 232
    Top = 380
    object LargeintField1: TLargeintField
      FieldName = 'id_modem'
      ReadOnly = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'is_access_point'
    end
    object WideStringField1: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object WideStringField2: TWideStringField
      FieldName = 'ip_address'
      Size = 50
    end
    object WideStringField3: TWideStringField
      FieldName = 'mac_address'
      Size = 50
    end
    object modems_avgavg_signal: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'avg_signal'
      Calculated = True
    end
    object WideStringField4: TWideStringField
      FieldName = 'place_install'
      Size = 255
    end
    object SmallintField2: TSmallintField
      FieldName = 'power'
    end
    object WideStringField5: TWideStringField
      FieldName = 'prim'
      Size = 255
    end
    object LargeintField2: TLargeintField
      FieldName = 'color'
    end
    object SmallintField3: TSmallintField
      FieldName = 'online'
    end
    object LargeintField3: TLargeintField
      FieldName = 'id_ptx'
      ReadOnly = True
    end
    object LargeintField4: TLargeintField
      FieldName = 'id_modem_1'
    end
    object WideStringField6: TWideStringField
      FieldName = 'serial'
    end
    object WideStringField7: TWideStringField
      FieldName = 'ip_address_1'
      Size = 15
    end
    object WideStringField8: TWideStringField
      FieldName = 'os_ver'
      Size = 50
    end
    object WideStringField9: TWideStringField
      FieldName = 'dispatch_ver'
      Size = 50
    end
    object WideStringField10: TWideStringField
      FieldName = 'oem_driver_ver'
      Size = 50
    end
    object WideStringField11: TWideStringField
      FieldName = 'prim_1'
      Size = 255
    end
    object WideStringField12: TWideStringField
      FieldName = 'mac_address_1'
    end
  end
  object Query: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 224
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = Query
    Left = 352
    Top = 168
  end
  object qryStatusEvents: TADOQuery
    Parameters = <>
    Left = 448
    Top = 160
  end
  object qryUpdate: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 472
    Top = 224
  end
  object MainMenu1: TMainMenu
    Left = 448
    Top = 64
    object N2: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N3: TMenuItem
        Caption = #1050#1072#1095#1077#1089#1090#1074#1086' '#1089#1074#1103#1079#1080
        Visible = False
        object NqualDay: TMenuItem
          Caption = #1055#1086#1089#1091#1090#1086#1095#1085#1086
          OnClick = NqualDayClick
        end
      end
      object NFailMap: TMenuItem
        Caption = #1055#1088#1086#1073#1083#1077#1084#1085#1099#1077' '#1079#1086#1085#1099
        Visible = False
        OnClick = NFailMapClick
      end
      object NWiFiQual: TMenuItem
        Caption = #1055#1086#1082#1088#1099#1090#1080#1077' '#1089#1077#1090#1080
        OnClick = NWiFiQualClick
      end
    end
  end
  object qryModems: TADOQuery
    Connection = DBConnection
    Parameters = <>
    SQL.Strings = (
      'select id_modem from modems where is_access_point=0')
    Left = 400
    Top = 240
    object qryModemsid_modem: TLargeintField
      FieldName = 'id_modem'
      ReadOnly = True
    end
  end
  object ADOConnection_query: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=mysql' +
      '_ubiquiti'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 48
    Top = 72
  end
  object Query_2: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 288
    Top = 247
  end
  object DataSource3: TDataSource
    DataSet = TableLog
    Left = 720
    Top = 200
  end
  object TableLog: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from log order by datetime desc')
    Left = 642
    Top = 144
    object TableLogdatetime: TDateTimeField
      FieldName = 'datetime'
    end
    object TableLogmessage: TStringField
      FieldName = 'message'
      FixedChar = True
      Size = 255
    end
  end
  object TimerNoZastavka: TTimer
    Interval = 298000
    OnTimer = TimerNoZastavkaTimer
    Left = 544
    Top = 224
  end
  object FormStorage1: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 672
    Top = 448
  end
  object ImageList1: TImageList
    BlendColor = clCaptionText
    BkColor = clSilver
    Height = 25
    Masked = False
    Width = 25
    Left = 456
    Top = 392
    Bitmap = {
      494C010104000900040019001900C0C0C000FF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000064000000320000000100200000000000204E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0D0D0FFD1D1D1FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0
      D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD1D1D1FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFC8D0D4FFC7CBC7FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1
      D1FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD1D1D1FFC1B891FFB28500FFC0B4
      84FFC5C7B9FFB28500FFBEAF77FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFB28500FFB28500FFC8D0D4FFB3890CFFB28500FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFD0D0D0FFB586
      05FCB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFB28500FFB28500FFB285
      00FFB28500FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1
      D1FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD1D1D1FFD0D0
      D0FFD1D1D1FFB28500FFC8D0D4FFB28500FFB28500FFC8D0D4FFB28500FFC8D0
      D4FFC8D0D4FFB28500FFB28500FFC8D0D4FFC8D0D4FFB28500FFC8D0D4FFB285
      00FFB28500FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0
      D0FFB28500FFB28500FFD0D0D0FFB28500FFB28500FFB28500FFD1D1D1FFD1D1
      D1FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0
      D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFB28500FFC8D0D4FFB285
      00FFB28500FFC8D0D4FFB28500FFC8D0D4FFC8D0D4FFB28500FFB28500FFC8D0
      D4FFC8D0D4FFB28500FFC0B484FFB28500FFB28500FFC8D0D4FFB28500FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB285
      00FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD0D0D0FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFB28500FFB28500FFD1D1D1FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0
      D0FFB28500FFB28500FFD1D1D1FFD0D0D0FFD0D0D0FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFC8D0D4FFC8D0D4FFB28500FFB28500FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFC8D0D4FFC8D0
      D4FFC8D0D4FFB28500FFB79834FFB28500FFB28500FFB28500FFC1B891FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFB28500FFB28500FFB28500FFB28501FED0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFD0D0D0FFD1D1D1FFB28500FFD0D0D0FFB28500FFB28500FFD0D0
      D0FFB28500FFB28500FFB28500FFD1D1D1FFB28500FFD1D1D1FFB28500FFD1D1
      D1FFB28500FFD0D0D0FFB28500FFD0D0D0FFD1D1D1FFC8D0D4FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFC8D0D4FFC8D0
      D4FFB28500FFB28500FFB28500FFB28500FFB99C42FFC8D0D4FFD0D0D0FFD0D0
      D0FFB28500FFC5B482FFD0D0D0FFD0D0D0FFD0D0D0FFC5B483FFB28500FFB285
      00FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFD0D0D0FFB28500FFB28500FFD0D0D0FFB28500FFB285
      00FFD0D0D0FFB28500FFB28500FFD1D1D1FFB28500FFB28500FFB28500FFD0D0
      D0FFB28500FFC5B892FFD0D0D0FFB28500FFD1D1D1FFD0D0D0FFB28500FFD1D1
      D1FFD1D1D1FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFB285
      00FFB28500FFBDAA6AFFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFB28500FFC5B483FFD0D0D0FFD0D0D0FFD0D0
      D0FFC0A151E2B28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFD0D0D0FFB285
      00FFB28500FFB28500FFD1D1D1FFD1D1D1FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFD1D1D1FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFD0D0D0FFD0D0D0FFC8D0D4FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB788
      0CF7D0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFB28500FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFB285
      00FFD1D1D1FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFC5B483FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FF9B7C
      21FFD1D1D1FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1
      D1FFD0D0D0FFC1B48BFFB28500FFB28500FFB28500FFD1D1D1FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFC8D0
      D4FFC8D0D4FFC8D0D4FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFB28500FFC8D0D4FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD1D1D1FFD0D0D0FFD1D1
      D1FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFC8D0
      D4FFB28500FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB285
      00FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFC5B483FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFD1D1D1FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD1D1D1FFD1D1
      D1FFB28500FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFB28500FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFB58E1AFFB28500FFB28500FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFB28500FFD0D0
      D0FFB28500FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD1D1D1FFB28500FFB28500FFB28500FFB28500FFB285
      00FFD1D1D1FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFD1D1D1FFD0D0D0FFD0D0
      D0FFD1D1D1FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB3890CFFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB285
      00FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFC5B483FFB28500FFB28500FFB285
      00FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB285
      00FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFB28500FFD1D1D1FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFC8D0D4FFC8D0
      D4FFC8D0D4FFB28500FFC8D0D4FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFB28500FFBCA65CFFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFB28500FFB28500FFC5B380F6D0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFB28500FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFD0D0D0FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFC8D0D4FFB285
      00FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFBF9E
      48E2B28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFCBCBCBEACDCDCDEFCFCFCFE9D0D0
      D0FFD0D0D0FFD1D1D1FFD1D1D1FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFD1D1D1FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFB28500FFB285
      00FFB28500FFC1B891FFC4C2ACFFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFD0D0D0FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFD0D0D0FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFB28500FFB28500FFB28500FFB28500FFB28500FFC8D0D4FFB28500FFB285
      00FFB28500FFB28500FFC8D0D4FFC8D0D4FFBAA14FFFB28500FFB3890CFFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0
      D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0
      D0FFD0D0D0FFD1D1D1FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFBEAF77FFB28500FFB28500FFB28500FFC8D0D4FFC8D0
      D4FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFBE993AE4C5B380F8D0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB285
      00FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0
      D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1
      D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0
      D0FFD0D0D0FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB285
      00FFB28500FFB28500FFB28500FFC8D0D4FFB28500FFB28500FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD0D0D0FFD1D1
      D1FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD1D1D1FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFB28500FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0
      D0FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFB28500FFB28500FFB28500FFB28500FFB28500FFC4C2ACFFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFC5B482FAB28500FFB28500FFB28500FFB285
      00FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB285
      00FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1
      D1FFD0D0D0FFD1D1D1FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1
      D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB28500FFB285
      00FFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFB285
      00FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFB28500FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD0D0
      D0FFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0
      D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFB28500FFB28500FFB28500FFB28500FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFB28500FFB28500FFB28500FFB28500FFB28500FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1
      D1FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFB28500FFB285
      00FFC1B891FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFB285
      00FFC3AE74E9D0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD1D1
      D1FFD0D0D0FFD1D1D1FFD0D0D0FFD1D1D1FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0
      D0FFD0D0D0FFD1D1D1FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD1D1D1FFD0D0
      D0FFD0D0D0FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFB3890CFFB28500FFC8D0D4FFC8D0D4FFC8D0D4FFC8D0
      D4FFC8D0D4FFC8D0D4FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FF424D3E000000000000003E000000
      2800000064000000320000000100010000000000200300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
