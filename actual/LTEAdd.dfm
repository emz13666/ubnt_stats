object frmLTEAdd: TfrmLTEAdd
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' LTE-'#1084#1086#1076#1077#1084#1072
  ClientHeight = 660
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PIp: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object PIPL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LIP: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        Caption = 'IP-'#1072#1076#1088#1077#1089' Sim'
        Layout = tlCenter
        ExplicitLeft = 90
        ExplicitWidth = 63
        ExplicitHeight = 13
      end
    end
    object PIPV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object jvIPLTE: TJvIPAddress
        Left = 15
        Top = 11
        Width = 154
        Height = 21
        Address = 0
        ParentColor = False
        TabOrder = 0
        OnChange = jvIPLTEChange
      end
      object bbGetFromDevice: TsBitBtn
        Left = 192
        Top = -1
        Width = 91
        Height = 36
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089' '#1084#1086#1076#1077#1084#1072
        TabOrder = 1
        OnClick = bbGetFromDeviceClick
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 0
        Images = sAlphaImageList1
      end
    end
  end
  object PSerial: TPanel
    Left = 0
    Top = 41
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object PSerialL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LSeral: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
      end
    end
    object PSerialV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ESerial: TEdit
        Left = 15
        Top = 11
        Width = 242
        Height = 21
        Color = clWhite
        TabOrder = 0
      end
    end
  end
  object PFirmware: TPanel
    Left = 0
    Top = 123
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object PFirmwareL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LFirmware: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1042#1077#1088#1089#1080#1103' '#1055#1054
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
      end
    end
    object PFirmwareV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object cbFirmware: TComboBox
        Left = 15
        Top = 11
        Width = 242
        Height = 21
        TabOrder = 0
      end
    end
  end
  object PLTEModel: TPanel
    Left = 0
    Top = 82
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object PLTEModelL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LLTEModel: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1052#1086#1076#1077#1083#1100' '
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
      end
    end
    object PLTEModelV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object cbLTEModel: TComboBox
        Left = 15
        Top = 11
        Width = 242
        Height = 21
        TabOrder = 0
      end
    end
  end
  object GBInnerModem: TGroupBox
    Left = 0
    Top = 246
    Width = 502
    Height = 141
    Align = alTop
    Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1084#1086#1076#1077#1084
    TabOrder = 6
    object PModemSerial: TPanel
      Left = 2
      Top = 15
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object PmodemSerialL: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LModemSerial: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = -1
        end
      end
      object PModemSerialv: TPanel
        Left = 153
        Top = 0
        Width = 345
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object EModemSerial: TEdit
          Left = 13
          Top = 11
          Width = 242
          Height = 21
          TabOrder = 0
        end
      end
    end
    object PModemModel: TPanel
      Left = 2
      Top = 97
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object PModemModelL: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LModemModel: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1052#1086#1076#1077#1083#1100
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 9
          ExplicitTop = -16
          ExplicitWidth = 129
        end
      end
      object PModemModelV: TPanel
        Left = 153
        Top = 0
        Width = 345
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cbModemModel: TComboBox
          Left = 15
          Top = 11
          Width = 242
          Height = 21
          TabOrder = 0
        end
      end
    end
    object PModemIMEI: TPanel
      Left = 2
      Top = 56
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PModemIMEIL: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LModemIMEI: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'IMEI'
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 9
          ExplicitTop = -16
          ExplicitWidth = 129
        end
      end
      object PModemIMEIV: TPanel
        Left = 153
        Top = 0
        Width = 345
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object MEModemIMEI: TJvMaskEdit
          Left = 15
          Top = 9
          Width = 238
          Height = 21
          CheckOnExit = False
          EditMask = '!000000000000000;0;_'
          MaxLength = 15
          TabOrder = 0
        end
      end
    end
  end
  object PIPTun: TPanel
    Left = 0
    Top = 164
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object PIPTunL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LIPTun: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'IP '#1090#1091#1085#1085#1077#1083#1103
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
      end
    end
    object PIPTunV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object jvIPTun: TJvIPAddress
        Left = 15
        Top = 11
        Width = 242
        Height = 21
        Address = 0
        ParentColor = False
        TabOrder = 0
      end
    end
  end
  object PDeviceName: TPanel
    Left = 0
    Top = 205
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object PDeviceNameL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LDeviceName: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1048#1084#1103' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
      end
    end
    object PDeviceNameV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object EDeviceName: TEdit
        Left = 15
        Top = 11
        Width = 242
        Height = 21
        TabOrder = 0
      end
    end
  end
  object GBMAC: TGroupBox
    Left = 0
    Top = 387
    Width = 502
    Height = 141
    Align = alTop
    Caption = 'MAC-'#1072#1076#1088#1077#1089#1072
    TabOrder = 7
    object PMACeth01: TPanel
      Left = 2
      Top = 15
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object PMACeth01L: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LMACeth01: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'eth01'
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = -1
        end
      end
      object PMACeth01V: TPanel
        Left = 153
        Top = 0
        Width = 345
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object MEMACeth01: TJvMaskEdit
          Left = 15
          Top = 11
          Width = 238
          Height = 21
          CheckOnExit = False
          CharCase = ecUpperCase
          EditMask = '!>AA:AA:AA:AA:AA:AA;1;_'
          MaxLength = 17
          TabOrder = 0
          Text = '  :  :  :  :  :  '
        end
      end
    end
    object PMACvpn: TPanel
      Left = 2
      Top = 97
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object PMACvpnL: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LMACvpn: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'vpn'
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 9
          ExplicitTop = -16
          ExplicitWidth = 129
        end
      end
      object PMACvpnV: TPanel
        Left = 153
        Top = 0
        Width = 345
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object MEMACvpn: TJvMaskEdit
          Left = 15
          Top = 11
          Width = 238
          Height = 21
          CheckOnExit = False
          CharCase = ecUpperCase
          EditMask = '!>AA:AA:AA:AA:AA:AA;1;_'
          MaxLength = 17
          TabOrder = 0
          Text = '  :  :  :  :  :  '
        end
      end
    end
    object PMACeth02: TPanel
      Left = 2
      Top = 56
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PMACeth02L: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LMACeth02: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'eth02'
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = 9
          ExplicitTop = -16
          ExplicitWidth = 129
        end
      end
      object PMACeth02V: TPanel
        Left = 153
        Top = 0
        Width = 345
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object MEMACEth02: TJvMaskEdit
          Left = 15
          Top = 11
          Width = 238
          Height = 21
          CheckOnExit = False
          CharCase = ecUpperCase
          EditMask = '!>AA:AA:AA:AA:AA:AA;1;_'
          MaxLength = 17
          TabOrder = 0
          Text = '  :  :  :  :  :  '
        end
      end
    end
  end
  object PPlaceInstall: TPanel
    Left = 0
    Top = 528
    Width = 502
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 8
    object PPlaceInstallL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LPlaceInstall: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1052#1077#1089#1090#1086#1085#1072#1093#1086#1078#1076#1077#1085#1080#1077
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
      end
    end
    object PPlaceInstallV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object EPlaceInstall: TEdit
        Left = 15
        Top = 11
        Width = 242
        Height = 21
        TabOrder = 0
      end
    end
  end
  object PComment: TPanel
    Left = 0
    Top = 569
    Width = 502
    Height = 43
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 9
    object PCommentL: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 43
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LComment: TLabel
        Left = 0
        Top = 0
        Width = 153
        Height = 43
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = -16
        ExplicitWidth = 129
        ExplicitHeight = 41
      end
    end
    object PCommentV: TPanel
      Left = 153
      Top = 0
      Width = 349
      Height = 43
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object MComment: TMemo
        Left = 15
        Top = 0
        Width = 334
        Height = 43
        Align = alRight
        TabOrder = 0
      end
    end
  end
  object PButtons: TPanel
    Left = 0
    Top = 612
    Width = 502
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 10
    object bbok: TBitBtn
      Left = 88
      Top = 16
      Width = 105
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Kind = bkOK
      TabOrder = 0
      OnClick = bbokClick
    end
    object bbCancel: TBitBtn
      Left = 305
      Top = 16
      Width = 105
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      TabOrder = 1
    end
  end
  object connMySQL: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=modular;Persist Security Info=True;U' +
      'ser ID=mms;Data Source=mysql_ubiquiti;Initial Catalog=ubiquiti'
    LoginPrompt = False
    Left = 8
  end
  object QueryLTE1: TADOQuery
    Connection = connMySQL
    CursorType = ctStatic
    Parameters = <>
    Left = 8
    Top = 88
  end
  object sAlphaImageList1: TsAlphaImageList
    Items = <
      item
        ImageFormat = ifPNG
        ImageName = 'application_get'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000003374944415478DABC574F48544118FFCDBC79BBDB0A8975
          0932918E42D0A12208A44E519B646175F4D02DD0A0534819A859D7F2D0A50E5D
          B5C84D4CE890505D1222E8B0D54941CB407315C96AFFCCF47DEFBDDDB7AE9BD4
          BAD3F06667BF99E17DBFF9CDF7FD669E00A076F73D1BCD099930C600F4582D82
          1E21A08C1EFFDC7BB25D51D7B61C6462E0D421E4B5861476FD6B5AA02325AE8D
          4D25D8370388E58DC6F6A883EEF1592847C0160626379737B89B6806FB64DF0C
          4030AAFAA8C2DE9D31B844812D16D84F967ED897F6B75A3000A2DE10170E76D5
          C5881EBB5B90D7F07CE503041E802C75B63645A936E17F95AC4608200083542A
          45FB443160690B38C9047968696929FA54A51394EBC20869350885D1EBFA5438
          04B80E9904C02A822200B39101C7757C00368B1195184091016319C01FB62060
          40292F08ED2AB1DC8C0107DA32005976D8A89278F018B07C1484EB2F4DC30226
          450AA52D9F8605993795B6405110E62D0370CA282E1322E59F4C5B0A32E19DF7
          9E9C92F4F11DC394ECBB23374943E9B00E540F40B08A8ACA126C82F4936500E4
          8624A1CB42B5B5E0BC2FD98E7D3DC26B7D6028CE2997D99AAB4E7FB203E96F49
          3CBF32E2B56CFF5556D4C6F9392C2D3FC6A5E34378F5A1DB6BD9E67EEB000692
          E7915E7D84CEA33D78F1B10BE9CCBCD7B2CDFD3C6E0DC0CDA717B0BC36828EC3
          9D989A1E84A4D0962EBC966DEEE7719E1706ACA80D8081E419AC6686D176F018
          3E2D3EF41C736E09C76FD9E67E1EE779B7C7CEAE03A04AD5A99A32FC6614F108
          F03A35E965FB9D8B5D783737E4A51E07FCFEC62E5C7E30447F2791A34CCCE49E
          E06A5B980BCA3F84AA27E2FD60A81BADFD023FCD3C8C1B8EB3CDEAF7F2FA7A7D
          7165C88089233B5B7F63624F96AEACFF22844CA3273EE07B44038EC468857281
          DE1ECE619B3E3910EF7D4B1A97E62F03724EB6A35757020099AF7DA78914ECD8
          624CB8915B98F8251721A2850B20C07684DEFAA3FFC009BE0C17C4919C339A0C
          0358A33A43F50BB6761B6C90B4D25C6409D1BA1000DBDC4F651ABED3223954BF
          AB00D54A4DAE9C79CCDDBB3FDFA84B6E5D52520C68CCD1DF25AA0B15BE556B56
          EAA93657D84A1D389FA9B4D05A02E0D08B538D94BDD70474AF95C440B1FC1660
          004EAB1C4737718DC70000000049454E44AE426082}
      end>
    Left = 24
    Top = 160
    Bitmap = {}
  end
end
